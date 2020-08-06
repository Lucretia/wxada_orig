// wxcore_staticbox.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxBoxSizer class.

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
	wxStaticBox *wxStaticBox_ctor(wxWindow *Parent, int Id, wxChar *Label, int X, int Y, int Width, int Height, int Style)
		{
		wxStaticBox *p = new wxStaticBox(Parent, Id, Label, wxPoint(X, Y), wxSize(Width, Height), Style);
		printf("[wxStaticBox_ctor] %p\n", p);
		return p;
		}
	
	void wxStaticBox_dtor(wxStaticBox *Self)
		{
		printf("[wxStaticBox_dtor]\n");
		delete Self;
		}
	};
