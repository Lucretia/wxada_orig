// wxcore_checkbox.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxCheckBox class.

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
	wxCheckBox *wxCheckBox_ctor(wxWindow *Parent, wxWindowID Id, const wxChar *Label, int X, int Y, int Width, int Height, long Style)
		{
		wxCheckBox *p = new wxCheckBox(Parent, Id, Label, wxPoint(X, Y), wxSize(Width, Height), Style);
		printf("[wxCheckBox_ctor] %p\n", p);
		return p;
		}
	
	void wxCheckBox_dtor(wxCheckBox *Self)
		{
		printf("[wxCheckBox_dtor]\n");
		delete Self;
		}
	
	int wxCheckBox_GetValue(wxCheckBox *Self)
		{
		return Self->GetValue() == true ? 1 : 0;
		}
  
	int wxCheckBox_Get3StateValue(wxCheckBox *Self)
		{
		return (int)Self->Get3StateValue();
		}
  
	int wxCheckBox_Is3rdStateAllowedForUser(wxCheckBox *Self)
		{
		return Self->Is3rdStateAllowedForUser() == true ? 1 : 0;
		}
  
	int wxCheckBox_Is3State(wxCheckBox *Self)
		{
		return Self->Is3State() == true ? 1 : 0;
		}
  
	void wxCheckBox_SetValue(wxCheckBox *Self, int State)
		{
		Self->SetValue(State == 1 ? true : false);
		}
		
	void wxCheckBox_Set3StateValue(wxCheckBox *Self, int State)
		{
		Self->Set3StateValue((const wxCheckBoxState)State);
		}
	};
