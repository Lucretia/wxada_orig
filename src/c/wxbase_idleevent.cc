// wxbase_idleevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxIdleEvent class.

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
	wxIdleEvent *wxIdleEvent_ctor()
		{
		return new wxIdleEvent();
		}
	
	void wxIdleEvent_dtor(wxIdleEvent *Self)
		{
		delete Self;
		}
	
	int wxIdleEvent_CanSend(wxWindow *Window)
		{
		return wxIdleEvent::CanSend(Window) == true ? 1 : 0;
		}
	
	int wxIdleEvent_GetMode()
		{
		return wxIdleEvent::GetMode();
		}
	
	void wxIdleEvent_RequestMore(wxIdleEvent *Self, int NeedMore)
		{
		Self->RequestMore(NeedMore == 1 ? true : false);
		}
	
	int wxIdleEvent_MoreRequested(wxIdleEvent *Self)
		{
		return Self->MoreRequested() == true ? 1 : 0;
		}
	
	void wxIdleEvent_SetMode(int Mode)
		{
		wxIdleEvent::SetMode(wx_static_cast(wxIdleMode, Mode));
		}
	};
