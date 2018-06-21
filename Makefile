# Author: Peter Dobler (@Juppit)
#

all:
	make gcc-xtensa

gcc-xtensa:
	@echo
	@echo "#### load sources..."
	wget -cq https://github.com/jcmvbkbc/gcc-xtensa/archive/master.zip
    ifeq ($(shell uname -s),Linux)
	@echo
	@echo "#### linux unzip..."
	unzip -q master.zip -d xtensa-unzip
	@echo
	@echo "#### linux bsdtar..."
	-mkdir xtensa-bsdtar && bsdtar -xf master.zip -C xtensa-bsdtar
	@echo
	@echo "#### repair ..."
	zip -FF master.zip --out=xtensa-repaired.zip > repair.log
	tail repair.log
	@echo
	@echo "#### bsdtar again..."
	-mkdir xtensa-repaired && bsdtar -xf xtensa-repaired.zip -C xtensa-repaired
	@echo
	@echo "#### show files..."
	ls -l . xtensa-unzip xtensa-bsdtar xtensa-repaired 
	@echo
	@echo "#### show versions..."
	bsdtar --version
	unzip -v
    else
	@echo
	@echo "$(shell uname -s) bsdtar..."
	mkdir xtensa-master && bsdtar -xf master.zip -C xtensa-master
	@echo
	@echo "#### show files..."
	ls -l . xtensa-master
    endif
