// wxcore_maximizeevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxMaximizeEvent class.

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
	wxMaximizeEvent *wxMaximizeEvent_ctor(int id)
		{
		return new wxMaximizeEvent(id);
		}
	
	void wxMaximizeEvent_dtor(wxMaximizeEvent *Self)
		{
		delete Self;
		}
	};
