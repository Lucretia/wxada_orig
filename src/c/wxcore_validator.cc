// wxbase_validator.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxValidator class.

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


#include "wxcore_validator.hh"


IMPLEMENT_DYNAMIC_CLASS(wxAdaValidator, wxValidator)
//IMPLEMENT_ABSTRACT_CLASS(wxAdaValidator, wxValidator)


extern "C"
	{
	wxAdaValidator *wxValidator_ctor(void *AdaValidator)
		{
		wxAdaValidator *Self = new wxAdaValidator;
		
		Self->_AdaValidator = AdaValidator;
		
		return Self;
		}
	
	void wxValidator_dtor(wxAdaValidator *Self)
		{
		delete Self;
		}
	
	wxWindow *wxValidator_GetWindow(wxAdaValidator *Self)
		{
		return Self->GetWindow();
		}

	void wxValidator_SetBellOnError(wxAdaValidator *Self, int DoIT)
		{
		Self->SetBellOnError(DoIT == 1 ? true : false);
		}

	void wxValidator_SetWindow(wxAdaValidator *Self, wxWindow *Window)
		{
		Self->SetWindow(Window);
		}

/*
	bool wxValidator_TransferFromWindow(wxValidator *Self)
		{
		return Self->TransferFromWindow();
		}

	bool wxValidator_TransferToWindow(wxValidator *Self)
		{
		return Self->TransferToWindow();
		}

	bool wxValidator_Validate(wxValidator *Self, wxWindow *Parent)
		{
		return Self->Validate(Parent);
		}
*/

	// These are wxAdaValidator support functions which get used in the virtual functions.
	void wxValidator_SetAdaValidator(wxAdaValidator *Self, void *AdaValidator)
		{
		Self->_AdaValidator = AdaValidator;
		}
		
	void *wxValidator_GetAdaValidator(wxAdaValidator *Self)
		{
		return Self->_AdaValidator;
		}
	};
