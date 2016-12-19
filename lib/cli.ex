defmodule LineCounter.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that do the counting
  """

  def main(argv) do
    argv
      |> run
      |> IO.puts
  end

  def run(argv) do
    argv
      |> parse_args
      |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help.

  Otherwise they are a list of path name(which can be a file name or a folder name).
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ],
                                     aliases: [ h: :help ])
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [], _ } -> ["."]
      { _, paths, _ } -> paths
    end
  end

  def process(:help) do
    IO.puts """
    usage: line_counter [ file_name | folder_name ]
    """
    System.halt(0)
  end

  def process(paths) do
    LineCounter.process(paths)
  end
end
