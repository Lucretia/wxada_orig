// wxcore_finddialogevent.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxFindDialogEvent class.

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

#include <wx/fdrepdlg.h>


extern "C"
	{
	wxFindDialogEvent *wxFindDialogEvent_ctor(int Command_Id, int Id)
		{
		return new wxFindDialogEvent(Command_Id, Id);
		}
	
	void wxFindDialogEvent_dtor(wxFindDialogEvent *Self)
		{
		delete Self;
		}
	
	int wxFindDialogEvent_GetFlags(wxFindDialogEvent *Self)
		{
		return Self->GetFlags();
		}
	
	const wxChar *wxFindDialogEvent_GetFindString(wxFindDialogEvent *Self)
		{
		return Self->GetFindString();
		}
	
	const wxChar *wxFindDialogEvent_GetReplaceString(wxFindDialogEvent *Self)
		{
		return Self->GetReplaceString();
		}
	
	wxFindReplaceDialog *wxFindDialogEvent_GetDialog(wxFindDialogEvent *Self)
		{
		return Self->GetDialog();
		}
	};
