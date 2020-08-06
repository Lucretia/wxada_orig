// wxcore_scrollbar.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxScrollBar class.

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

#include <wx/scrolbar.h>


extern "C"
	{
	wxScrollBar *wxScrollBar_ctor(wxWindow *Parent, wxWindowID Id, int X, int Y, int Width, int Height, long Style)
		{
		wxScrollBar *p = new wxScrollBar(Parent, Id, wxPoint(X, Y), wxSize(Width, Height), Style);
		printf("[wxScrollBar_ctor] %p\n", p);
		return p;
		}
	
	void wxScrollBar_dtor(wxScrollBar *Self)
		{
		printf("[wxScrollBar_dtor]\n");
		delete Self;
		}
	
	int wxScrollBar_GetRange(wxScrollBar *Self)
		{
		return Self->GetRange();
		}
	
	int wxScrollBar_GetPageSize(wxScrollBar *Self)
		{
		return Self->GetPageSize();
		}
	
	int wxScrollBar_GetThumbPosition(wxScrollBar *Self)
		{
		return Self->GetThumbPosition();
		}
	
	int wxScrollBar_GetThumbSize(wxScrollBar *Self)
		{
		return Self->GetThumbSize();
		}
	
	void wxScrollBar_SetThumbPosition(wxScrollBar *Self, int ViewStart)
		{
		Self->SetThumbPosition(ViewStart);
		}
	
	void wxScrollBar_SetScrollbar(wxScrollBar *Self, int Position, int ThumbSize, int Range, int PageSize, int Refresh)
		{
		Self->SetScrollbar(Position, ThumbSize, Range, PageSize, Refresh == 1 ? true : false);
		}
	};
