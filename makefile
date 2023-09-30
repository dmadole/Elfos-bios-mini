PROJECT = bios

$(PROJECT): $(PROJECT).asm
	rcasm -l -v -x -d 1802 bios 2>&1 | tee bios.lst

pico: $(PROJECT).asm
	echo Building for Pico/Elf
	rcasm -l -v -x -d 1802 -DPICOELF bios 2>&1 | tee bios.lst

elf2k: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -DELF2K bios 2>&1 | tee bios.lst

mc: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -DMC bios 2>&1 | tee bios.lst

mchip: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -DMCHIP bios 2>&1 | tee bios.lst

mini: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -D1802MINI bios 2>&1 | tee bios.lst

bigmini: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -D1802MINI -DEXPANDER bios 2>&1 | tee bios.lst

superelf: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -DSUPERELF bios 2>&1 | tee bios.lst

rc1802: $(PROJECT).asm
	rcasm -l -v -x -d 1802 -DRC1802 bios 2>&1 | tee bios.lst

clean:
	-rm $(PROJECT).prg

