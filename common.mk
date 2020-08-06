# common.mk

#########################################################################
# The next 3 variables are used to change the compilation of wxAda.
#########################################################################

PREFIX			=	$(HOME)/opt/wxAda

#CFG				=	DEBUG
CFG				=	RELEASE

#SHARED			=	0
SHARED			=	1

PLATFORM		=	LINUX
#PLATFORM		=	MACOS
#PLATFORM		=	WIN32

#ADA_VER			=	2005
ADA_VER			=	95

#########################################################################
# Everything from here is untouchable.
#########################################################################

ADA				=	gnatmake
CC				=	gcc
CXX				=	g++
AS				=	gcc
LD				=	g++
AR				=	ar
RM				=	rm
MKDIR			=	mkdir
CP				=	cp
LN				=	ln
CD				=	cd

LIB_MAJ_VERS	=	1
LIB_MIN_VERS	=	0
LIB_MIN_REV		=	0

ifeq ($(CFG),DEBUG)

WXCXX			=	`wx-config --debug=yes --cxxflags`
WXLIBS			=	`wx-config --debug=yes --libs`
OUTPUT_DIR		=	debug
LIB_CFG			=	d

ADAFLAGS		=	-c -g -gnatf -gnatwj
ADACARGS		=	
BINDFLAGS		=	
LINKFLAGS		=	
LIBLINKFLAGS	=	

CXXFLAGS		=	-c -fno-rtti -fno-exceptions -Wall $(WXCXX) -ggdb -fno-implicit-templates
ASFLAGS			=	
LDFLAGS			=	
LIBS			=	$(WXLIBS)
ARFLAGS			=	-rcs

else
ifeq ($(CFG),RELEASE)

WXCXX			=	`wx-config --cxxflags`
WXLIBS			=	`wx-config --libs`
OUTPUT_DIR		=	release
LIB_CFG			=	

ADAFLAGS		=	-c -O3 -gnatf -gnatwj
ADACARGS		=	
BINDFLAGS		=	
LINKFLAGS		=	
LIBLINKFLAGS	=	

CXXFLAGS		=	-c -fno-rtti -fno-exceptions -Wall $(WXCXX) -O3 -DNDEBUG
ASFLAGS			=	-DNDEBUG 
LDFLAGS			=	-s
LIBS			=	$(WXLIBS)
ARFLAGS			=	-rcs

endif
endif

WXADA_LIB_NAME	=	wxada$(LIB_CFG)

ifeq ($(SHARED),0)

ADACARGS		+=	
CXXFLAGS		+=	
LINKFLAGS		+=	
#ADALIB			=	$(PREFIX)/lib/adalib/static

else
ifeq ($(SHARED),1)

ADACARGS		+=	-cargs -fpic
CXXFLAGS		+=	-fpic
LIBLINKFLAGS	+=	-shared -Wl,-soname,lib$(WXADA_LIB_NAME).so
#ADALIB			=	$(PREFIX)/lib/adalib/dynamic

endif
endif

ADALIB			=	$(PREFIX)/lib/adalib
ADAINCLUDE		=	$(PREFIX)/lib/adainclude

ifeq ($(ADA_VER),2005)
ADAFLAGS		+=	-gnat05
BINDFLAGS		+=	-gnat05
LINKFLAGS		+=	-gnat05
else
ifeq ($(ADA_VER),95)
ADAFLAGS		+=	-gnat95
BINDFLAGS		+=	-gnat95
LINKFLAGS		+=	-gnat95
endif
endif

ifeq ($(SHARED),0)

WXADA_LIB_TARGET	=	lib$(WXADA_LIB_NAME).a

else
ifeq ($(SHARED),1)

WXADA_LIB_TARGET	=	lib$(WXADA_LIB_NAME).so.$(LIB_MAJ_VERS).$(LIB_MIN_VERS).$(LIB_MIN_REV)

endif
endif
