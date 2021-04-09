defmodule Finger.MixProject do
  use Mix.Project

  def project do
    [
      app: :finger,
      version: "0.1.4",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),

      # Docs
      name: "Finger",
      source_url: "https://github.com/ykurtbas/elixir-finger",
      homepage_url: "https://elxsy.com",
      docs: [
        main: "Finger",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description: "Finger is a verification library to prove hommaannnnnness of a user",
      files: ["assets", "lib", "mix.exs", "README.md"],
      maintainers: ["Yuksel"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/ykurtbas/elixir-finger",
        "Elxsy" => "https://elxsy.com"
      }
    ]
  end
end
