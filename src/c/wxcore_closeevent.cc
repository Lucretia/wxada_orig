// wxcore_closeevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxCloseEvent class.

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
	wxCloseEvent *wxCloseEvent_ctor(int EventType, int id)
		{
		return new wxCloseEvent(EventType, id);
		}
	
	void wxCloseEvent_dtor(wxCloseEvent *Self)
		{
		delete Self;
		}
	
	int wxCloseEvent_CanVeto(wxCloseEvent *Self)
		{
		return Self->CanVeto() == true ? 1 : 0;
		}
	
	int wxCloseEvent_GetLoggingOff(wxCloseEvent *Self)
		{
		return Self->GetLoggingOff() == true ? 1 : 0;
		}
	
	/* Obsolete!
	int wxCloseEvent_GetForce(wxCloseEvent *Self)
		{
		return Self->GetForce() == true ? 1 : 0;
		}
	*/
	
	void wxCloseEvent_SetCanVeto(wxCloseEvent *Self, int CanVeto)
		{
		Self->SetCanVeto(CanVeto == 1 ? true : false);
		}
	
	/* Obsolete!
	void wxCloseEvent_SetForce(wxCloseEvent *Self, int Force)
		{
		Self->SetForce(Force == 1 ? true : false);
		}
	*/
	
	void wxCloseEvent_SetLoggingOff(wxCloseEvent *Self, int LoggingOff)
		{
		Self->SetLoggingOff(LoggingOff == 1 ? true : false);
		}
	
	void wxCloseEvent_Veto(wxCloseEvent *Self, int Veto)
		{
		Self->Veto(Veto == 1 ? true : false);
		}
	};
