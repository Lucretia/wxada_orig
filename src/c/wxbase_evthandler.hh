// wxbase_evthandler.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// wxEvent is abstract and as such cannot be instantiated as is. This file implements base classes which can be derived from within Ada.

#ifndef _WXBASE_EVTHANDLER_H_
#define _WXBASE_EVTHANDLER_H_


extern "C"
	{
	// This is the actual Ada event handler function.
	extern void Ada_Event_Handler(void *ParentEventHandler, void *Callback, wxEvent *Event, const wxChar *ClassName);
	extern void *wxInstanceStore_FindClass(wxObject *Instance);
	};

	
class wxAdaCallbackObject : public wxEvtHandler//wxObject
	{
//	DECLARE_ABSTRACT_CLASS(wxAdaCallbackObject);
	public:
		wxAdaCallbackObject(void *ParentEventHandler, void *Callback_Function);
		~wxAdaCallbackObject();
		
		void EventHandler(wxEvent &Event);
		
		// TODO: Store a pointer to the Ada 'Class of the event handler type.
		void *_ParentEventHandler;
		void *_Callback;
	};


class wxAdaEvtHandler : public wxEvtHandler
	{
	DECLARE_DYNAMIC_CLASS(wxAdaEvtHandler);
	
	public:
		wxAdaEvtHandler()
			: wxEvtHandler()/*,
			  _AdaObject(NULL)*/
			{
			}
			
		virtual ~wxAdaEvtHandler()
			{
			}
		
		// Override the virtuals here.
		WXADA_DECLARE_EVTHANDLER_VIRTUALS(wxEvtHandler)
		
		// This points to an Ada class-wide type.
		//void *_AdaObject;
	};


#endif // !_WXBASE_EVTHANDLER_H_
