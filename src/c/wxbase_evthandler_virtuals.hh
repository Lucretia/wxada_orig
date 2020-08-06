// wxbase_evthandler_virtuals.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence

#ifndef _WXBASE_EVTHANDLER_VIRTUALS_H_
#define _WXBASE_EVTHANDLER_VIRTUALS_H_


#include "wx_debug.hh"


/* Structure of the virtual functions:
 *
 * WXADA_DECLARE_*
 *   A1) Provide the virtual for this class.
 *   A2) Provide an inline which when called, calls the base class' version of the virtual.
 * 
 * WXADA_DECLARE_*_VIRTUALS
 *   B1) Provide a list of virtuals to declare for this base class.
 * 
 * WXADA_IMPLEMENT_*
 *   C1) Provide the external C name for the Ada specific function to call, i.e. the virtual proxy in Ada.
 *   C2) Provide the implementation for the virtual (A1) for this class which calls the Ada proxy (C1).
 *   C3) Provide a C function which calls the base virtual (A2) for this class.
 *
 * WXADA_IMPLEMENT_*_VIRTUALS
 *   D1) Provide a list of virtuals to define for this class, giving:
 *       a) the name of the class these virtual functions belong to.
 *       b) this class' base class.
 *       c) the prefix to use for all Ada proxy functions.
 */

#define WXADA_DECLARE_EVTHANDLER_PROCESSEVENT(baseclass)	\
	virtual bool ProcessEvent(wxEvent &event); \
	\
	inline bool Base_ProcessEvent(wxEvent &event) \
		{ \
		WXADA_MSG("[" + wxString(this->GetClassInfo()->GetClassName()) + "'s Base_ProcessEvent]\n"); \
		\
		return baseclass::ProcessEvent(event); \
		}

/*
#define WXADA_DECLARE_EVTHANDLER_SEARCHEVENTTABLE(baseclass)	\
	virtual bool SearchEventTable(wxEventTable &table, wxEvent &event); \
	\
	inline bool Base_SearchEventTable(wxEventTable &table, wxEvent &event) \
		{ \
		return baseclass::SearchEventTable(table, event); \
		}
*/

#define WXADA_DECLARE_EVTHANDLER_VIRTUALS(baseclass)	\
	WXADA_DECLARE_EVTHANDLER_PROCESSEVENT(baseclass)


#define WXADA_IMPLEMENT_EVTHANDLER_PROCESSEVENT(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self, wxEvent *Event); \
		} \
	\
	bool classname::ProcessEvent(wxEvent &Event) \
		{ \
		WXADA_MSG("[" #classname "::ProcessEvent]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, &Event) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_ProcessEvent(classname *Self, wxEvent *Event) \
			{ \
			WXADA_MSG("[" #baseclass "_ProcessEvent]\n"); \
			\
			return Self->Base_ProcessEvent(*Event) == true ? 1 : 0; \
			} \
		};


#define WXADA_IMPLEMENT_EVTHANDLER_VIRTUALS(classname, baseclass, adaprefix)	\
	WXADA_IMPLEMENT_EVTHANDLER_PROCESSEVENT(classname, baseclass, Ada_##adaprefix##_Process_Event)


#endif // !_WXBASE_EVTHANDLER_VIRTUALS_H_
