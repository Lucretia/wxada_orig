// wxcore_joystickevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxJoystickEvent class.

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
	wxJoystickEvent *wxJoystickEvent_ctor(int Command_Id, int State, int Joystick, int Change)
		{
		return new wxJoystickEvent(Command_Id, State, Joystick, Change);
		}
	
	void wxJoystickEvent_dtor(wxJoystickEvent *Self)
		{
		delete Self;
		}
		
	int wxJoystickEvent_ButtonDown(wxJoystickEvent *Self, int Button)
		{
		return Self->ButtonDown(Button) == true ? 1 : 0;
		}
		
	int wxJoystickEvent_ButtonIsDown(wxJoystickEvent *Self, int Button)
		{
		return Self->ButtonIsDown(Button) == true ? 1 : 0;
		}
		
	int wxJoystickEvent_GetButtonChange(wxJoystickEvent *Self)
		{
		return Self->GetButtonChange();
		}
		
	int wxJoystickEvent_GetButtonState(wxJoystickEvent *Self)
		{
		return Self->GetButtonState();
		}
		
	int wxJoystickEvent_GetJoystick(wxJoystickEvent *Self)
		{
		return Self->GetJoystick();
		}
		
	void wxJoystickEvent_GetPosition(wxJoystickEvent *Self, int *x, int *y)
		{
		wxPoint Position = Self->GetPosition();
		
		*x = Position.x;
		*y = Position.y;
		}
		
	int wxJoystickEvent_GetZPosition(wxJoystickEvent *Self)
		{
		return Self->GetZPosition();
		}
		
	int wxJoystickEvent_IsButton(wxJoystickEvent *Self)
		{
		return Self->IsButton() == true ? 1 : 0;
		}
		
	int wxJoystickEvent_IsMove(wxJoystickEvent *Self)
		{
		return Self->IsMove() == true ? 1 : 0;
		}
		
	int wxJoystickEvent_IsZMove(wxJoystickEvent *Self)
		{
		return Self->IsZMove() == true ? 1 : 0;
		}
	};
