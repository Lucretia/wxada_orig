// wxcore_spinevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxSpinEvent class.

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

#include <wx/spinctrl.h>


extern "C"
	{
	wxSpinEvent *wxSpinEvent_ctor(int CommandType, int id)
		{
		return new wxSpinEvent(CommandType, id);
		}
	
	void wxSpinEvent_dtor(wxSpinEvent *Self)
		{
		delete Self;
		}
	
	int wxSpinEvent_GetPosition(wxSpinEvent *Self)
		{
		return Self->GetPosition();
		}

	void wxSpinEvent_SetPosition(wxSpinEvent *Self, int Position)
		{
		return Self->SetPosition(Position);
		}
	};
