// wxbase_frame.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxFrame class.

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


#include "wxcore_frame_virtuals.hh"
#include "wxcore_frame.hh"


IMPLEMENT_DYNAMIC_CLASS(wxAdaFrame, wxFrame)

//WXADA_IMPLEMENT_FRAME_VIRTUALS(wxAdaFrame, wxFrame, Frame)


extern "C"
	{
	wxAdaFrame *wxFrame_ctor(wxWindow *Parent, wxWindowID Id, const wxChar *Title, int X, int Y, int Width, int Height)
		{
		printf("[wxFrame_ctor]\n");
		return new wxAdaFrame(Parent, Id, Title, wxPoint(X, Y), wxSize(Width, Height));
		}
	
	void wxFrame_dtor(wxAdaFrame *Self)
		{
		printf("[wxFrame_dtor]\n");
		delete Self;
		}
		
	void wxFrame_SetStatusBar(wxFrame *Self, wxStatusBar *StatusBar)
		{
		Self->SetStatusBar(StatusBar);
		}
	};
