// wxbase_menubar.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxMenuBar class.

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
	// wxMenuBar
	wxMenuBar *wxMenuBar_ctor(long Style = 0)
		{
		WXADA_MSG("[wxMenuBar_ctor]\n");
		
		return new wxMenuBar(Style);
		}
	
	void wxMenuBar_dtor(wxMenuBar *Self)
		{
		WXADA_MSG("[wxMenuBar_dtor]\n");
		
		delete Self;
		}
		
	int wxMenuBar_Append(wxMenuBar *Self, wxMenu *Menu, const wxChar *Title)
		{
		return Self->Append(Menu, Title) == true ? 1 : 0;
		}
		
	//wxMenuBar_Check
	//wxMenuBar_Enable
	
	
	void wxMenuBar_EnableTop(wxMenuBar *Self, int Position, bool Enable)
		{
		Self->EnableTop(Position, Enable);
		}
	
		
	};
