defmodule Stack.Mixfile do
  use Mix.Project

  def project do
    [
      app: :stack,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      preferred_cli_env: [espec: :test],
    ]
  end

  def application do
    [
      applications: [:logger],
      mod: {Stack, []},
      registered: [Stack.Server],
    ]
  end

  defp deps do
    [
      {:espec, ">= 0.1.1", only: :test},
    ]
  end
end
