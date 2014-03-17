default: bin/primegen

bin/primegen: primegen.hs bin
	ghc -o bin/primegen primegen.hs -O2 -threaded

bin/primegen-prof: primegen.hs bin
	ghc -o bin/primegen-prof -prof -fprof-auto primegen.hs

bin:
	mkdir -p ./ bin
