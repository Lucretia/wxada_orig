// wxcore_brush.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxBrush class.

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

//#include <wx/brush.h>


extern "C"
	{
	wxBrush *wxBrush_ctor()
		{
		/*
		printf("wxBrush_ctor\n");
		return new wxBrush();
		*/
		wxBrush *p = new wxBrush();
		printf("wxBrush_ctor: %p\n", p);
		return p;
		}
	
	wxBrush *wxBrush_ctor_From_Colour(wxColour *Colour, int Style)
		{
		printf("wxBrush_ctor 2\n");
		return new wxBrush(*Colour, Style);
		}
	
	wxBrush *wxBrush_ctor_From_Colour_Name(wxChar *Colour, int Style)
		{
		/*
		printf("wxBrush_ctor 3\n");
		return new wxBrush(Colour, Style);
		*/
		wxBrush *p = new wxBrush(Colour, Style);
		printf("wxBrush_ctor 3: %p\n", p);
		return p;
		}
	
	void wxBrush_dtor(wxBrush *Self)
		{
		printf("wxBrush_dtor\n");
		delete Self;
		printf("wxBrush_dtor 2\n");
		}
	
	wxColour *wxBrush_GetColour(wxBrush *Self)
		{
		return &Self->GetColour();
		}
		
	wxBitmap *wxBrush_GetStipple(wxBrush *Self)
		{
		return Self->GetStipple();
		}
	
	int wxBrush_GetStyle(wxBrush *Self)
		{
		return Self->GetStyle();
		}
	
	int wxBrush_IsHatch(wxBrush *Self)
		{
		return Self->IsHatch() == true ? 1 : 0;
		}
	
	int wxBrush_Ok(wxBrush *Self)
		{
		return Self->Ok() == true ? 1 : 0;
		}
	
	void wxBrush_SetColour(wxBrush *Self, wxColour *Colour)
		{
		Self->SetColour(*Colour);
		}
	
	void wxBrush_SetColour_From_Name(wxBrush *Self, wxChar *Colour)
		{
		Self->SetColour(Colour);
		}
	
	void wxBrush_SetColour_From_Components(wxBrush *Self, int Red, int Green, int Blue)
		{
		Self->SetColour(Red, Green, Blue);
		}
	
	void wxBrush_SetStipple(wxBrush *Self, wxBitmap *Stipple)
		{
		Self->SetStipple(*Stipple);
		}
	
	void wxBrush_SetStyle(wxBrush *Self, int Style)
		{
		Self->SetStyle(Style);
		}
	};
