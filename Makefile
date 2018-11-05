MAKEFLAGS += --silent
main = main
ext = f08
compiler = gfortran
flags = -std=f2008 -pedantic
src = source
obj = build
src_mod = $(src)/modules
obj_mod = $(obj)/modules

modules_src = $(wildcard $(src_mod)/*.$(ext))
modules_obj = $(patsubst $(src_mod)/%.$(ext), $(obj_mod)/%.o, $(modules_src))

$(shell mkdir -p $(obj_mod))

executable = $(obj)/$(main).bin


$(executable): $(obj)/$(main).o $(modules_obj)
	$(compiler) $(flags) -o $(@) $(^)

$(obj)/$(main).o: $(src)/$(main).$(ext) $(modules_obj)
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)

$(obj_mod)/%.o: $(src_mod)/%.$(ext)
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)


.PHONY: clean cleanall test testclean testcleanall

clean:
	rm -f $(obj)/*.o
	rm -f $(obj_mod)/*.{o,mod,smod}

cleanall:
	rm -rf $(obj)

test:
	$(MAKE) -C test

testclean:
	$(MAKE) -C test clean

testcleanall:
	$(MAKE) -C test cleanall
