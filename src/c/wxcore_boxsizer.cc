// wxcore_boxsizer.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxBoxSizer class.

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

#include "wx_debug.hh"


extern "C"
	{
	wxBoxSizer *wxBoxSizer_ctor(int Orientation)
		{
		wxBoxSizer *p = new wxBoxSizer(Orientation);
		
		WXADA_MSG(wxString::Format("[wxBoxSizer_ctor] %p\n", p));
		
		return p;
		}
	
	void wxBoxSizer_dtor(wxBoxSizer *Self)
		{
		WXADA_MSG("[wxBoxSizer_dtor]\n");
		
		delete Self;
		}
	
	void wxBoxSizer_RecalcSizes(wxBoxSizer *Self)
		{
		Self->RecalcSizes();
		}
	
	void wxBoxSizer_CalcMin(wxBoxSizer *Self)
		{
		Self->CalcMin();
		}
	
	int wxBoxSizer_GetOrientation(wxBoxSizer *Self)
		{
		return Self->GetOrientation();
		}
	};
