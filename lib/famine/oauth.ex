defmodule Famine.Oauth do
  import Dynamo.HTTP.Redirect, only: [redirect: 2]

  def authenticate(conn) do
    path = conn.path_segments |> Enum.drop(1) |> Enum.join("/")
    path = "#{path}?#{conn.query_string}"
    prefix = "#{conn.scheme}://#{conn.host}"
    prefix = if conn.port != 80 do "#{prefix}:#{conn.port}" else prefix end
    config = Famine.Config.get_config "oauth"
    networks = :simple_oauth2.customize_networks(:simple_oauth2.predefined_networks,
      [{"google", [client_id: config["client_id"], client_secret: config["client_secret"]]}])
    case :simple_oauth2.dispatcher(path, prefix, networks) do
      {:redirect, where} -> redirect conn, to: :simple_oauth2.gather_url_get(where)
      {:send_html, html} -> conn.resp(200, html)
      {:ok, auth} -> conn.resp(200, inspect(auth))
      {:error, class, reason} -> conn.resp(200, "#{inspect(class)} #{inspect(reason)}")
    end
  end
end
