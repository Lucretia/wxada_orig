// wxcore_spin.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxSpinCtrl class.

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
	wxSpinCtrl *wxSpinCtrl_ctor(wxWindow *Parent, wxWindowID Id, const wxChar *Value, int X, int Y, int Width, int Height, long Style, int Min, int Max, int Initial)
		{
		wxSpinCtrl *p = new wxSpinCtrl(Parent, Id, Value, wxPoint(X, Y), wxSize(Width, Height), Style, Min, Max, Initial);
		printf("[wxSpinCtrl_ctor] %p\n", p);
		return p;
		}
	
	void wxSpinCtrl_dtor(wxSpinCtrl *Self)
		{
		printf("[wxSpinCtrl_dtor]\n");
		delete Self;
		}

	void wxSpinCtrl_SetValue(wxSpinCtrl *Self, int Value)
		{
		return Self->SetValue(Value);
		}
		
	int wxSpinCtrl_GetValue(wxSpinCtrl *Self)
		{
		return Self->GetValue();
		}
	
	void wxSpinCtrl_SetRange(wxSpinCtrl *Self, int MinValue, int MaxValue)
		{
		Self->SetRange(MinValue, MaxValue);
		}
	
	void wxSpinCtrl_SetSelection(wxSpinCtrl *Self, long From, long To)
		{
		Self->SetSelection(From, To);
		}
	
	int wxSpinCtrl_GetMin(wxSpinCtrl *Self)
		{
		return Self->GetMin();
		}
	
	int wxSpinCtrl_GetMax(wxSpinCtrl *Self)
		{
		return Self->GetMax();
		}
	};
