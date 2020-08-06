# Makefile for wxAda/samples/minimal

TOP	=	../..

include $(TOP)/common.mk

SRCS		=	minimal.adb \
				minimal_app.adb \
				minimal_frame.adb \
				test_event.adb

OBJS		=	$(SRCS:.adb=.o)
			
SUBDIRS		=	

TARGET		=	minimal

all: subdirs $(TARGET)

.PHONY: $(TOP)/src/$(WXADA_LIB_TARGET)

$(TARGET): $(OBJS) $(TOP)/src/$(WXADA_LIB_TARGET)
	$(CD) $(OUTPUT_DIR); \
	$(ADA) -b -aO$(ADALIB) $(TARGET); \
	$(ADA) -l -aO$(ADALIB) $(TARGET) -largs -l$(WXADA_LIB_NAME) -L$(ADALIB) $(WXLIBS)

#-L$(ADALIB) $(WXLIBS) -lgnarl -L/opt/gcc-4.1-20050902/lib/gcc/i686-pc-linux-gnu/4.1.0/adalib/

minimal.o: minimal.adb
	$(ADA) -I.. -aI$(ADAINCLUDE) -u -D $(OUTPUT_DIR) $<

minimal_app.o: minimal_app.adb minimal_app.ads
	$(ADA) -I.. -aI$(ADAINCLUDE) -u -D $(OUTPUT_DIR) $<

minimal_frame.o: minimal_frame.adb minimal_frame.ads
	$(ADA) -I.. -aI$(ADAINCLUDE) -u -D $(OUTPUT_DIR) $<

test_event.o: test_event.adb test_event.ads
	$(ADA) -I.. -aI$(ADAINCLUDE) -u -D $(OUTPUT_DIR) $<

target-install:

clean: clean-subdirs
	-$(RM) *~ $(OUTPUT_DIR)/*

include $(TOP)/targets.mk
