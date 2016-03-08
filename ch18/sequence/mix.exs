defmodule Sequence.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sequence,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
    ]
  end

  def application do
    [
      applications: [:logger],
      mod: {Sequence, 42},
      registered: [Sequence.Server],
    ]
  end

  defp deps do
    []
  end
end
