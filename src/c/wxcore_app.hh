// wxcore_app.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// This application class should be used for all GUI based applications in wxAda.
//
//  wxAdaApp
//      |
//    wxApp
//      |
//  wxAppBase
//      |
// wxAppConsole
//      |
// wxEvtHandler

#ifndef _WXCORE_APP_H_
#define _WXCORE_APP_H_


#include "wx_debug.hh"


extern "C"
	{
	// These two functions come from the Ada wx.Base.App package.
	void Root_App_Virtual_On_Init(void *Self, bool *Error);
	void Root_App_Virtual_On_Exit(void *Self, int *Error);
	};

class wxAdaApp : public wxApp
	{
	public:
		wxAdaApp(void *Ada_Object)
			: Ada_Object(Ada_Object)
			{
			}
		
		virtual ~wxAdaApp()
			{
			Ada_Object = NULL;
			}
		
		virtual bool OnInit()
			{
			bool Error = wxApp::OnInit();
			
			if (Error == false)
				{
				return false;
				}
			
			WXADA_MSG("[wxAdaApp::OnInit]\n");
			
			Root_App_Virtual_On_Init(Ada_Object, &Error);
			
			WXADA_MSG(wxString::Format("[wxAdaApp::OnInit] Error: %d\n", Error));

			return Error == 1 ? true : false;
			}
		
		virtual int OnExit()
			{
			int Error;
			
			WXADA_MSG("[wxAdaApp::OnExit] 1\n");
			
			Root_App_Virtual_On_Exit(Ada_Object, &Error);
			
			WXADA_MSG("[wxAdaApp::OnExit] 2\n");
			
			return wxApp::OnExit();
			}
		
	private:
		// This is the actual Ada wx.Base.App.App_Type instance.
		void *Ada_Object;
	};


#endif // !_WXCORE_APP_H_
