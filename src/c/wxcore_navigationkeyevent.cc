// wxcore_navigationkeyevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxNavigationKeyEvent class.

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
	wxNavigationKeyEvent *wxNavigationKeyEvent_ctor()
		{
		return new wxNavigationKeyEvent;
		}
	
	void wxNavigationKeyEvent_dtor(wxNavigationKeyEvent *Self)
		{
		delete Self;
		}
		
	int wxNavigationKeyEvent_GetDirection(wxNavigationKeyEvent *Self)
		{
		return Self->GetDirection() == true ? 1 : 0;
		}
		
	void wxNavigationKeyEvent_SetDirection(wxNavigationKeyEvent *Self, int Direction)
		{
		Self->SetDirection(Direction == 1 ? true : false);
		}
		
	int wxNavigationKeyEvent_IsWindowChange(wxNavigationKeyEvent *Self)
		{
		return Self->IsWindowChange() == true ? 1 : 0;
		}
		
	void wxNavigationKeyEvent_SetWindowChange(wxNavigationKeyEvent *Self, int WindowChange)
		{
		Self->SetWindowChange(WindowChange == 1 ? true : false);
		}
		
	int wxNavigationKeyEvent_IsFromTab(wxNavigationKeyEvent *Self)
		{
		return Self->IsFromTab() == true ? 1 : 0;
		}
		
	void wxNavigationKeyEvent_SetFromTab(wxNavigationKeyEvent *Self, int FromTab)
		{
		Self->SetFromTab(FromTab == 1 ? true : false);
		}
		
	void wxNavigationKeyEvent_SetFlags(wxNavigationKeyEvent *Self, int Flags)
		{
		Self->SetFlags(Flags);
		}
	};
