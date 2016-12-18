defmodule CliTest do
  use ExUnit.Case

  import LineCounter.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
  end

  test "values returned if it's a list of names" do
    assert parse_args(["a", "b"]) == ["a", "b"]
  end

  test "current folder '.' returned if no value given" do
    assert parse_args([]) == ["."]
  end
end
