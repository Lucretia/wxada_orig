// wxcore_contextmenuevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxContextMenuEvent class.

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
	wxContextMenuEvent *wxContextMenuEvent_ctor(int Command_Id, int id, int x, int y)
		{
		return new wxContextMenuEvent(Command_Id, id, wxPoint(x, y));
		}
	
	void wxContextMenuEvent_dtor(wxContextMenuEvent *Self)
		{
		delete Self;
		}
	
	void wxContextMenuEvent_GetPosition(wxContextMenuEvent *Self, int *x, int *y)
		{
		const wxPoint Position = Self->GetPosition();
		
		*x = Position.x;
		*y = Position.y;
		}
	
	void wxContextMenuEvent_SetPosition(wxContextMenuEvent *Self, int x, int y)
		{
		Self->SetPosition(wxPoint(x, y));
		}
	};
