// wxcore_menuevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxMenuEvent class.

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
	wxMenuEvent *wxMenuEvent_ctor(int Command_Id, int id, wxMenu *Menu)
		{
		return new wxMenuEvent(Command_Id, id, Menu);
		}
	
	void wxMenuEvent_dtor(wxMenuEvent *Self)
		{
		delete Self;
		}
	
	wxMenu *wxMenuEvent_GetMenu(wxMenuEvent *Self)
		{
		return Self->GetMenu();
		}
	
	int wxMenuEvent_GetMenuId(wxMenuEvent *Self)
		{
		return Self->GetMenuId();
		}
	
	int wxMenuEvent_IsPopup(wxMenuEvent *Self)
		{
		return Self->IsPopup() == true ? 1 : 0;
		}
	};
