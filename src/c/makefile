# Makefile for wxAda/src/c

TOP	=	../..

include $(TOP)/common.mk

SRCS		=	wxsupport.cc \
				wxbase_object.cc \
				wxbase_evthandler.cc \
				wxbase_event.cc \
				wxbase_commandevent.cc \
				wxbase_idleevent.cc \
				wxbase_init.cc \
				wxbase_app.cc \
				wxcore_app.cc \
				wxcore_notifyevent.cc \
				wxcore_sizeevent.cc \
				wxcore_scrollevent.cc \
				wxcore_spinevent.cc \
				wxcore_paintevent.cc \
				wxcore_activateevent.cc \
				wxcore_calculatelayoutevent.cc \
				wxcore_closeevent.cc \
				wxcore_contextmenuevent.cc \
				wxcore_eraseevent.cc \
				wxcore_dialupevent.cc \
				wxcore_finddialogevent.cc \
				wxcore_focusevent.cc \
				wxcore_helpevent.cc \
				wxcore_iconizeevent.cc \
				wxcore_initdialogevent.cc \
				wxcore_maximizeevent.cc \
				wxcore_menuevent.cc \
				wxcore_keyevent.cc \
				wxcore_navigationkeyevent.cc \
				wxcore_joystickevent.cc \
				wxcore_colour.cc \
				wxcore_window.cc \
				wxcore_toplevelwindow.cc \
				wxcore_frame.cc \
				wxcore_panel.cc \
				wxcore_statbar.cc \
				wxcore_control.cc \
				wxcore_button.cc \
				wxcore_checkbox.cc \
				wxcore_slider.cc \
				wxcore_scrollbar.cc \
				wxcore_spin.cc \
				wxcore_staticbox.cc \
				wxcore_sizer.cc \
				wxcore_boxsizer.cc \
				wxcore_staticboxsizer.cc \
				wxcore_gdi.cc \
				wxcore_pen.cc \
				wxcore_brush.cc \
				wxcore_bitmap.cc \
				wxcore_image.cc \
				wxcore_dc.cc \
				wxcore_clientdc.cc \
				wxcore_windowdc.cc \
				wxcore_paintdc.cc \
				wxcore_validator.cc \
				wxcore_menu.cc
#				wxcore_menubar.cc \

OBJS		=	$(patsubst %.cc,$(OUTPUT_DIR)/%.o,$(SRCS))
DEPS		=	$(OBJS:%.o=%.d)

SUBDIRS		=	

all: subdirs $(OBJS)

#TARGET		=	libwxada_c.a
#
#all: subdirs $(TARGET)
#
#$(TARGET): $(OBJS)
#	$(AR) $(ARFLAGS) $(TARGET) $(OBJS)

install: install-subdirs

clean: clean-subdirs
	-$(RM) *~ $(OUTPUT_DIR)/*

include $(TOP)/targets.mk
include $(DEPS)
