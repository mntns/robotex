defmodule Robotex.Mixfile do
  use Mix.Project

  def project do
    [app: :robotex,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:exjsx, "~> 3.1.0"},
     {:httpoison, "~> 0.7"},
     {:inch_ex, only: :docs}]
  end

  defp description do
    """
    Robotex is a client for the Telegram Bot API.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Eddy Shure"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/EddyShure/robotex"}
    ]
  end
end
