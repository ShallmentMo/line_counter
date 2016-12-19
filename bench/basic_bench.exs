defmodule BasicBench do
  use Benchfella

  bench "./mix.exs bench(result is 33)" do
    LineCounter.CLI.run(["./mix.exs"])
  end

  bench ". bench(result is 3979)" do
    LineCounter.CLI.run(["."])
  end

  bench "../plug bench(result is 10638)" do
    LineCounter.CLI.run(["../plug"])
  end

  bench "../phoenix bench(result is 26020)" do
    LineCounter.CLI.run(["../phoenix"])
  end

  bench "../elixir bench(result is 133717)" do
    LineCounter.CLI.run(["../elixir"])
  end
end
