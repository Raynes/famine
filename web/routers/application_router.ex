defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
  end

  forward "/auth", to: OAuthRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end
end

