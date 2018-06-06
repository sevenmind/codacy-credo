defmodule CodacyCredo.MixProject do
  use Mix.Project

  def project do
    [
      app: :codacy_credo,
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: Coverex.Task],
      deps: deps(),
      aliases: [
        test: "test --no-start"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Codacy.Credo, []},
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.9"},
      {:poison, "~> 3.1"},
      {:distillery, "1.5.2", runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
      {:inch_ex, "~> 0.5.3", only: [:dev, :test]},
      {:coverex, "~> 1.4.9", only: :test}
    ]
  end
end
