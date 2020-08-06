// wxbase_object.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxObject class.

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
	wxObject *wxObject_ctor()
		{
		return new wxObject();
		}
	
	void wxObject_dtor(wxObject *Self)
		{
		WXADA_MSG(wxString::Format("[wxObject_dtor] %p\n", Self));
		
		delete Self;
		}
	
	// TODO?
	// + Add support for dynamically creating classes from their names, i.e. wxClassInfo
	};
