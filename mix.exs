defmodule IframeHeaders.Mixfile do
  use Mix.Project

  def project do
    [app: :iframe_headers,
     description: "Set HTTP headers to work inside an iframe.",
     package: package,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :plug, :cowboy]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0"},
     {:plug, "~> 1.2"},
     {:earmark, "~> 1.0", only: :dev},
     {:ex_doc, "~> 0.13.2", only: :dev}]
  end

  defp package do
    [maintainers: ["Francesc Leveque"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/fleveque/iframe_headers"},
     files: ~w(lib mix.exs README.md)]
  end
end
