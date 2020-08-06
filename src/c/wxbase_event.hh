// wxbase_event.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// wxEvent is abstract and as such cannot be instantiated as is. This file implements base classes which can be derived from within Ada.

#ifndef _WXBASE_EVENT_H_
#define _WXBASE_EVENT_H_


#include "wx_debug.hh"
//#include "wxadaobject.h"


class wxAdaEvent : public wxEvent
	{
//	DECLARE_DYNAMIC_CLASS(wxAdaEvent)
	DECLARE_ABSTRACT_CLASS(wxAdaEvent)

	public:
		wxAdaEvent(int id, int eventType)
			: wxEvent(id, eventType)/*,
			  _AdaEvent(NULL)*/
			{
			}

		wxAdaEvent(const wxAdaEvent &Event)
			: wxEvent(Event)/*,
			  _AdaEvent(Event._AdaEvent)*/
			{
			//wxASSERT_MSG(_AdaEvent != NULL, "Internal Ada Event pointer is NULL\n");
			WXADA_MSG("WARNING [wxAdaEvent] Copy constructor, this may cause the Ada types to have duplicate C++ pointers!\n");
			}

		//IMPLEMENT_ADA_COPY_CONSTRUCTOR(wxAdaEvent)
		//IMPLEMENT_ADA_DESTRUCTOR(wxAdaEvent)
		
		wxEvent *Clone() const
			{
			//printf("[wxAdaEvent::Clone]\n");
			//return new wxAdaEvent(*this);
			wxAdaEvent *p = new wxAdaEvent(*this);

			WXADA_MSG(wxString::Format("[wxAdaEvent::Clone]\n\tp: %s\n\tEvent Type: %d\n",
				p->GetClassInfo()->GetClassName(),
				p->GetEventType()));
				
			return p;
			}
	
		int GetPropagationState() const
			{
			return m_propagationLevel;
			}
			
		//IMPLEMENT_ADA_OBJECT
		//void *_AdaEvent;
	};


#endif // !_WXBASE_EVENT_H_
