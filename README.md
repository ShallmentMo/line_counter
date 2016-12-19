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
[23:15:09] 1/2: . bench(the result is 33)
[23:15:11] 2/2: ./mix.exs bench(the result is 3528)

Finished in 4.12 seconds

## BasicBench
benchmark name   iterations   average time
./mix.exs bench       10000   158.36 µs/op
. bench                  50   38179.26 µs/op
```

## Others

Thanks to *Programming Elixir*, I learned a lot from it.

This is a gift to Xuxiao, hoping it's qualified.
