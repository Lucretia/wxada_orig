// wxcore_staticboxsizer.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxStaticBoxSizer class.

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
	wxStaticBoxSizer *wxStaticBoxSizer_ctor(wxStaticBox *Box, int Orientation)
		{
		wxStaticBoxSizer *p = new wxStaticBoxSizer(Box, Orientation);
		printf("[wxStaticBoxSizer_ctor] %p\n", p);
		return p;
		}
	
	void wxStaticBoxSizer_dtor(wxStaticBoxSizer *Self)
		{
		printf("[wxStaticBoxSizer_dtor]\n");
		delete Self;
		}
	
	wxStaticBox *wxStaticBoxSizer_GetStaticBox(wxStaticBoxSizer *Self)
		{
		return Self->GetStaticBox();
		}
	};
