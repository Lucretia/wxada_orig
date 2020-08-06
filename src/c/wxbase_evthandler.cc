// wxbase_evthandler.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxEvtHandler class.

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


#include "wxbase_evthandler_virtuals.hh"
#include "wxbase_evthandler.hh"


wxAdaCallbackObject::wxAdaCallbackObject(void *ParentEventHandler, void *Callback_Function)
	: _ParentEventHandler(ParentEventHandler),
	  _Callback(Callback_Function)
	{
	WXADA_MSG(wxString::Format("[wxAdaCallbackObject::wxAdaCallbackObject] _ParentEventHandler: %p\t_Callback: %p\n",
	  _ParentEventHandler, _Callback));
	}

		
wxAdaCallbackObject::~wxAdaCallbackObject()
	{
	}


// wxAdaCallbackObject::EventHandler
//
// Grab the Ada function and the actual C++ event object, and send it over to the Ada side of the code.
// There will always be one of these per event, so there's no need to add any task synchronisation code, and even if we
// did need it, it'd be in Ada.
void wxAdaCallbackObject::EventHandler(wxEvent &Event)
	{
	wxAdaCallbackObject *CallbackObject = wx_static_cast(wxAdaCallbackObject *, Event.m_callbackUserData);
	
	WXADA_MSG(wxString::Format("[wxAdaCallbackObject::EventHandler]\n\t_ParentEventHandler: %p\n\t_Callback: %p\n\tEvent Type: %d\n",
		CallbackObject->_ParentEventHandler,
		CallbackObject->_Callback,
		Event.GetEventType()));
	
	// TODO: Pass the pointer to 'Class of the Ada event handler type instead of the C++ event handler here. We can
	//       get the C++ pointer back from the Ada type in Ada anyway!
	Ada_Event_Handler(
		CallbackObject->_ParentEventHandler,
		CallbackObject->_Callback,
		&Event,
		Event.GetClassInfo()->GetClassName());
	}


IMPLEMENT_DYNAMIC_CLASS(wxAdaEvtHandler, wxEvtHandler);
	
WXADA_IMPLEMENT_EVTHANDLER_VIRTUALS(wxAdaEvtHandler, wxEvtHandler, Event_Handler)


extern "C"
	{
	wxEvtHandler *wxEvtHandler_ctor()
		{
		return new wxAdaEvtHandler;
		}
	
	void wxEvtHandler_dtor(wxAdaEvtHandler *Self)
		{
		delete Self;
		}
	
	void wxEvtHandler_AddPendingEvent(wxAdaEvtHandler *Self, wxEvent *Event)
		{
		Self->AddPendingEvent(*Event);
		}
	
	// wxEvtHandler_Connect
	//
	// Set the callback to be a "thunking" function, which handles the creation of Ada event types.
	void wxEvtHandler_Connect(wxAdaEvtHandler *Self, int Id, int LastId, int EventType, void *ParentEventHandler, void *Callback)
		{
		// The memory allocated will be deleted for us in the Disconnect function.
		WXADA_MSG(wxString::Format("[wxEvtHandler_Connect]\n\tName: \'%s\'\n\tEventType: %d\n\tSelf: %p\n\t_ParentEventHandler: %p\n\t_Callback: %p\n",
			Self->GetClassInfo()->GetClassName(),
			EventType,
			Self,
			ParentEventHandler,
			Callback));
		
		wxObjectEventFunction EventCallback = wx_static_cast(wxObjectEventFunction, &wxAdaCallbackObject::EventHandler);
		
		Self->Connect(Id, LastId, EventType, EventCallback, new wxAdaCallbackObject(ParentEventHandler, Callback));
		}
	
	int wxEvtHandler_Disconnect(wxAdaEvtHandler *Self, int Id, int LastId, int EventType)
		{
		return Self->Disconnect(Id, LastId, EventType, wx_static_cast(wxObjectEventFunction, &wxAdaCallbackObject::EventHandler)) == true ? 1 : 0;
		}
	
	void *wxEvtHandler_GetClientData(wxAdaEvtHandler *Self)
		{
		return Self->GetClientData();
		}
	
	wxClientData *wxEvtHandler_GetClientObject(wxAdaEvtHandler *Self)
		{
		return Self->GetClientObject();
		}
	
	int wxEvtHandler_GetEvtHandlerEnabled(wxAdaEvtHandler *Self)
		{
		return Self->GetEvtHandlerEnabled() == true ? 1 : 0;
		}
	
	wxEvtHandler *wxEvtHandler_GetNextHandler(wxAdaEvtHandler *Self)
		{
		return Self->GetNextHandler();
		}
	
	wxEvtHandler *wxEvtHandler_GetPreviousHandler(wxAdaEvtHandler *Self)
		{
		return Self->GetPreviousHandler();
		}
	
	/* Handled above in macro code.
	int wxEvtHandler_ProcessEvent(wxAdaEvtHandler *Self, wxEvent *Event)
		{
		return Self->ProcessEvent(*Event) == true ? 1 : 0;
		}
	*/
	
	int wxEvtHandler_SearchEventTable(wxAdaEvtHandler *Self, wxEventTable *Table, wxEvent *Event)
		{
		return Self->SearchEventTable(*Table, *Event) == true ? 1 : 0;
		}
	
	void wxEvtHandler_SetClientData(wxAdaEvtHandler *Self, void *Data)
		{
		Self->SetClientData(Data);
		}
	
	void wxEvtHandler_SetClientObject(wxAdaEvtHandler *Self, wxClientData *Data)
		{
		Self->SetClientObject(Data);
		}
	
	void wxEvtHandler_SetEvtHandlerEnabled(wxAdaEvtHandler *Self, int Enabled)
		{
		Self->SetEvtHandlerEnabled(Enabled);
		}
	
	void wxEvtHandler_SetNextHandler(wxAdaEvtHandler *Self, wxEvtHandler *Handler)
		{
		Self->SetNextHandler(Handler);
		}
	
	void wxEvtHandler_SetPreviousHandler(wxAdaEvtHandler *Self, wxEvtHandler *Handler)
		{
		Self->SetPreviousHandler(Handler);
		}
		
		/*
	// These are wxAdaEvtHandler support functions.
	void wxEvtHandler_SetAdaObject(wxAdaEvtHandler *Self, void *AdaEvtHandler)
		{
		Self->_AdaObject = AdaEvtHandler;
		}
		
	void *wxEvtHandler_GetAdaObject(wxAdaEvtHandler *Self)
		{
		return Self->_AdaObject;
		}
		*/
	};
