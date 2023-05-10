defmodule Fxdatapi.MixProject do
  use Mix.Project

  @source_url "https://github.com/moatsystems/fxdatapi-ex"
  @version "0.1.4"

  def project do
    [
      app: :fxdatapi,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps(),
      name: "Fxdatapi",
      source_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib"]
  defp elixirc_paths(_env), do: ["lib"]

  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      {:httpoison, "~> 1.8"},
      {:poison, "~> 4.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp docs do
    [
      source_url: @source_url,
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp description() do
    "An Elixir package to interact with the Currency API."
  end

  defp package() do
    [
      name: "fxdatapi",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["BSD 3-Clause"],
      links: %{"GitHub" => "https://github.com/moatsystems/fxdatapi-ex"}
    ]
  end
end
