COMPILER = gcc

FLAGS = -Iinclude -g -Wall -Wunused -Wextra

SRC = src
SRCS = $(wildcard $(SRC)/*.cpp)

INC = src

OBJ = obj
OBJS = $(patsubst $(SRC)/%.cpp, $(OBJ)/%.o, $(SRCS))

BINDIR = bin
BIN = $(BINDIR)/Debug/main

PROMPT = Make

all: $(BIN)

$(OBJ)/%.o: $(SRC)/%.cpp
	$(COMPILER) -c $^ -o $@

$(BIN): $(OBJS)
	$(COMPILER) $(FLAGS) $(OBJS) -g -o $@

run:
	./bin/Debug/main

release:
	rm -rf $(BINDIR)/Release/* obj/*
	$(COMPILER) $(FLAGS) -O3 -c $(SRCS)
	mv *.o obj/.
	$(COMPILER) $(OBJS) -O3 -o $(BINDIR)/Release/main

clean:
	rm -r $(OBJS) $(BINDIR)/Debug/* $(BINDIR)/Release/*
