// wxcore_app.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxApp class.

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

#include "wxcore_app.hh"


extern "C"
	{
	wxAdaApp *wxApp_ctor(void *Ada_Object)
		{
		/*
		printf("wxApp_ctor\n");
		return new wxAdaApp(Ada_Object);
		*/
		wxAdaApp *p = new wxAdaApp(Ada_Object);
		
		WXADA_MSG(wxString::Format("wxApp_ctor: %p [%p]\n", p, wxAdaApp::GetInstance()));
		
		return p;
		}
	
	void wxApp_dtor(wxAdaApp *Self)
		{
		WXADA_MSG("wxApp_dtor\n");
		
		delete Self;
		
		WXADA_MSG("wxApp_dtor 2\n");
		}
	};
