#COMAKE2 edit-mode: -*- Makefile -*-
####################64Bit Mode####################
ifeq ($(shell uname -m),x86_64)
CC=gcc
CXX=g++
CXXFLAGS=-g \
  -pipe \
  -W \
  -Wall \
  -fPIC
CFLAGS=-g \
  -pipe \
  -W \
  -Wall \
  -fPIC
CPPFLAGS=-D_GNU_SOURCE \
  -D__STDC_LIMIT_MACROS \
  -DVERSION=\"1.9.8.7\"
INCPATH=-I. \
  -I./include \
  -I./output \
  -I./output/include
DEP_INCPATH=-I../../lib2-64/ullib \
  -I../../lib2-64/ullib/include \
  -I../../lib2-64/ullib/output \
  -I../../lib2-64/ullib/output/include

#============ CCP vars ============
CCHECK=@ccheck.py
CCHECK_FLAGS=
PCLINT=@pclint
PCLINT_FLAGS=
CCP=@ccp.py
CCP_FLAGS=


#COMAKE UUID
COMAKE_MD5=9917716f0ce79e4c575a50587e19221d  COMAKE


.PHONY:all
all:comake2_makefile_check sort 
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mall[0m']"
	@echo "make all done"

.PHONY:comake2_makefile_check
comake2_makefile_check:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mcomake2_makefile_check[0m']"
	#in case of error, update 'Makefile' by 'comake2'
	@echo "$(COMAKE_MD5)">comake2.md5
	@md5sum -c --status comake2.md5
	@rm -f comake2.md5

.PHONY:ccpclean
ccpclean:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mccpclean[0m']"
	@echo "make ccpclean done"

.PHONY:clean
clean:ccpclean
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mclean[0m']"
	rm -rf sort
	rm -rf ./output/bin/sort
	rm -rf sort_main.o

.PHONY:dist
dist:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mdist[0m']"
	tar czvf output.tar.gz output
	@echo "make dist done"

.PHONY:distclean
distclean:clean
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mdistclean[0m']"
	rm -f output.tar.gz
	@echo "make distclean done"

.PHONY:love
love:
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40mlove[0m']"
	@echo "make love done"

sort:sort_main.o
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msort[0m']"
	$(CXX) sort_main.o -Xlinker "-("  ../../lib2-64/ullib/lib/libullib.a -lpthread \
  -lcrypto \
  -lrt -Xlinker "-)" -o sort
	mkdir -p ./output/bin
	cp -f --link sort ./output/bin

sort_main.o:main.cpp
	@echo "[[1;32;40mCOMAKE:BUILD[0m][Target:'[1;32;40msort_main.o[0m']"
	$(CXX) -c $(INCPATH) $(DEP_INCPATH) $(CPPFLAGS) $(CXXFLAGS)  -o sort_main.o main.cpp

endif #ifeq ($(shell uname -m),x86_64)


