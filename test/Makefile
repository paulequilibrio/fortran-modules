MAKEFLAGS += --silent
main = driver
ext = f08
compiler = gfortran
flags = -std=f2008 -pedantic
src = ../source
obj = build
src_mod = $(src)/modules
obj_mod = $(obj)/modules

modules_src = $(wildcard $(src_mod)/*.$(ext))
modules_obj = $(patsubst $(src_mod)/%.$(ext), $(obj_mod)/%.o, $(modules_src))
test_src = $(wildcard *_test.$(ext))
test_obj = $(patsubst %_test.$(ext), $(obj_mod)/%_test.o, $(test_src))

$(shell mkdir -p $(obj_mod))

executable = $(obj)/$(main).bin


default: $(executable)
	$(executable)

$(executable): $(obj)/$(main).o $(test_obj) $(modules_obj) $(obj_mod)/fruit.o
	$(compiler) $(flags) -J$(obj_mod) -o $(@) $(^)

$(obj)/$(main).o: $(main).$(ext) $(test_obj)
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)

$(obj_mod)/%_test.o: %_test.$(ext) $(modules_obj) $(obj_mod)/fruit.o
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)

$(obj_mod)/%.o: $(src_mod)/%.$(ext)
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)

$(obj_mod)/fruit.o: fruit/fruit.f08
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)


.PHONY: clean cleanall

clean:
	rm -f $(obj)/*.o
	rm -f $(obj_mod)/*.{o,mod,smod}

cleanall:
	rm -rf $(obj)
