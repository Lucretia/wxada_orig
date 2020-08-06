// wxcore_sizer.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxSizer class.

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


#include "wxcore_sizer.hh"


IMPLEMENT_ABSTRACT_CLASS(wxAdaSizer, wxSizer)


extern "C"
	{
	wxAdaSizer *wxSizer_ctor()
		{
		wxAdaSizer *p = new wxAdaSizer;
		printf("[wxSizer_ctor] %p\n", p);
		return p;
		}
	
	void wxSizer_dtor(wxAdaSizer *Self)
		{
		printf("[wxSizer_dtor]\n");
		delete Self;
		}
	
	/*wxSizerItem **/void wxSizer_Add(wxAdaSizer *Self, wxWindow *Window, int Proportion, int Flags, int Border)
		{
		Self->Add(Window, Proportion, Flags, Border);
		}
	
	/*wxSizerItem **/void wxSizer_AddSpacer(wxAdaSizer *Self, int Size)
		{
		Self->AddSpacer(Size);
		}
	
	/*wxSizerItem **/void wxSizer_AddStretchSpacer(wxAdaSizer *Self, int Proportion)
		{
		Self->AddStretchSpacer(Proportion);
		}
	
	void wxSizer_SetSizeHints(wxAdaSizer *Self, wxWindow *Window)
		{
		Self->SetSizeHints(Window);
		}
	
	void wxSizer_SetVirtualSizeHints(wxAdaSizer *Self, wxWindow *Window)
		{
		Self->SetVirtualSizeHints(Window);
		}
	};
