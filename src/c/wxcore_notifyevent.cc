// wxcore_notifyevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxNotifyEvent class.

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
	wxNotifyEvent *wxNotifyEvent_ctor(int CommandType, int id)
		{
		return new wxNotifyEvent(CommandType, id);
		}
	
	void wxNotifyEvent_dtor(wxNotifyEvent *Self)
		{
		delete Self;
		}
	
	void wxNotifyEvent_Allow(wxNotifyEvent *Self)
		{
		Self->Allow();
		}

	int wxNotifyEvent_IsAllowed(wxNotifyEvent *Self)
		{
		return Self->IsAllowed() == true ? 1 : 0;
		}

	void wxNotifyEvent_Veto(wxNotifyEvent *Self)
		{
		return Self->Veto();
		}
	};
