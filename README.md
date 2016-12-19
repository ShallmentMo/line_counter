# LineCounter

## Description

At the beginning, I just want to know how many lines of code in [plug](https://github.com/elixir-lang/plug). Then I think why not use elixir to write a tool to count that. So we got this.

Now this is the first step: it can count the lines. But it still have so many things to do. Here is something I can think of:

* should use processes to do concurrent
* maybe we can benchmark about this and others
* public to hex.pm and can build cmd which can be used in shell.

## Benchamarking

```
$ mix deps.get
$ MIX_ENV=bench mix compile
$ MIX_ENV=bench mix bench
```

### my computer infos

```
MacBook Pro (Retina, 13-inch, Early 2015)
Processor 2.7 GHz Intel Core i5
Memory 8 GB 1867 MHz DDR3
```

### with commit `7a93ccd97124832317a9eb9a49365b17262869f0`

```
Settings:
  duration:      1.0 s

## BasicBench
[23:54:13] 1/5: . bench(result is 3979)
[23:54:17] 2/5: ../elixir bench(result is 133717)
[23:54:19] 3/5: ../phoenix bench(result is 26020)
[23:54:23] 4/5: ../plug bench(result is 10638)
[23:54:26] 5/5: ./mix.exs bench(result is 33)

Finished in 15.04 seconds

## BasicBench
benchmark name                     iterations   average time
./mix.exs bench(result is 33)           10000   197.57 µs/op
. bench(result is 3979)                    50   56657.64 µs/op
../plug bench(result is 10638)             50   59042.14 µs/op
../phoenix bench(result is 26020)          10   199679.90 µs/op
../elixir bench(result is 133717)           2   787376.00 µs/op
```

### with commit `98718034c9dccdc8babc0f351378b29e3c867331`

```
Settings:
  duration:      1.0 s

## BasicBench
[23:53:07] 1/5: . bench(result is 3979)
[23:53:09] 2/5: ../elixir bench(result is 133717)
[23:53:11] 3/5: ../phoenix bench(result is 26020)
[23:53:13] 4/5: ../plug bench(result is 10638)
[23:53:16] 5/5: ./mix.exs bench(result is 33)

Finished in 12.15 seconds

## BasicBench
benchmark name                     iterations   average time
./mix.exs bench(result is 33)           10000   193.09 µs/op
. bench(result is 3979)                    50   39007.82 µs/op
../plug bench(result is 10638)             50   53664.90 µs/op
../phoenix bench(result is 26020)          10   154178.90 µs/op
../elixir bench(result is 133717)           2   528516.00 µs/op
```

## Others

Thanks to *Programming Elixir*, I learned a lot from it.

This is a gift to Xuxiao, hoping it's qualified.
