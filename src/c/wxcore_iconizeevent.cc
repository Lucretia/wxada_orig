// wxcore_iconizeevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxIconizeEvent class.

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
	wxIconizeEvent *wxIconizeEvent_ctor(int Id, int Iconized)
		{
		return new wxIconizeEvent(Id, Iconized);
		}
	
	void wxIconizeEvent_dtor(wxIconizeEvent *Self)
		{
		delete Self;
		}
	
	int wxIconizeEvent_Iconized(wxIconizeEvent *Self)
		{
		return Self->Iconized();
		}
	};
