# Detect OS and CPU
uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
machine := $(shell sh -c "$(CC) -dumpmachine || echo unknown")

# Specify BACKEND=V4L2 or BACKEND=LIBUVC to build a specific backend
BACKEND := V4L2

ifeq ($(uname_S),Darwin)
# OSX defaults to libuvc instead of V4L
BACKEND := LIBUVC
endif

# Sets of flags used by the example programs
REALSENSE_FLAGS := -lrealsense -lm

# Aliases for convenience
all: all-tests

install:
	install -m755 -d $(DESTDIR)/bin
	cp bin/tests/* $(DESTDIR)/bin

uninstall:
	rm -rf $(DESTDIR)/bin

clean:
	rm -rf bin

# rules for tests

.PHONY: all-tests all clean

all-tests: F200-live-test LR200-live-test R200-live-test SR300-live-test ZR300-live-test

%-test: unit-tests/*
	mkdir -p bin/tests
	$(CXX) unit-tests/*.cpp -std=c++11 -o bin/tests/$@ $(CXXFLAGS) $(LDFLAGS) -D$(if $(findstring live,$@),LIVE_TEST,OFFLINE_TEST) -D$(firstword $(subst -, ,$@))_TEST -DMAKEFILE $(REALSENSE_FLAGS)
