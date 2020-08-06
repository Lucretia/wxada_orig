// wxbase_toplevelwindow.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxTopLevelWindow class.

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
	wxTopLevelWindow *wxTopLevelWindow_ctor(wxWindow *Parent, int Id, const wxChar *Title, int X, int Y, int Width, int Height)
		{
		wxTopLevelWindow *Window = new wxTopLevelWindow(Parent, Id, Title, wxPoint(X, Y), wxSize(Width, Height));
		
		//Window->Create(Parent, Id, "");
		
		return Window;
		}
	
	void wxTopLevelWindow_dtor(wxTopLevelWindow *Self)
		{
		delete Self;
		}
	};
