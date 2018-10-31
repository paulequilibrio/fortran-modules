MAKEFLAGS += --silent
main = files
ext = f08
executable = $(main).bin
compiler = gfortran
flags = -std=f2008
src = ./source
obj = ./object

src_mod = $(src)/modules
obj_mod = $(obj)/modules
modules_src = $(wildcard $(src_mod)/*.$(ext))
modules_obj = $(patsubst $(src_mod)/%.$(ext), $(obj_mod)/%.o, $(modules_src))

$(executable): $(obj)/$(main).o $(modules_obj)
	$(compiler) $(flags) -o $(@) $(?)

$(obj)/$(main).o: $(src)/$(main).$(ext) $(modules_obj)
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)

$(obj_mod)/%.o: $(src_mod)/%.$(ext) makedir
	$(compiler) $(flags) -J$(obj_mod) -c $(<) -o $(@)

makedir:
	$(shell mkdir -p $(obj_mod))

.PHONY: clean, cleanall
clean:
	rm -f $(obj)/*.o
	rm -f $(obj_mod)/*.{o,mod}
cleanall: clean
	rm -f $(executable)
# rm -rf $(obj)
