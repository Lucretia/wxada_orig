// wxbase_init.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

// For compilers that support precompilation, includes "wx/wx.h".
#include <wx/wxprec.h>


#ifdef __BORLANDC__
    #pragma hdrstop
#endif


// For all others, include the necessary headers (this file is usually all you
// need because it includes almost all "standard" wxWindows headers)
#ifndef WX_PRECOMP
    #include <wx/wx.h>
#endif

#include "wx_debug.hh"


extern "C"
	{
	int wxInit_wxEntry(int argc, char *argv[])
		{
		WXADA_MSG("[wxInit_wxEntry]\n");
		
		return wxEntry(argc, argv);
		}
	
	void wxInit_wxEntryCleanup()
		{
		WXADA_MSG("[wxInit_wxEntryCleanup]\n");
		
		::wxEntryCleanup();
		}
	};
