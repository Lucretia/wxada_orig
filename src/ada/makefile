# Makefile for wxAda/src/ada

TOP	=	../..

include $(TOP)/common.mk

SRCS		=	*.ads \
				wx.adb \
				wx-debug.adb \
				wx-instance_store.adb \
				wx-base-event_handler.adb \
				wx-core-rect.adb \
				wx-core-window.adb
				
ALIS		=	$(OUTPUT_DIR)/*.ali

GENERICS	=	wx-array_conversion.adb \
				wx-single_linked_list.adb \
				wx-base-event_handler.adb \
				wx-base-handle.adb \
				wx-base-indefinite_handle.adb

all: 
	$(ADA) $(ADAFLAGS) -D $(OUTPUT_DIR) wx_lib.ads $(ADACARGS)

install: install-subdirs
	$(CP) *.ad[sb] $(ADAINCLUDE)
	$(CP) $(OUTPUT_DIR)/*.ali $(ADALIB)
	
#	$(CP) $(SRCS) $(GENERICS) $(ADAINCLUDE)
#	$(CP) $(ALIS) $(ADALIB)

clean: clean-subdirs
	-$(RM) *~ $(OUTPUT_DIR)/*

include $(TOP)/targets.mk
