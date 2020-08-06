// wxcore_dialupevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxDialUpEvent class.

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

#include <wx/dialup.h>


extern "C"
	{
	wxDialUpEvent *wxDialUpEvent_ctor(int IsConnected, int IsOwnEvent)
		{
		return new wxDialUpEvent(IsConnected == 1 ? true : false, IsOwnEvent == 1 ? true : false);
		}
	
	void wxDialUpEvent_dtor(wxDialUpEvent *Self)
		{
		delete Self;
		}
	
	int wxDialUpEvent_IsConnectedEvent(wxDialUpEvent *Self)
		{
		return Self->IsConnectedEvent() == true ? 1 : 0;
		}
	
	int wxDialUpEvent_IsOwnEvent(wxDialUpEvent *Self)
		{
		return Self->IsOwnEvent() == true ? 1 : 0;
		}
	};
