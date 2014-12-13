# match "module foobar() { // `make` me"
SCADS = $(wildcard *.scad)
STLS = $(patsubst %.scad,%.stl,$(SCADS))

all: $(STLS)

%.stl: %.scad
	openscad -m make -o $@ $<