# Makefile for wxAda

TOP			=	.
SUBDIRS		=	src \
				samples \
				tests
#				test
#				docs
#				tests
#				thirdparty

include $(TOP)/common.mk

#all: all-lib all-samples

all-libs:
	$(CD) src && $(MAKE)
	
all-samples:
	$(CD) samples && $(MAKE)
	
all-tests:
	$(CD) tests && $(MAKE)
	
#install: install-lib install-samples

install-libs: all-libs
	$(CD) src && $(MAKE) install

clean: clean-subdirs
	-$(RM) *~ 

include $(TOP)/targets.mk
#include $(DEPS)
