// wxbase_event.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxEvent class.

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


#include "wxbase_event.hh"


//IMPLEMENT_ADA_ACCESSORS(wxAdaEvent)
	
//IMPLEMENT_DYNAMIC_CLASS(wxAdaEvent, wxEvent)
IMPLEMENT_ABSTRACT_CLASS(wxAdaEvent, wxEvent)


extern "C"
	{
	wxAdaEvent *wxEvent_ctor(int id, int eventType)
		{
		return new wxAdaEvent(id, eventType);
		}
	
	void wxEvent_dtor(wxAdaEvent *Self)
		{
		delete Self;
		}
	
	int wxEvent_NewEventType()
		{
		return wxNewEventType();
		}
	
	wxObject* wxEvent_GetEventObject(wxAdaEvent *Self)
		{
		return Self->GetEventObject();
		}
	
	int wxEvent_GetEventType(wxAdaEvent *Self)
		{
		return Self->GetEventType();
		}
		
	int wxEvent_GetId(wxAdaEvent *Self)
		{
		return Self->GetId();
		}
		
	int wxEvent_GetSkipped(wxAdaEvent *Self)
		{
		return Self->GetSkipped() == true ? 1 : 0;
		}
		
	long wxEvent_GetTimestamp(wxAdaEvent *Self)
		{
		return Self->GetTimestamp();
		}
	
	int wxEvent_GetPropagationState(wxAdaEvent *Self)
		{
		return Self->GetPropagationState();
		}
		
	int wxEvent_IsCommandEvent(wxAdaEvent *Self)
		{
		return Self->IsCommandEvent() == true ? 1 : 0;
		}
		
	void wxEvent_ResumePropagation(wxAdaEvent *Self, int PropagationLevel)
		{
		Self->ResumePropagation(PropagationLevel);
		}
		
	void wxEvent_SetEventObject(wxAdaEvent *Self, wxObject *Object)
		{
		Self->SetEventObject(Object);
		}
	
	void wxEvent_SetEventType(wxAdaEvent *Self, int EventType)
		{
		Self->SetEventType(EventType);
		}
		
	void wxEvent_SetId(wxAdaEvent *Self, int Id)
		{
		Self->SetId(Id);
		}
		
	void wxEvent_SetTimestamp(wxAdaEvent *Self, long TimeStamp)
		{
		Self->SetTimestamp(TimeStamp);
		}
		
	int wxEvent_ShouldPropagate(wxAdaEvent *Self)
		{
		return Self->ShouldPropagate() == true ? 1 : 0;
		}
		
	void wxEvent_Skip(wxAdaEvent *Self, int Skip)
		{
		Self->Skip(Skip);
		}
		
	int wxEvent_StopPropagation(wxAdaEvent *Self)
		{
		return Self->StopPropagation();
		}

	/*
	// These are wxAdaEvent support functions which get used in the event handling code only.
	void wxEvent_SetAdaEvent(wxAdaEvent *Self, void *AdaEvent)
		{
		Self->_AdaEvent = AdaEvent;
		}
		
	void *wxEvent_GetAdaEvent(wxAdaEvent *Self)
		{
		return Self->_AdaEvent;
		}
		*/
	};
