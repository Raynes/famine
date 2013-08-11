defmodule Famine.Config do
  def get_config(sub // nil) do
    {:ok, config} = :etoml.parse File.read! "priv/config.toml"
    if sub do
      config[sub]
    else
      config
    end
  end
end
