// wxcore_pen.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxPen class.

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

//#include <wx/pen.h>


extern "C"
	{
	wxPen *wxPen_ctor()
		{
		/*
		printf("wxPen_ctor\n");
		return new wxPen();
		*/
		wxPen *p = new wxPen();
		printf("wxPen_ctor: %p\n", p);
		return p;
		}
	
	wxPen *wxPen_ctor_From_Colour(wxColour *Colour, int Width, int Style)
		{
		/*
		printf("wxPen_ctor 2\n");
		return new wxPen(*Colour, Width, Style);
		*/
		wxPen *p = new wxPen(*Colour, Width, Style);
		printf("wxPen_ctor 2: %p\n", p);
		return p;
		}
	
	wxPen *wxPen_ctor_From_Colour_Name(wxChar *Colour, int Width, int Style)
		{
		printf("wxPen_ctor 3\n");
		return new wxPen(Colour, Width, Style);
		}
	
	void wxPen_dtor(wxPen *Self)
		{
		printf("wxPen_dtor\n");
		delete Self;
		printf("wxPen_dtor 2\n");
		}
	
	int wxPen_GetCap(wxPen *Self)
		{
		return Self->GetCap();
		}
	
	wxColour *wxPen_GetColour(wxPen *Self)
		{
		return &Self->GetColour();
		}
		
	int wxPen_GetDashes(wxPen *Self, wxDash **Dashes)
		{
		return Self->GetDashes(Dashes);
		}
	
	int wxPen_GetJoin(wxPen *Self)
		{
		return Self->GetJoin();
		}
	
	wxBitmap *wxPen_GetStipple(wxPen *Self)
		{
#ifdef __WXGTK__
		return NULL;
#else
		return Self->GetStipple();
#endif // __WXGTK__
		}
	
	int wxPen_GetStyle(wxPen *Self)
		{
		return Self->GetStyle();
		}
	
	int wxPen_GetWidth(wxPen *Self)
		{
		return Self->GetWidth();
		}
	
	int wxPen_Ok(wxPen *Self)
		{
		return Self->Ok() == true ? 1 : 0;
		}
	
	void wxPen_SetCap(wxPen *Self, int CapStyle)
		{
		Self->SetCap(CapStyle);
		}
	
	void wxPen_SetColour(wxPen *Self, wxColour *Colour)
		{
		Self->SetColour(*Colour);
		}
	
	void wxPen_SetColour_From_Name(wxPen *Self, wxChar *Colour)
		{
		Self->SetColour(Colour);
		}
	
	void wxPen_SetColour_From_Components(wxPen *Self, int Red, int Green, int Blue)
		{
		Self->SetColour(Red, Green, Blue);
		}
	
	void wxPen_SetDashes(wxPen *Self, int n, wxDash *Dashes)
		{
		Self->SetDashes(n, Dashes);
		}
	
	void wxPen_SetJoin(wxPen *Self, int JoinStyle)
		{
		Self->SetJoin(JoinStyle);
		}
	
	void wxPen_SetStipple(wxPen *Self, wxBitmap *Stipple)
		{
#ifndef __WXGTK__
		Self->SetStipple(Stipple);
#endif // !__WXGTK__
		}
	
	void wxPen_SetStyle(wxPen *Self, int Style)
		{
		Self->SetStyle(Style);
		}
	
	void wxPen_SetWidth(wxPen *Self, int Width)
		{
		Self->SetWidth(Width);
		}
	};
