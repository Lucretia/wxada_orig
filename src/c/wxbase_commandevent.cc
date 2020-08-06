// wxbase_commandevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxCommandEvent class.

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
	wxCommandEvent *wxCommandEvent_ctor(int EventType, int id)
		{
		return new wxCommandEvent(EventType, id);
		}
	
	void wxCommandEvent_dtor(wxCommandEvent *Self)
		{
		delete Self;
		}

	void *wxCommandEvent_GetClientData(wxCommandEvent *Self)
		{
		return Self->GetClientData();
		}
	
	wxClientData *wxCommandEvent_GetClientObject(wxCommandEvent *Self)
		{
		return Self->GetClientObject();
		}
	
	long wxCommandEvent_GetExtraLong(wxCommandEvent *Self)
		{
		return Self->GetExtraLong();
		}
	
	int wxCommandEvent_GetInt(wxCommandEvent *Self)
		{
		return Self->GetInt();
		}
	
	int wxCommandEvent_GetSelection(wxCommandEvent *Self)
		{
		return Self->GetSelection();
		}
	
	const wxChar *wxCommandEvent_GetString(wxCommandEvent *Self)
		{
		return Self->GetString();
		}
	
	int wxCommandEvent_IsChecked(wxCommandEvent *Self)
		{
		return Self->IsChecked();
		}
	
	int wxCommandEvent_IsSelection(wxCommandEvent *Self)
		{
		return Self->IsSelection();
		}
	
	void wxCommandEvent_SetClientData(wxCommandEvent *Self, void *ClientData)
		{
		Self->SetClientData(ClientData);
		}
	
	void wxCommandEvent_SetClientObject(wxCommandEvent *Self, wxClientData *ClientObject)
		{
		Self->SetClientObject(ClientObject);
		}
	
	void wxCommandEvent_SetExtraLong(wxCommandEvent *Self, long ExtraLong)
		{
		Self->SetExtraLong(ExtraLong);
		}
	
	void wxCommandEvent_SetInt(wxCommandEvent *Self, long Value)
		{
		Self->SetInt(Value);
		}
	
	void wxCommandEvent_SetString(wxCommandEvent *Self, const wxChar *String)
		{
		Self->SetString(String);
		}
	};
