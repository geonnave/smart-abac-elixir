# Copyright (C) 2022 Geovane Fedrecheski <geonnave@gmail.com>
#               2022 Universidade de São Paulo
#               2022 LSI-TEC
#
# This file is part of the SwarmOS project, and it is subject to
# the terms and conditions of the GNU Lesser General Public License v2.1.
# See the file LICENSE in the top level directory for more details.

defmodule SmartABAC.MixProject do
  use Mix.Project

  @version "0.3.0"

  def project do
    [
      app: :smart_abac,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex.pm metadata
      description: description(),
      package: package(),
      docs: docs(),
      source_url: "https://github.com/geonnave/smart-abac-elixir",
      homepage_url: "https://github.com/geonnave/smart-abac-elixir"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SmartABAC.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cbor, "~> 1.0"},
      {:ecto, "~> 3.10"},
      {:ex_machina, "~> 2.7", only: :test},
      {:tzdata, "~> 1.1"},
      {:jason, "~> 1.4"},
      {:decorator, "~> 1.4"},

      # Docs dependencies
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Smart Attribute-Based Access Control (SmartABAC) implementation in Elixir.
    Provides a flexible and extensible framework for policy-based authorization
    with support for hierarchical attributes and context-aware decisions.
    """
  end

  defp package do
    [
      maintainers: ["Geovane Fedrecheski"],
      licenses: ["LGPL-2.1"],
      links: %{
        "GitHub" => "https://github.com/geonnave/smart-abac-elixir",
        "Changelog" => "https://github.com/geonnave/smart-abac-elixir/blob/master/CHANGELOG.md"
      },
      files: ~w(lib priv mix.exs README.md LICENSE)
    ]
  end

  defp docs do
    [
      main: "SmartABAC",
      source_ref: "v#{@version}",
      source_url: "https://github.com/geonnave/smart-abac-elixir",
      extras: ["README.md"]
    ]
  end
end
