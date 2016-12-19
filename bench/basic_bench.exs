defmodule BasicBench do
  use Benchfella

  bench "./mix.exs bench" do
    LineCounter.CLI.run(["./mix.exs"])
  end

  bench ". bench" do
    LineCounter.CLI.run(["."])
  end
end
