// wxbase_panel.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxPanel class.

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
	wxPanel *wxPanel_ctor(wxWindow *Parent, int Id, int X, int Y, int Width, int Height, int Style)
		{
		return new wxPanel(Parent, Id, wxPoint(X, Y), wxSize(Width, Height), Style);
		}
	
	void wxPanel_dtor(wxPanel *Self)
		{
		delete Self;
		}
	
	/* No longer existing
	wxWindow *wxPanel_GetDefaultItem(wxPanel *Self)
		{
		return Self->GetDefaultItem();
		}
	*/

	void wxPanel_InitDialog(wxPanel *Self)
		{
		Self->InitDialog();
		}
	
	/* No longer existing
	void wxPanel_SetDefaultItem(wxPanel *Self, wxWindow *Default)
		{
		Self->SetDefaultItem(Default);
		}
	*/
	
	void wxPanel_SetFocus(wxPanel *Self)
		{
		Self->SetFocus();
		}
	
	void wxPanel_SetFocusIgnoringChildren(wxPanel *Self)
		{
		Self->SetFocusIgnoringChildren();
		}
	};

