// wxcore_calculatelayoutevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxCalculateLayoutEvent class.

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

#include <wx/laywin.h>


extern "C"
	{
	wxCalculateLayoutEvent *wxCalculateLayoutEvent_ctor(int WindowId)
		{
		return new wxCalculateLayoutEvent(WindowId);
		}
	
	void wxCalculateLayoutEvent_dtor(wxCalculateLayoutEvent *Self)
		{
		delete Self;
		}
	
	int wxCalculateLayoutEvent_GetFlags(wxCalculateLayoutEvent *Self)
		{
		return Self->GetFlags();
		}
	
	void wxCalculateLayoutEvent_GetRect(wxCalculateLayoutEvent *Self, int *x, int *y, int *Width, int *Height)
		{
		wxRect Rect = Self->GetRect();
		
		*x      = Rect.x;
		*y      = Rect.y;
		*Width  = Rect.width;
		*Height = Rect.height;
		}
	
	void wxCalculateLayoutEvent_SetFlags(wxCalculateLayoutEvent *Self, int Flags)
		{
		Self->SetFlags(Flags);
		}
		
	void wxCalculateLayoutEvent_SetRect(wxCalculateLayoutEvent *Self, int x, int y, int Width, int Height)
		{
		wxRect Rect;
		
		Rect.x      = x;
		Rect.y      = y;
		Rect.width  = Width;
		Rect.height = Height;
		
		Self->SetRect(Rect);
		}
	};
