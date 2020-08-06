// wxcore_button.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxStatusBar class.

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
	wxStatusBar *wxStatusBar_ctor(wxWindow *Parent, wxWindowID Id, long Style)
		{
		wxStatusBar *p = new wxStatusBar(Parent, Id, Style);
		printf("[wxStatusBar_ctor] %p\n", p);
		
		return p;
		}
	
	void wxStatusBar_dtor(wxStatusBar *Self)
		{
		printf("[wxStatusBar_dtor]\n");
		delete Self;
		}
		
	void wxStatusBar_GetFieldRect(wxStatusBar *Self, int Field, int *X, int *Y, int *Width, int *Height, int *Result)
		{
		wxRect FieldRect;
		
		*Result = Self->GetFieldRect(Field, FieldRect) == true ? 1 : 0;
		
		*X      = FieldRect.x;
		*Y      = FieldRect.y;
		*Width  = FieldRect.width;
		*Height = FieldRect.height;
		}
	
	int wxStatusBar_GetFieldsCount(wxStatusBar *Self)
		{
		return Self->GetFieldsCount();
		}
	
	const wxChar *wxStatusBar_GetStatusText(wxStatusBar *Self, int Field)
		{
		return Self->GetStatusText(Field);
		}
		
	void wxStatusBar_PopStatusText(wxStatusBar *Self, int Field)
		{
		Self->PopStatusText(Field);
		}

	void wxStatusBar_PushStatusText(wxStatusBar *Self, const wxChar *Text, int Field)
		{
		Self->PushStatusText(Text, Field);
		}
		
	void wxStatusBar_SetFieldsCount(wxStatusBar *Self, int Number, int *Widths)
		{
		Self->SetFieldsCount(Number, Widths);
		}
		
	void wxStatusBar_SetMinHeight(wxStatusBar *Self, int Height)
		{
		Self->SetMinHeight(Height);
		}
		
	void wxStatusBar_SetStatusText(wxStatusBar *Self, const wxChar *Text, int Field)
		{
		Self->SetStatusText(Text, Field);
		}
		
	void wxStatusBar_SetStatusWidths(wxStatusBar *Self, int Total, int *Widths)
		{
		Self->SetStatusWidths(Total, Widths);
		}
		
	void wxStatusBar_SetStatusStyles(wxStatusBar *Self, int Total, int *Styles)
		{
		Self->SetStatusStyles(Total, Styles);
		}
	};
