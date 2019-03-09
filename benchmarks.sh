clearCache() {
  sudo sync; sudo echo 3 > /proc/sys/vm/drop_caches
}

runFindBench() {
  /usr/bin/time --output=benchmarks/$1-reacts-find.log --append find ./benchmarking-react/$1-react-create-app/node_modules -name "yargs"
}

runHifindBench() {
  /usr/bin/time --output=benchmarks/$1-reacts-hipfind.log --append hipfind ./benchmarking-react/$1-react-create-app/node_modules -name "yargs" +RTS -N
}

NUMTESTS=10

##############
## Find tests
##############
for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runFindBench 1
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runFindBench 2
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runFindBench 3
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runFindBench 5
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runFindBench 12
done

##############
## Hipfind Tests
##############
for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runHipfindBench 1
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runHipfindBench 2
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runHipfindBench 3
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runHipfindBench 5
done

for n in $(seq 1 $NUMTESTS)
do
  echo "runnng test $n"
  clearCache
  runHipfindBench 12
done

