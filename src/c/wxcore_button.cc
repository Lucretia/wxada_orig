// wxcore_button.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxButton class.

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
	wxButton *wxButton_ctor(wxWindow *Parent, wxWindowID Id, const wxChar *Label, int X, int Y, int Width, int Height, long Style)
		{
		wxButton *p = new wxButton(Parent, Id, Label, wxPoint(X, Y), wxSize(Width, Height), Style);
		printf("[wxButton_ctor] %p\n", p);
		return p;
		}
	
	void wxButton_dtor(wxButton *Self)
		{
		printf("[wxButton_dtor]\n");
		delete Self;
		}
	
	const wxChar *wxButton_GetLabel(wxButton *Self)
		{
		return Self->GetLabel().c_str();
		}
	
	void wxButton_GetDefaultSize(wxButton *Self, int *Width, int *Height)
		{
		wxSize Size = Self->GetDefaultSize();
		
		*Width  = Size.GetWidth();
		*Height = Size.GetHeight();
		}
	
	void wxButton_SetDefault(wxButton *Self)
		{
		Self->SetDefault();
		}
	
	void wxButton_SetLabel(wxButton *Self, const wxChar *Label)
		{
		return Self->SetLabel(Label);
		}
	};
