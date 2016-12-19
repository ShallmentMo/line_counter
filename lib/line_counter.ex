defmodule LineCounter do
  def process(paths) do
    paths
      |> Enum.map(&(process_single(&1)))
      |> Enum.reduce(0, fn(x, acc) -> x + acc end)
  end

  def process_single(path) do
    case File.dir?(path) do
      true -> process_single_folder(path)
      false -> process_single_file(path)
    end
  end

  def process_single_file(path) do
    count_line(path)
  end

  def process_single_folder(path) do
    file_line_count = path
      |> all_files
      |> Enum.map(&(count_line(&1)))
      |> Enum.reduce(0, fn(x, acc) -> x + acc end)

    me = self

    folder_line_count = path
      |> all_folders
      |> Enum.map(fn (elem) ->
           spawn_link fn -> (send me, { self, process_single(elem) }) end
        end)
      |> Enum.map(fn (pid) ->
           receive do { ^pid, result } -> result end
        end)
      |> Enum.reduce(0, fn(x, acc) -> x + acc end)

    file_line_count + folder_line_count
  end

  def all_files(path) do
    path
      |> File.ls
      |> file_list
      |> Enum.map(&(path <> "/" <> &1))
      |> Enum.filter(&(!File.dir?(&1)))
  end

  def all_folders(path) do
    path
      |> File.ls
      |> file_list
      |> Enum.map(&(path <> "/" <> &1))
      |> Enum.filter(&(File.dir?(&1)))
  end

  def file_list({:ok, list}) do
    list |> Enum.filter(&(!Regex.match?(~r/^\./, &1)))
  end

  def file_list(_) do
    []
  end

  def count_line(file) do
    case File.read(file) do
      { :ok, lines } ->
        lines
          |> String.split("\n")
          |> Enum.filter(&(String.length(&1) > 0))
          |> length
      _ -> 0
    end
  end
end
