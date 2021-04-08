defmodule Finger.MixProject do
  use Mix.Project

  def project do
    [
      app: :finger,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
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
end
