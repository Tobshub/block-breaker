
main:
	clang++ -std=c++20 -Wall -I./external/raylib/include main.cpp -o out -lraylib
	./out

run:
	./out

clean:
	rm ./out
