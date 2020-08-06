// wxcore_sizeevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxSizeEvent class.

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
	wxSizeEvent *wxSizeEvent_ctor(int Width, int Height, int id)
		{
		return new wxSizeEvent(wxSize(Width, Height), id);
		}
	
	void wxSizeEvent_dtor(wxSizeEvent *Self)
		{
		delete Self;
		}
	
	void wxSizeEvent_GetSize(wxSizeEvent *Self, int *Width, int *Height)
		{
		wxSize Size = Self->GetSize();
		
		*Width  = Size.GetWidth();
		*Height = Size.GetHeight();
		}
	};
