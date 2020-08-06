// wxcore_scrollevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxScrollEvent class.

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
	wxScrollEvent *wxScrollEvent_ctor(int CommandType, int id, int Position, int Orientation)
		{
		return new wxScrollEvent(CommandType, id, Position, Orientation);
		}
	
	void wxScrollEvent_dtor(wxScrollEvent *Self)
		{
		delete Self;
		}
	
	int wxScrollEvent_GetOrientation(wxScrollEvent *Self)
		{
		return Self->GetOrientation();
		}
		
	int wxScrollEvent_GetPosition(wxScrollEvent *Self)
		{
		return Self->GetPosition();
		}
	};
