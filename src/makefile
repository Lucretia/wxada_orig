# Makefile for wxAda/src

TOP			=	..
SUBDIRS		=	c \
				ada

OBJS		=	c/$(OUTPUT_DIR)/*.o ada/$(OUTPUT_DIR)/*.o

include $(TOP)/common.mk

all: subdirs $(WXADA_LIB_TARGET)

#.PHONY: $(WXADA_LIB_TARGET)
.PHONY: c/$(OUTPUT_DIR)/*.o
.PHONY: ada/$(OUTPUT_DIR)/*.o

$(WXADA_LIB_TARGET): $(OBJS)
	-$(RM) $(WXADA_LIB_TARGET)
	
ifeq ($(SHARED),0)

	$(AR) $(ARFLAGS) $(WXADA_LIB_TARGET) $(OBJS)

else
ifeq ($(SHARED),1)

	$(LD) $(LIBLINKFLAGS) -o $(WXADA_LIB_TARGET) $(OBJS)

endif
endif

.PHONY: make-prefix

install: make-prefix install-subdirs
ifeq ($(SHARED),0)

	$(CP) $(WXADA_LIB_TARGET) $(ADALIB)
	
else
ifeq ($(SHARED),1)

	$(CP) $(WXADA_LIB_TARGET) $(ADALIB)
	$(CD) $(ADALIB); \
	$(LN) -s $(WXADA_LIB_TARGET) lib$(WXADA_LIB_NAME).so
	
endif
endif

make-prefix:
	-$(RM) -rf $(PREFIX)
	$(MKDIR) -p $(ADAINCLUDE)
	$(MKDIR) -p $(ADALIB)
	
clean: clean-subdirs
	-$(RM) *.a *.so* *~ 

include $(TOP)/targets.mk
#include $(DEPS)
