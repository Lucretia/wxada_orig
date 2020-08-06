// wxbase_app.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// This application class should only be used for console based applications in wxAda.
//
// wxAdaAppConsole
//       |
//  wxAppConsole
//       |
//  wxEvtHandler

#ifndef _WXBASE_APP_H_
#define _WXBASE_APP_H_


#include "wx_debug.hh"


extern "C"
	{
	// These two functions come from the Ada wx.Base.App package.
	void Root_App_Virtual_On_Init(void *Self, bool *Error);
	void Root_App_Virtual_On_Exit(void *Self, int *Error);
	};

class wxAdaAppConsole : public wxAppConsole
	{
	public:
		wxAdaAppConsole(void *Ada_Object)
			: Ada_Object(Ada_Object)
			{
			}
		
		virtual ~wxAdaAppConsole()
			{
			Ada_Object = NULL;
			}
		
		virtual bool OnInit()
			{
			bool Error = wxAppConsole::OnInit();
			
			if (Error == false)
				{
				return false;
				}
			
			WXADA_MSG("[wxAdaAppConsole::OnInit]\n");
			
			Root_App_Virtual_On_Init(Ada_Object, &Error);
			
			return Error;
			}
		
		virtual int OnExit()
			{
			int Error;
			
			WXADA_MSG("[wxAdaAppConsole::OnExit] 1\n");
			
			Root_App_Virtual_On_Exit(Ada_Object, &Error);
			
			WXADA_MSG("[wxAdaAppConsole::OnExit] 2\n");
			
			return wxAppConsole::OnExit();
			}
		
		virtual int OnRun()
			{
			WXADA_MSG("[wxAdaAppConsole::OnRun] TODO!\n");
			
			return 1;
			}
		
	private:
		// This is the actual Ada wx.Base.App.App_Type instance.
		void *Ada_Object;
	};


#endif // !_WXBASE_APP_H_
