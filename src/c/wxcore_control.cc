// wxcore_control.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxControl class.

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
	wxControl *wxControl_ctor(wxWindow *Parent, int Id)
		{
		printf("[wxControl_ctor]\n");
		wxControl *Control = new wxControl;
		
		Control->Create(Parent, Id);
		
		return Control;
		}
	
	void wxControl_dtor(wxControl *Self)
		{
		printf("[wxControl_dtor]\n");
		delete Self;
		}
	
	void wxControl_Command(wxControl *Self, wxCommandEvent *Event)
		{
		Self->Command(*Event);
		}
	
	const wxChar *wxControl_GetLabel(wxControl *Self)
		{
		return Self->GetLabel().c_str();
		}
	
	void wxControl_SetLabel(wxControl *Self, const wxChar *Label)
		{
		return Self->SetLabel(Label);
		}
	};
