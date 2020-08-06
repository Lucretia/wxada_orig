// wxcore_slider.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxSlider class.

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
	wxSlider *wxSlider_ctor(wxWindow *Parent, wxWindowID Id, int Value, int MinValue, int MaxValue, int X, int Y, int Width, int Height, long Style)
		{
		wxSlider *p = new wxSlider(Parent, Id, Value, MinValue, MaxValue, wxPoint(X, Y), wxSize(Width, Height), Style);
		printf("[wxSlider_ctor] %p\n", p);
		return p;
		}
	
	void wxSlider_dtor(wxSlider *Self)
		{
		printf("[wxSlider_dtor]\n");
		delete Self;
		}
	
	void wxSlider_ClearSel(wxSlider *Self)
		{
		return Self->ClearSel();
		}
	
	void wxSlider_ClearTicks(wxSlider *Self)
		{
		return Self->ClearTicks();
		}
	
	int wxSlider_GetLineSize(wxSlider *Self)
		{
		return Self->GetLineSize();
		}
	
	int wxSlider_GetMax(wxSlider *Self)
		{
		return Self->GetMax();
		}
	
	int wxSlider_GetMin(wxSlider *Self)
		{
		return Self->GetMin();
		}
	
	int wxSlider_GetPageSize(wxSlider *Self)
		{
		return Self->GetPageSize();
		}
	
	int wxSlider_GetSelEnd(wxSlider *Self)
		{
		return Self->GetSelEnd();
		}
	
	int wxSlider_GetSelStart(wxSlider *Self)
		{
		return Self->GetSelStart();
		}
	
	int wxSlider_GetThumbLength(wxSlider *Self)
		{
		return Self->GetThumbLength();
		}
	
	int wxSlider_GetTickFreq(wxSlider *Self)
		{
		return Self->GetTickFreq();
		}
	
	int wxSlider_GetValue(wxSlider *Self)
		{
		return Self->GetValue();
		}
	
	void wxSlider_SetRange(wxSlider *Self, int MinValue, int MaxValue)
		{
		return Self->SetRange(MinValue, MaxValue);
		}
	
	void wxSlider_SetTickFreq(wxSlider *Self, int Frequency, int Position)
		{
		return Self->SetTickFreq(Frequency, Position);
		}
	
	void wxSlider_SetLineSize(wxSlider *Self, int LineSize)
		{
		return Self->SetLineSize(LineSize);
		}
	
	void wxSlider_SetPageSize(wxSlider *Self, int PageSize)
		{
		return Self->SetPageSize(PageSize);
		}
	
	void wxSlider_SetSelection(wxSlider *Self, int StartPos, int EndPos)
		{
		return Self->SetSelection(StartPos, EndPos);
		}
	
	void wxSlider_SetThumbLength(wxSlider *Self, int Length)
		{
		return Self->SetThumbLength(Length);
		}
	
	void wxSlider_SetTick(wxSlider *Self, int TickPos)
		{
		return Self->SetTick(TickPos);
		}
	
	void wxSlider_SetValue(wxSlider *Self, int Value)
		{
		return Self->SetValue(Value);
		}
	};
