// wxcore_keyevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxKeyEvent class.

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
	wxKeyEvent *wxKeyEvent_ctor(int Command_Id)
		{
		return new wxKeyEvent(Command_Id);
		}
	
	void wxKeyEvent_dtor(wxKeyEvent *Self)
		{
		delete Self;
		}
		
	int wxKeyEvent_AltDown(wxKeyEvent *Self)
		{
		return Self->AltDown() == true ? 1 : 0;
		}
		
	int wxKeyEvent_CmdDown(wxKeyEvent *Self)
		{
		return Self->CmdDown() == true ? 1 : 0;
		}
		
	int wxKeyEvent_ControlDown(wxKeyEvent *Self)
		{
		return Self->ControlDown() == true ? 1 : 0;
		}
		
	int wxKeyEvent_GetKeyCode(wxKeyEvent *Self)
		{
		return Self->GetKeyCode();
		}
		
	void wxKeyEvent_GetPosition(wxKeyEvent *Self, int *x, int *y)
		{
		Self->GetPosition(wx_static_cast(wxCoord *, x), wx_static_cast(wxCoord *, y));
		}
		
	int wxKeyEvent_GetRawKeyCode(wxKeyEvent *Self)
		{
		return Self->GetRawKeyCode();
		}
		
	int wxKeyEvent_GetRawKeyFlags(wxKeyEvent *Self)
		{
		return Self->GetRawKeyFlags();
		}
		
	wxChar wxKeyEvent_GetUnicodeKey(wxKeyEvent *Self)
		{
#if wxUSE_UNICODE == 1
		return Self->GetUnicodeKey();
#else
		return 0;
#endif // wxUSE_UNICODE == 1
		}
		
	int wxKeyEvent_GetX(wxKeyEvent *Self)
		{
		return Self->GetX();
		}
		
	int wxKeyEvent_GetY(wxKeyEvent *Self)
		{
		return Self->GetY();
		}
		
	int wxKeyEvent_HasModifiers(wxKeyEvent *Self)
		{
		return Self->HasModifiers() == true ? 1 : 0;
		}
		
	int wxKeyEvent_MetaDown(wxKeyEvent *Self)
		{
		return Self->MetaDown() == true ? 1 : 0;
		}
		
	int wxKeyEvent_ShiftDown(wxKeyEvent *Self)
		{
		return Self->ShiftDown() == true ? 1 : 0;
		}
	};
