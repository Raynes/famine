defmodule Famine.Mixfile do
  use Mix.Project

  def project do
    [ app: :famine,
      version: "0.0.1",
      dynamos: [Famine.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/famine/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo, :ssl, :inets],
      mod: { Famine, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :mongoex, "~> 0.0.1", github: "mururu/mongoex" },
      { :simple_oauth2, "~> 1.0.0", github: "virtan/simple_oauth2" },
      { :etoml, "~> 0.1", github: "kalta/etoml" } ]
  end
end
