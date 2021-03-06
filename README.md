# hipfind

hipfind is a command-line utility tool to find file and directory names.

I can't guarantee this will run faster than `find`, and it has far fewer features than `find`, but here are some emojis:

- Guaranteed :boom:
- Works in :sunny: and :cloud:
- Written in Haskell which is totally :fire: right now
- Be a star and give this repo a :star:

## Install

hipfind is written in Haskell, so to build it I recommend `stack`.

```
stack build --copy-bins
```

This will install the binary to your `~/.local/bin` directory.

## Benchmarking

The benchmarking metric I have used is `bucket loads of create-react-app's node-modules`. 

I've also benchmarked different internal data structure representations of hipfind.

*N.B. In order to use this benchmark, you have to clear your disk cache on Unix before each command.

```
sync; echo 3 > /proc/sys/vm/drop_caches
```

This command will clear the PageCache, dentries, and inodes caches. Then you can run the benchmarks.

### Run the benchmark tests

This is already implemented in the `benchmarks.sh` script, so you can just run that as sudo to run the benchmarks. These tests will output the time taken to relevant logs in the `benchmarks` directory.

Each benchmark is run 10 times per test to strike a balance between benchmarking times and outliers.

## Benchmark Output

### 1 bucket load of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|find|5.18|
|hipfind using Strings||
|hipfind using Text|4.70|

### 2 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|find|7.58|
|hipfind using Strings||
|hipfind using Text|7.98|

### 3 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|find|10.53|
|hipfind using Strings||
|hipfind using Text|16.60|

### 5 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|find|18.07|
|hipfind using Strings||
|hipfind using Text|39.85|

### 12 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|find|45.69|
|hipfind using Strings||
|hipfind using Text|131|

