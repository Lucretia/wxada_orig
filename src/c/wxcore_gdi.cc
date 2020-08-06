// wxcore_gdi.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxGDIObject class.

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


extern "C"
	{
	wxGDIObject *wxGDIObject_ctor()
		{
		printf("wxGDIObject_ctor\n");
		return new wxGDIObject();
		}
	
	void wxGDIObject_dtor(wxGDIObject *Self)
		{
		printf("wxGDIObject_dtor\n");
		delete Self;
		printf("wxGDIObject_dtor 2\n");
		}
	};
