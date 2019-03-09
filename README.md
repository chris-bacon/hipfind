# hipfind

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

## Benchmark Output

### 1 bucket load of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|Find||
|Hipfind using Strings||
|Hipfind using Text||

### 2 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|Find|7.59|
|Hipfind using Strings||
|Hipfind using Text|8.30|

### 3 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|Find|10.26|
|Hipfind using Strings||
|Hipfind using Text|17.02|

### 5 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|Find|17.85|
|Hipfind using Strings||
|Hipfind using Text|39.89|

### 12 bucket loads of node-modules of create-react-app

|Command|Time (sec)|
|---|---|
|Find|44.71|
|Hipfind using Strings||
|Hipfind using Text|113.84|

