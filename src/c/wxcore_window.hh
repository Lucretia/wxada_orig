// wxcore_window.h
// 
// Copyright © 2005 Luke A. Guest
//
// wxEvent is abstract and as such cannot be instantiated as is. This file implements base classes which can be derived from within Ada.
//
// Distributed under the wxWidgets Licence

#ifndef _WXCORE_WINDOW_H_
#define _WXCORE_WINDOW_H_


#include "wx_debug.hh"


extern "C"
	{
	extern void *wxInstanceStore_FindClass(const wxWindow *Instance);
	};

	
class wxAdaWindow : public wxWindow
	{
	DECLARE_DYNAMIC_CLASS(wxAdaWindow)
//	DECLARE_ABSTRACT_CLASS(wxAdaWindow)

	public:
		wxAdaWindow()
			: wxWindow()/*,
			  _AdaObject(NULL)*/
			{
			}
			
		wxAdaWindow(wxWindow *Parent, int Id, const wxPoint &Position, const wxSize &Size)
			: wxWindow(Parent, Id, Position, Size)/*,
			  _AdaObject(NULL)*/
			{
			}
		
		virtual ~wxAdaWindow()
			{
			WXADA_MSG("[wxAdaWindow::~wxAdaWindow]\n");
			}

//		WXADA_DECLARE_EVTHANDLER_VIRTUALS(wxWindow)
		WXADA_DECLARE_WINDOW_VIRTUALS(wxWindow)
		
		// This points to an Ada class-wide type.
		//void *_AdaObject;
	};


#endif // !_WXCORE_WINDOW_H_
