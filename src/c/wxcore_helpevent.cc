// wxcore_helpevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxHelpEvent class.

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
	wxHelpEvent *wxHelpEvent_ctor(int Command_Id, int Id, int x, int y)
		{
		return new wxHelpEvent(Command_Id, Id, wxPoint(x, y));
		}
	
	void wxHelpEvent_dtor(wxHelpEvent *Self)
		{
		delete Self;
		}
	
	void wxHelpEvent_GetPosition(wxHelpEvent *Self, int *x, int *y)
		{
		const wxPoint &Position = Self->GetPosition();
		
		*x = Position.x;
		*y = Position.y;
		}
		
	void wxHelpEvent_SetPosition(wxHelpEvent *Self, int x, int y)
		{
		Self->SetPosition(wxPoint(x, y));
		}
	};
