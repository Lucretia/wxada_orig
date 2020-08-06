// wxcore_colour.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxColour class.

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
	wxColour *wxColour_ctor(int Red, int Green, int Blue)
		{
		printf("wxColour_ctor\n");
		return new wxColour(Red, Green, Blue);
		}
	
	void wxColour_dtor(wxColour *Self)
		{
		printf("wxColour_dtor\n");
		delete Self;
		printf("wxColour_dtor 2\n");
		}
		
	int wxColour_Red(wxColour *Self)
		{
		return Self->Red();
		}
		
	int wxColour_Green(wxColour *Self)
		{
		return Self->Green();
		}
		
	int wxColour_Blue(wxColour *Self)
		{
		return Self->Blue();
		}
		
	int wxColour_Ok(wxColour *Self)
		{
		return Self->Ok() == true ? 1 : 0;
		}
		
	void wxColour_Set(wxColour *Self, int Red, int Green, int Blue)
		{
		Self->Set(Red, Green, Blue);
		}
	};
