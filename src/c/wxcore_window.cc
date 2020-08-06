// wxbase_window.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxWindow class.

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


#include "wxcore_window_virtuals.hh"
#include "wxcore_window.hh"


IMPLEMENT_DYNAMIC_CLASS(wxAdaWindow, wxWindow)
//IMPLEMENT_ABSTRACT_CLASS(wxAdaWindow)

//WXADA_IMPLEMENT_EVTHANDLER_VIRTUALS(wxAdaWindow, wxWindow, Window)
WXADA_IMPLEMENT_WINDOW_VIRTUALS(wxAdaWindow, wxWindow, Window)


extern "C"
	{
	wxAdaWindow *wxWindow_ctor(wxWindow *Parent, int Id, int X, int Y, int Width, int Height)
		{
		return new wxAdaWindow(Parent, Id, wxPoint(X, Y), wxSize(Width, Height));
		}
	
	void wxWindow_dtor(wxAdaWindow *Self)
		{
		delete Self;
		}
	
	void wxWindow_CacheBestSize(wxWindow *Self, int Width, int Height)
		{
		Self->CacheBestSize(wxSize(Width, Height));
		}
	
	void wxWindow_Centre(wxWindow *Self, int Direction)
		{
		Self->Centre(Direction);
		}
		
	void wxWindow_CentreOnParent(wxWindow *Self, int Direction)
		{
		Self->CentreOnParent(Direction);
		}
	/* Now only TopLevelWindow
	void wxWindow_CentreOnScreen(wxWindow *Self, int Direction)
		{
		Self->CentreOnScreen(Direction);
		}
	*/
	void wxWindow_ClearBackground(wxWindow *Self)
		{
		Self->ClearBackground();
		}
	
	/* void ClientToScreen(int* x, int* y) const
	 * wxPoint ClientToScreen(const wxPoint& pt) const
	 *
	 * The second ClientToScreen wraps the first.
	 *
	 * The first then calls this virtual:
	 *
	 * virtual void DoClientToScreen( int *x, int *y ) const = 0;
	 */
	void wxWindow_ClientToScreen(wxWindow *Self, int *X, int *Y)
		{
		printf("[wxWindow_ClientToScreen] Input (%d, %d)\n", *X, *Y);
		
		Self->ClientToScreen(X, Y);
		
		printf("[wxWindow_ClientToScreen] Output (%d, %d)\n", *X, *Y);
		}
	
	int wxWindow_Close(wxWindow *Self, int Force)
		{
		return Self->Close(Force == 1 ? true : 0) == true ? 1 : 0;
		}
		
	void wxWindow_ConvertDialogToPixels_For_Point(wxWindow *Self, int InX, int InY, int *OutX, int *OutY)
		{
		wxPoint Result;
		wxPoint Input(InX, InY);
		
		Result = Self->ConvertDialogToPixels(Input);
		
		*OutX = Result.x;
		*OutY = Result.y;
		}
	
	void wxWindow_ConvertDialogToPixels_For_Size(wxWindow *Self, int InWidth, int InHeight, int *OutWidth, int *OutHeight)
		{
		wxSize Result;
		wxSize Input(InWidth, InHeight);
		
		Result = Self->ConvertDialogToPixels(Input);
		
		*OutWidth  = Result.GetWidth();
		*OutHeight = Result.GetHeight();
		}
	
	void wxWindow_ConvertPixelsToDialog_For_Point(wxWindow *Self, int InX, int InY, int *OutX, int *OutY)
		{
		wxPoint Result;
		wxPoint Input(InX, InY);
		
		Result = Self->ConvertPixelsToDialog(Input);
		
		*OutX = Result.x;
		*OutY = Result.y;
		}
	
	void wxWindow_ConvertPixelsToDialog_For_Size(wxWindow *Self, int InWidth, int InHeight, int *OutWidth, int *OutHeight)
		{
		wxSize Result;
		wxSize Input(InWidth, InHeight);
		
		Result = Self->ConvertPixelsToDialog(Input);
		
		*OutWidth  = Result.GetWidth();
		*OutHeight = Result.GetHeight();
		}

	void wxWindow_DestroyChildren(wxWindow *Self)
		{
		Self->DestroyChildren();
		}
	
	/* virtual void DragAcceptFiles(bool accept)
	 *
	 * This is only available on Windaz.
	 */
	
	//static wxWindow* FindFocus()
	
	wxWindow *wxWindow_FindWindow(wxWindow *Self, long Id)
		{
		return Self->FindWindow(Id);
		}
		
	wxWindow *wxWindow_FindWindow_By_Name(wxWindow *Self, const wxChar *Name)
		{
		return Self->FindWindow(Name);
		}
		
	//static wxWindow* FindWindowById(long id, wxWindow* parent = NULL)
	//static wxWindow* FindWindowByName(const wxString& name, wxWindow* parent = NULL)
	//static wxWindow* FindWindowByLabel(const wxString& label, wxWindow* parent = NULL)
	//wxAcceleratorTable* GetAcceleratorTable() const
	//wxAccessible* GetAccessible()

	/* Deprecated	
	void wxWindow_GetAdjustedBestSize(wxWindow *Self, int *Width, int *Height)
		{
		wxSize BestSize = Self->GetAdjustedBestSize();
		
		*Width  = BestSize.GetWidth();
		*Height = BestSize.GetHeight();
		}
	*/
	
	void wxWindow_GetBackgroundColour(wxWindow *Self, int *Red, int *Green, int *Blue)
		{
		wxColour Colour = Self->GetBackgroundColour();

		*Red   = Colour.Red();
		*Green = Colour.Green();
		*Blue  = Colour.Blue();
		}
	
	//virtual wxBackgroundStyle GetBackgroundStyle() const
	
	/* Deprecated	
	void wxWindow_GetBestFittingSize(wxWindow *Self, int *Width, int *Height)
		{
		wxSize BestSize = Self->GetBestFittingSize();
		
		*Width  = BestSize.GetWidth();
		*Height = BestSize.GetHeight();
		}
	*/
	
	void wxWindow_GetBestSize(wxWindow *Self, int *Width, int *Height)
		{
		wxSize BestSize = Self->GetBestSize();
		
		*Width  = BestSize.GetWidth();
		*Height = BestSize.GetHeight();
		}
	
	// TODO: wxCaret * GetCaret() const
	
	//static wxWindow * GetCapture()
	//wxList& GetChildren()
	//static wxVisualAttributes GetClassDefaultAttributes(wxWindowVariant variant = wxWINDOW_VARIANT_NORMAL)
	
	void wxWindow_GetClientSize(wxWindow *Self, int *Width, int *Height)
		{
		Self->GetClientSize(Width, Height);
		}
		
	//wxLayoutConstraints* GetConstraints() const
	//const wxSizer * GetContainingSizer() const
	//const wxCursor& GetCursor() const
	//virtual wxVisualAttributes GetDefaultAttributes() const
	//wxDropTarget* GetDropTarget() const
	//wxEvtHandler* GetEventHandler() const
	//long GetExtraStyle() const
	//wxFont GetFont() const
	
	void wxWindow_GetForegroundColour(wxWindow *Self, int *Red, int *Green, int *Blue)
		{
		wxColour Colour = Self->GetForegroundColour();

		*Red   = Colour.Red();
		*Green = Colour.Green();
		*Blue  = Colour.Blue();
		}
	
	wxWindow *wxWindow_GetGrandParent(wxWindow *Self)
		{
		return Self->GetGrandParent();
		}
		
	//void* GetHandle() const
	//virtual wxString GetHelpText() const
	
	int wxWindow_GetId(wxWindow *Self)
		{
		return Self->GetId();
		}
		
	wxWindow *wxWindow_GetParent(wxWindow *Self)
		{
		return Self->GetParent();
		}
		
	void wxWindow_GetPosition(wxWindow *Self, int *x, int *y)
		{
		Self->GetPosition(x, y);
		}
		
	void wxWindow_GetSize(wxWindow *Self, int *Width, int *Height)
		{
		Self->GetSize(Width, Height);
		}
		
	//TODO: wxSizer * GetSizer() const
	//TODO: virtual void GetTextExtent(const wxString& string, int* x, int* y, int* descent = NULL, int* externalLeading = NULL, const wxFont* font = NULL, bool use16 = false) const
	//TODO: wxToolTip* GetToolTip() const
	//TODO: virtual wxRegion GetUpdateRegion() const
	//TODO: wxValidator* GetValidator() const
	
	void wxWindow_GetVirtualSize(wxWindow *Self, int *Width, int *Height)
		{
		Self->GetVirtualSize(Width, Height);
		}
	
	int wxWindow_GetWindowVariant(wxWindow *Self)
		{
		return Self->GetWindowVariant();
		}
		
	//virtual bool HasScrollbar(int orient) const
	int wxWindow_HasScrollbar(wxWindow *Self, int orient)
		{
		return Self->HasScrollbar(orient);
		}
		
	//bool Hide()
	
	void wxWindow_InvalidateBestSize(wxWindow *Self)
		{
		Self->InvalidateBestSize();
		}
	
	int wxWindow_IsExposed_For_Point(wxWindow *Self, int x, int y)
		{
		return Self->IsExposed(x, y) == true ? 1 : 0;
		}
	
	int wxWindow_IsExposed_For_Rect(wxWindow *Self, int x, int y, int w, int h)
		{
		return Self->IsExposed(x, y, w, h) == true ? 1 : 0;
		}
	
	//void MoveAfterInTabOrder(wxWindow *win)
	//void MoveBeforeInTabOrder(wxWindow *win)
	//bool Navigate(int flags = wxNavigationKeyEvent::IsForward)
	//virtual void OnInternalIdle()
	//wxEvtHandler* PopEventHandler(bool deleteHandler = false) const
	/*
	bool PopupMenu(wxMenu* menu, const wxPoint& pos = wxDefaultPosition)
	bool PopupMenu(wxMenu* menu, int x, int y)
	*/
	//void PushEventHandler(wxEvtHandler* handler)
	//void Raise()
	//virtual void Refresh(bool eraseBackground = true, const wxRect* rect = NULL)
	//void RefreshRect(const wxRect& rect, bool eraseBackground = true)
	//bool RegisterHotKey(int hotkeyId, int modifiers, int virtualKeyCode)
	//virtual void ReleaseMouse()
	//virtual void RemoveChild(wxWindow* child)
	//bool RemoveEventHandler(wxEvtHandler *handler)
	//virtual bool Reparent(wxWindow* newParent)
	/*
	virtual void ScreenToClient(int* x, int* y) const
	virtual wxPoint ScreenToClient(const wxPoint& pt) const
	*/
	//virtual bool ScrollLines(int lines)
	//virtual bool ScrollPages(int pages)
	//virtual void ScrollWindow(int dx, int dy, const wxRect* rect = NULL)
	//virtual void SetAcceleratorTable(const wxAcceleratorTable& accel)
	//void SetAccessible(wxAccessible* accessible)
	//void SetAutoLayout(bool autoLayout)
	//virtual bool SetBackgroundColour(const wxColour& colour)
	//virtual void SetBackgroundStyle(wxBackgroundStyle style)
	//void SetBestFittingSize(const wxSize& size = wxDefaultSize)
	//void SetCaret(wxCaret *caret) const
	/*
	virtual void SetClientSize(int width, int height)
	virtual void SetClientSize(const wxSize& size)
	*/
	//void SetContainingSizer(wxSizer* sizer)
	//virtual void SetCursor(const wxCursor&cursor)
	//void SetConstraints(wxLayoutConstraints* constraints)
	//virtual void SetInitialBestSize(const wxSize& size)
	//void SetMaxSize(const wxSize& size)
	//void SetMinSize(const wxSize& size)
	//void SetOwnBackgroundColour(const wxColour& colour)
	//void SetOwnFont(const wxFont& font)
	//void SetOwnForegroundColour(const wxColour& colour)
	//void SetDropTarget(wxDropTarget* target)
	//void SetEventHandler(wxEvtHandler* handler)
	//void SetExtraStyle(long exStyle)
	//virtual void SetFocus()
	//virtual void SetFocusFromKbd()
	//void SetFont(const wxFont& font)
	//virtual void SetForegroundColour(const wxColour& colour)
	//virtual void SetHelpText(const wxString& helpText)
	//void SetId(int id)
	//virtual void SetLabel(const wxString& label)
	//virtual void SetName(const wxString& name)
	//virtual void SetPalette(wxPalette* palette)
	//virtual void SetScrollbar(int orientation, int position, int thumbSize, int range, bool refresh = true)
	//virtual void SetScrollPos(int orientation, int pos, bool refresh = true)
	/*
	virtual void SetSize(int x, int y, int width, int height, int sizeFlags = wxSIZE_AUTO)
	virtual void SetSize(const wxRect& rect)
	virtual void SetSize(int width, int height)
	virtual void SetSize(const wxSize& size)
	*/
	/*
	virtual void SetSizeHints(int minW=-1, int minH=-1, int maxW=-1, int maxH=-1, int incW=-1, int incH=-1)
	void SetSizeHints(const wxSize& minSize, const wxSize& maxSize=wxDefaultSize, const wxSize& incSize=wxDefaultSize)
	*/
	
	void wxWindow_SetSizer(wxWindow *Self, wxSizer *Sizer, int DeleteOld)
		{
		Self->SetSizer(Sizer, DeleteOld == 1 ? true : 0);
		}

	//void SetSizerAndFit(wxSizer* sizer, bool deleteOld=true)
	//virtual void SetTitle(const wxString& title)
	//virtual void SetThemeEnabled(bool enable)
	/*
	void SetToolTip(const wxString& tip)
	void SetToolTip(wxToolTip* tip)
	*/
	
	void wxWindow_SetValidator(wxWindow *Self, wxValidator *Validator)
		{
		Self->SetValidator(*Validator);
		}
	
	/*
	void SetVirtualSize(int width, int height)
	void SetVirtualSize(const wxSize& size)
	*/
	/*
	virtual void SetVirtualSizeHints(int minW,int minH, int maxW=-1, int maxH=-1)
	void SetVirtualSizeHints(const wxSize& minSize=wxDefaultSize, const wxSize& maxSize=wxDefaultSize)
	*/
	//void SetWindowStyle(long style)
	//virtual void SetWindowStyleFlag(long style)
	//void SetWindowVariant(wxWindowVariantvariant)
	//virtual bool ShouldInheritColours()
	
	//virtual bool Show(bool show = true)
	int wxWindow_Show(wxWindow *Self, int show)
		{
		return Self->Show(show == 1 ? true : false) == true ? 1 : 0;
		}
		
	//virtual void Thaw()
	//virtual bool TransferDataFromWindow()
	//virtual bool TransferDataToWindow()
	//bool UnregisterHotKey(int hotkeyId)
	//virtual void Update()
	//virtual void UpdateWindowUI(long flags = wxUPDATE_UI_NONE)
	//virtual bool Validate()
	//void WarpPointer(int x, int y)

	/*
	// These are wxAdaWindow support functions.
	void wxWindow_SetAdaObject(wxAdaWindow *Self, void *AdaWindow)
		{
		Self->_AdaObject = AdaWindow;
		}
		
	void *wxWindow_GetAdaObject(wxAdaWindow *Self)
		{
		return Self->_AdaObject;
		}
		*/
	};

