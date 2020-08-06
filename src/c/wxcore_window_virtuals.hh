// wxcore_window_virtuals.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence

#ifndef _WXCORE_WINDOW_VIRTUALS_H_
#define _WXCORE_WINDOW_VIRTUALS_H_


#include "wxbase_evthandler_virtuals.hh"


#define WXADA_DECLARE_WINDOW_CAPTUREMOUSE(baseclass)	\
	virtual void CaptureMouse(); \
	\
	inline void Base_CaptureMouse() \
		{ \
		baseclass::CaptureMouse(); \
		}

#define WXADA_DECLARE_WINDOW_DOCLIENTTOSCREEN(baseclass)	\
	virtual void DoClientToScreen(int *x, int *y) const; \
	\
	inline void Base_DoClientToScreen(int *x, int *y) const \
		{ \
		baseclass::DoClientToScreen(x, y); \
		}

#define WXADA_DECLARE_WINDOW_DESTROY(baseclass)	\
	virtual bool Destroy(); \
	\
	inline bool Base_Destroy() \
		{ \
		return baseclass::Destroy(); \
		}

#define WXADA_DECLARE_WINDOW_DOGETBESTSIZE(baseclass)	\
	virtual wxSize DoGetBestSize() const; \
	\
	inline wxSize Base_DoGetBestSize() const \
		{ \
		return baseclass::DoGetBestSize(); \
		}

#define WXADA_DECLARE_WINDOW_DOGETCLIENTSIZE(baseclass)	\
	virtual void DoGetClientSize(int *Width, int *Height) const; \
	\
	inline void Base_DoGetClientSize(int *Width, int *Height) const \
		{ \
		baseclass::DoGetClientSize(Width, Height); \
		}

#define WXADA_DECLARE_WINDOW_DOGETPOSITION(baseclass)	\
	virtual void DoGetPosition(int *x, int *y) const; \
	\
	inline void Base_DoGetPosition(int *x, int *y) const \
		{ \
		baseclass::DoGetPosition(x, y); \
		}

#define WXADA_DECLARE_WINDOW_DOGETSIZE(baseclass)	\
	virtual void DoGetSize(int *Width, int *Height) const; \
	\
	inline void Base_DoGetSize(int *Width, int *Height) const \
		{ \
		baseclass::DoGetSize(Width, Height); \
		}

#define WXADA_DECLARE_WINDOW_DOGETVIRTUALSIZE(baseclass)	\
	virtual wxSize DoGetVirtualSize() const; \
	\
	inline wxSize Base_DoGetVirtualSize() const \
		{ \
		return baseclass::DoGetVirtualSize(); \
		}

#define WXADA_DECLARE_WINDOW_DOMOVEINTABORDER(baseclass)
/* TODO: Put this back in when the MoveKind enumeration is publicly available!
	virtual void DoMoveInTabOrder(wxWindow *Window, wxWindowBase::MoveKind Move); \
	\
	inline void Base_DoMoveInTabOrder(wxWindow *Window, MoveKind Move) \
		{ \
		baseclass::DoMoveInTabOrder(Window, Move); \
		}
*/

#define WXADA_DECLARE_WINDOW_DOMOVEWINDOW(baseclass)	\
	virtual void DoMoveWindow(int x, int y, int Width, int Height); \
	\
	inline void Base_DoMoveWindow(int x, int y, int Width, int Height) \
		{ \
		baseclass::DoMoveWindow(x, y, Width, Height); \
		}

#define WXADA_DECLARE_WINDOW_DOSETCLIENTSIZE(baseclass)	\
	virtual void DoSetClientSize(int Width, int Height); \
	\
	inline void Base_DoSetClientSize(int Width, int Height) \
		{ \
		baseclass::DoSetClientSize(Width, Height); \
		}

#define WXADA_DECLARE_WINDOW_DOSETSIZE(baseclass)	\
	virtual void DoSetSize(int x, int y, int Width, int Height, int SizeFlags); \
	\
	inline void Base_DoSetSize(int x, int y, int Width, int Height, int SizeFlags) \
		{ \
		baseclass::DoSetSize(x, y, Width, Height, SizeFlags); \
		}

#define WXADA_DECLARE_WINDOW_DOUPDATEWINDOWUI(baseclass)	\
	virtual void DoUpdateWindowUI(wxUpdateUIEvent &Event); \
	\
	inline void Base_DoUpdateWindowUI(wxUpdateUIEvent &Event) \
		{ \
		baseclass::DoUpdateWindowUI(Event); \
		}
		
// TODO: DragAcceptFiles

#define WXADA_DECLARE_WINDOW_ENABLE(baseclass)	\
	virtual bool Enable(bool Enable = true); \
	\
	inline bool Base_Enable(bool Enable = true) \
		{ \
		return baseclass::Enable(Enable); \
		}
		
#define WXADA_DECLARE_WINDOW_FIT(baseclass)	\
	virtual void Fit(); \
	\
	inline void Base_Fit() \
		{ \
		baseclass::Fit(); \
		}
		
#define WXADA_DECLARE_WINDOW_FITINSIDE(baseclass)	\
	virtual void FitInside(); \
	\
	inline void Base_FitInside() \
		{ \
		baseclass::FitInside(); \
		}
		
#define WXADA_DECLARE_WINDOW_FREEZE(baseclass)	\
	virtual void Freeze(); \
	\
	inline void Base_Freeze() \
		{ \
		baseclass::Freeze(); \
		}

// TODO: GetAcceleratorTable
// TODO: GetAccessible
// TODO: GetBackgroundStyle

#define WXADA_DECLARE_WINDOW_GETCHARHEIGHT(baseclass)	\
	virtual int GetCharHeight() const; \
	\
	inline int Base_GetCharHeight() const \
		{ \
		return baseclass::GetCharHeight(); \
		}

#define WXADA_DECLARE_WINDOW_GETCHARWIDTH(baseclass)	\
	virtual int GetCharWidth() const; \
	\
	inline int Base_GetCharWidth() const \
		{ \
		return baseclass::GetCharWidth(); \
		}

#define WXADA_DECLARE_WINDOW_GETLABEL(baseclass)	\
	virtual wxString GetLabel() const; \
	\
	inline wxString Base_GetLabel() const \
		{ \
		return baseclass::GetLabel(); \
		}

#define WXADA_DECLARE_WINDOW_GETMAXSIZE(baseclass)	\
	virtual wxSize GetMaxSize() const; \
	\
	inline wxSize Base_GetMaxSize() const \
		{ \
		return baseclass::GetMaxSize(); \
		}

#define WXADA_DECLARE_WINDOW_GETMINSIZE(baseclass)	\
	virtual wxSize GetMinSize() const; \
	\
	inline wxSize Base_GetMinSize() const \
		{ \
		return baseclass::GetMinSize(); \
		}

#define WXADA_DECLARE_WINDOW_GETNAME(baseclass)	\
	virtual wxString GetName() const; \
	\
	inline wxString Base_GetName() const \
		{ \
		return baseclass::GetName(); \
		}

#define WXADA_DECLARE_WINDOW_GETSCROLLPOS(baseclass)	\
	virtual int GetScrollPos(int Orientation) const; \
	\
	inline int Base_GetScrollPos(int Orientation) const \
		{ \
		return baseclass::GetScrollPos(Orientation); \
		}

#define WXADA_DECLARE_WINDOW_GETSCROLLTHUMB(baseclass)	\
	virtual int GetScrollThumb(int Orientation) const; \
	\
	inline int Base_GetScrollThumb(int Orientation) const \
		{ \
		return baseclass::GetScrollThumb(Orientation); \
		}

#define WXADA_DECLARE_WINDOW_GETSCROLLRANGE(baseclass)	\
	virtual int GetScrollRange(int Orientation) const; \
	\
	inline int Base_GetScrollRange(int Orientation) const \
		{ \
		return baseclass::GetScrollRange(Orientation); \
		}
/*
#define WXADA_DECLARE_WINDOW_GETTITLE(baseclass)	\
	virtual wxString GetTitle() const; \
	\
	inline wxString Base_GetTitle() const \
		{ \
		return baseclass::GetTitle(); \
		}
*/
#define WXADA_DECLARE_WINDOW_GETWINDOWSTYLEFLAG(baseclass)	\
	virtual long GetWindowStyleFlag() const; \
	\
	inline long Base_GetWindowStyleFlag() const \
		{ \
		return baseclass::GetWindowStyleFlag(); \
		}

#define WXADA_DECLARE_WINDOW_HASCAPTURE(baseclass)	\
	virtual bool HasCapture() const; \
	\
	inline bool Base_HasCapture() const \
		{ \
		return baseclass::HasCapture(); \
		}
		
#define WXADA_DECLARE_WINDOW_HASTRANSPARENTWINDOW(baseclass)	\
	virtual bool HasTransparentBackground(); \
	\
	inline bool Base_HasTransparentBackground() \
		{ \
		return baseclass::HasTransparentBackground(); \
		}
		
#define WXADA_DECLARE_WINDOW_INHERITATTRIBUTES(baseclass)	\
	virtual void InheritAttributes(); \
	\
	inline void Base_InheritAttributes() \
		{ \
		baseclass::InheritAttributes(); \
		}
		
#define WXADA_DECLARE_WINDOW_INITDIALOG(baseclass)	\
	virtual void InitDialog(); \
	\
	inline void Base_InitDialog() \
		{ \
		baseclass::InitDialog(); \
		}
		
#define WXADA_DECLARE_WINDOW_ISENABLED(baseclass)	\
	virtual bool IsEnabled() const; \
	\
	inline bool Base_IsEnabled() const \
		{ \
		return baseclass::IsEnabled(); \
		}
		
#define WXADA_DECLARE_WINDOW_ISRETAINED(baseclass)	\
	virtual bool IsRetained() const; \
	\
	inline bool Base_IsRetained() const \
		{ \
		return baseclass::IsRetained(); \
		}
		
#define WXADA_DECLARE_WINDOW_ISSHOWN(baseclass)	\
	virtual bool IsShown() const; \
	\
	inline bool Base_IsShown() const \
		{ \
		return baseclass::IsShown(); \
		}
		
#define WXADA_DECLARE_WINDOW_ISTOPLEVEL(baseclass)	\
	virtual bool IsTopLevel() const; \
	\
	inline bool Base_IsTopLevel() const \
		{ \
		return baseclass::IsTopLevel(); \
		}
		
#define WXADA_DECLARE_WINDOW_LAYOUT(baseclass)	\
	virtual bool Layout(); \
	\
	inline bool Base_Layout() \
		{ \
		return baseclass::Layout(); \
		}
		
#define WXADA_DECLARE_WINDOW_LOWER(baseclass)	\
	virtual void Lower(); \
	\
	inline void Base_Lower() \
		{ \
		baseclass::Lower(); \
		}
		
#define WXADA_DECLARE_WINDOW_MAKEMODAL(baseclass)	\
	virtual void MakeModal(bool Flag); \
	\
	inline void Base_MakeModal(bool Flag) \
		{ \
		baseclass::MakeModal(Flag); \
		}
		
#define WXADA_DECLARE_WINDOW_VIRTUALS(baseclass)	\
	WXADA_DECLARE_EVTHANDLER_VIRTUALS(baseclass) \
	WXADA_DECLARE_WINDOW_CAPTUREMOUSE(baseclass) \
	WXADA_DECLARE_WINDOW_DOCLIENTTOSCREEN(baseclass) \
	WXADA_DECLARE_WINDOW_DESTROY(baseclass) \
	WXADA_DECLARE_WINDOW_DOGETBESTSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_DOGETCLIENTSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_DOGETPOSITION(baseclass) \
	WXADA_DECLARE_WINDOW_DOGETSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_DOGETVIRTUALSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_DOSETCLIENTSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_DOMOVEINTABORDER(baseclass) \
	WXADA_DECLARE_WINDOW_DOMOVEWINDOW(baseclass) \
	WXADA_DECLARE_WINDOW_DOSETSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_DOUPDATEWINDOWUI(baseclass) \
	WXADA_DECLARE_WINDOW_ENABLE(baseclass) \
	WXADA_DECLARE_WINDOW_FIT(baseclass) \
	WXADA_DECLARE_WINDOW_FITINSIDE(baseclass) \
	WXADA_DECLARE_WINDOW_FREEZE(baseclass) \
	WXADA_DECLARE_WINDOW_GETCHARHEIGHT(baseclass) \
	WXADA_DECLARE_WINDOW_GETCHARWIDTH(baseclass) \
	WXADA_DECLARE_WINDOW_GETLABEL(baseclass) \
	WXADA_DECLARE_WINDOW_GETMAXSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_GETMINSIZE(baseclass) \
	WXADA_DECLARE_WINDOW_GETNAME(baseclass) \
	WXADA_DECLARE_WINDOW_GETSCROLLPOS(baseclass) \
	WXADA_DECLARE_WINDOW_GETSCROLLTHUMB(baseclass) \
	WXADA_DECLARE_WINDOW_GETSCROLLRANGE(baseclass) \
	WXADA_DECLARE_WINDOW_GETWINDOWSTYLEFLAG(baseclass) \
	WXADA_DECLARE_WINDOW_HASCAPTURE(baseclass) \
	WXADA_DECLARE_WINDOW_HASTRANSPARENTWINDOW(baseclass) \
	WXADA_DECLARE_WINDOW_INHERITATTRIBUTES(baseclass) \
	WXADA_DECLARE_WINDOW_INITDIALOG(baseclass) \
	WXADA_DECLARE_WINDOW_ISENABLED(baseclass) \
	WXADA_DECLARE_WINDOW_ISRETAINED(baseclass) \
	WXADA_DECLARE_WINDOW_ISSHOWN(baseclass) \
	WXADA_DECLARE_WINDOW_ISTOPLEVEL(baseclass) \
	WXADA_DECLARE_WINDOW_LAYOUT(baseclass) \
	WXADA_DECLARE_WINDOW_LOWER(baseclass) \
	WXADA_DECLARE_WINDOW_MAKEMODAL(baseclass)

//	WXADA_DECLARE_WINDOW_GETTITLE(baseclass) \

#define WXADA_IMPLEMENT_WINDOW_CAPTUREMOUSE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::CaptureMouse() \
		{ \
		printf("[" #classname "::CaptureMouse]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_CaptureMouse(classname *Self) \
			{ \
			printf("[" #baseclass "_CaptureMouse]\n"); \
			\
			Self->Base_CaptureMouse(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOCLIENTTOSCREEN(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *x, int *y); \
		} \
	\
	void classname::DoClientToScreen(int *x, int *y) const \
		{ \
		printf("[" #classname "::DoClientToScreen]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, x, y); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoClientToScreen(classname *Self, int *x, int *y) \
			{ \
			printf("[" #baseclass "_DoClientToScreen]\n"); \
			\
			Self->Base_DoClientToScreen(x, y); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DESTROY(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::Destroy() \
		{ \
		printf("[" #classname "::Destroy]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		bool baseclass##_Destroy(classname *Self) \
			{ \
			printf("[" #baseclass "_Destroy]\n"); \
			\
			return Self->Base_Destroy(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOGETBESTSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *Width, int *Height); \
		} \
	\
	wxSize classname::DoGetBestSize() const \
		{ \
		printf("[" #classname "::DoGetBestSize]\n"); \
		\
		int Width; \
		int Height; \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, &Width, &Height); \
		\
		return wxSize(Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoGetBestSize(classname *Self, int *Width, int *Height) \
			{ \
			printf("[" #baseclass "_DoGetBestSize]\n"); \
			\
			wxSize Size = Self->Base_DoGetBestSize(); \
			\
			*Width  = Size.GetWidth(); \
			*Height = Size.GetHeight(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOGETCLIENTSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *Width, int *Height); \
		} \
	\
	void classname::DoGetClientSize(int *Width, int *Height) const \
		{ \
		printf("[" #classname "::DoGetClientSize]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoGetClientSize(classname *Self, int *Width, int *Height) \
			{ \
			printf("[" #baseclass "_DoGetClientSize]\n"); \
			\
			Self->Base_DoGetClientSize(Width, Height); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOGETPOSITION(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *x, int *y); \
		} \
	\
	void classname::DoGetPosition(int *x, int *y) const \
		{ \
		printf("[" #classname "::DoGetPosition]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, x, y); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoGetPosition(classname *Self, int *x, int *y) \
			{ \
			printf("[" #baseclass "_DoGetPosition]\n"); \
			\
			Self->Base_DoGetPosition(x, y); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOGETSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *Width, int *Height); \
		} \
	\
	void classname::DoGetSize(int *Width, int *Height) const \
		{ \
		printf("[" #classname "::DoGetSize]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoGetSize(classname *Self, int *Width, int *Height) \
			{ \
			printf("[" #baseclass "_DoGetSize]\n"); \
			\
			Self->Base_DoGetSize(Width, Height); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOGETVIRTUALSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *Width, int *Height); \
		} \
	\
	wxSize classname::DoGetVirtualSize() const \
		{ \
		printf("[" #classname "::DoGetVirtualSize]\n"); \
		\
		int Width; \
		int Height; \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, &Width, &Height); \
		\
		return wxSize(Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoGetVirtualSize(classname *Self, int *Width, int *Height) \
			{ \
			printf("[" #baseclass "_DoGetVirtualSize]\n"); \
			\
			wxSize Size = Self->Base_DoGetVirtualSize(); \
			\
			*Width  = Size.GetWidth(); \
			*Height = Size.GetHeight(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOMOVEINTABORDER(classname, baseclass, funcname)
/* TODO: Put this back in when the MoveKind enumeration is publicly available!
	extern "C" \
		{ \
		extern void funcname(void *Self, wxWindow *Window, int Move); \
		} \
	\
	void classname::DoMoveInTabOrder(wxWindow *Window, MoveKind Move) \
		{ \
		printf("[" #classname "::DoMoveInTabOrder]\n"); \
		\
		funcname(_AdaObject, Window, Move); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoMoveInTabOrder(classname *Self, wxWindow *Window, int Move) \
			{ \
			printf("[" #baseclass "_DoMoveInTabOrder]\n"); \
			\
			Self->Base_DoMoveInTabOrder(Window, (wxWindowBase::MoveKind)Move); \
			} \
		};
*/

#define WXADA_IMPLEMENT_WINDOW_DOMOVEWINDOW(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int x, int y, int Width, int Height); \
		} \
	\
	void classname::DoMoveWindow(int x, int y, int Width, int Height) \
		{ \
		printf("[" #classname "::DoMoveWindow]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, x, y, Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoMoveWindow(classname *Self, int x, int y, int Width, int Height) \
			{ \
			printf("[" #baseclass "_DoMoveWindow]\n"); \
			\
			Self->Base_DoMoveWindow(x, y, Width, Height); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOSETCLIENTSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int Width, int Height); \
		} \
	\
	void classname::DoSetClientSize(int Width, int Height) \
		{ \
		printf("[" #classname "::DoSetClientSize]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoSetClientSize(classname *Self, int Width, int Height) \
			{ \
			printf("[" #baseclass "_DoSetClientSize]\n"); \
			\
			Self->Base_DoSetClientSize(Width, Height); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOSETSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int x, int y, int Width, int Height, int SizeFlags); \
		} \
	\
	void classname::DoSetSize(int x, int y, int Width, int Height, int SizeFlags) \
		{ \
		printf("[" #classname "::DoSetSize]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, x, y, Width, Height, SizeFlags); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoSetSize(classname *Self, int x, int y, int Width, int Height, int SizeFlags) \
			{ \
			printf("[" #baseclass "_DoSetSize]\n"); \
			\
			Self->Base_DoSetSize(x, y, Width, Height, SizeFlags); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_DOUPDATEWINDOWUI(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, wxUpdateUIEvent *Event); \
		} \
	\
	void classname::DoUpdateWindowUI(wxUpdateUIEvent &Event) \
		{ \
		printf("[" #classname "::DoUpdateWindowUI]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, &Event); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_DoUpdateWindowUI(classname *Self, wxUpdateUIEvent *Event) \
			{ \
			printf("[" #baseclass "_DoUpdateWindowUI]\n"); \
			\
			Self->Base_DoUpdateWindowUI(*Event); \
			} \
		};

// TODO: DragAcceptFiles

#define WXADA_IMPLEMENT_WINDOW_ENABLE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self, int Enable); \
		} \
	\
	bool classname::Enable(bool Enable) \
		{ \
		printf("[" #classname "::Enable]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Enable == true ? 1 : 0) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_Enable(classname *Self, int Enable) \
			{ \
			printf("[" #baseclass "_Enable]\n"); \
			\
			return Self->Base_Enable(Enable) == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_FIT(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::Fit() \
		{ \
		printf("[" #classname "::Fit]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_Fit(classname *Self) \
			{ \
			printf("[" #baseclass "_Fit]\n"); \
			\
			Self->Base_Fit(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_FITINSIDE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::FitInside() \
		{ \
		printf("[" #classname "::FitInside]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_FitInside(classname *Self) \
			{ \
			printf("[" #baseclass "_FitInside]\n"); \
			\
			Self->Base_FitInside(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_FREEZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::Freeze() \
		{ \
		printf("[" #classname "::Freeze]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_Freeze(classname *Self) \
			{ \
			printf("[" #baseclass "_Freeze]\n"); \
			\
			Self->Base_Freeze(); \
			} \
		};

// TODO: GetAcceleratorTable
// TODO: GetAccessible
// TODO: GetBackgroundStyle

#define WXADA_IMPLEMENT_WINDOW_GETCHARHEIGHT(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	int classname::GetCharHeight() const \
		{ \
		printf("[" #classname "::GetCharHeight]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_GetCharHeight(classname *Self) \
			{ \
			printf("[" #baseclass "_GetCharHeight]\n"); \
			\
			return Self->Base_GetCharHeight(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETCHARWIDTH(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	int classname::GetCharWidth() const \
		{ \
		printf("[" #classname "::GetCharWidth]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_GetCharWidth(classname *Self) \
			{ \
			printf("[" #baseclass "_GetCharWidth]\n"); \
			\
			return Self->Base_GetCharWidth(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETLABEL(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern const wxChar *funcname(void *Self); \
		} \
	\
	wxString classname::GetLabel() const \
		{ \
		printf("[" #classname "::GetLabel]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		wxString baseclass##_GetLabel(classname *Self) \
			{ \
			printf("[" #baseclass "_GetLabel]\n"); \
			\
			return Self->Base_GetLabel(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETMAXSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *Width, int *Height); \
		} \
	\
	wxSize classname::GetMaxSize() const \
		{ \
		printf("[" #classname "::GetMaxSize]\n"); \
		\
		int Width; \
		int Height; \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, &Width, &Height); \
		\
		return wxSize(Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_GetMaxSize(classname *Self, int *Width, int *Height) \
			{ \
			printf("[" #baseclass "_GetMaxSize]\n"); \
			\
			wxSize Size = Self->Base_GetMaxSize(); \
			\
			*Width  = Size.GetWidth(); \
			*Height = Size.GetHeight(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETMINSIZE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, int *Width, int *Height); \
		} \
	\
	wxSize classname::GetMinSize() const \
		{ \
		printf("[" #classname "::GetMinSize]\n"); \
		\
		int Width; \
		int Height; \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, &Width, &Height); \
		\
		return wxSize(Width, Height); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_GetMinSize(classname *Self, int *Width, int *Height) \
			{ \
			printf("[" #baseclass "_GetMinSize]\n"); \
			\
			wxSize Size = Self->Base_GetMinSize(); \
			\
			*Width  = Size.GetWidth(); \
			*Height = Size.GetHeight(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETNAME(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern const wxChar *funcname(void *Self); \
		} \
	\
	wxString classname::GetName() const \
		{ \
		printf("[" #classname "::GetName]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		wxString baseclass##_GetName(classname *Self) \
			{ \
			printf("[" #baseclass "_GetName]\n"); \
			\
			return Self->Base_GetName(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETSCROLLPOS(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self, int Orientation); \
		} \
	\
	int classname::GetScrollPos(int Orientation) const \
		{ \
		printf("[" #classname "::GetScrollPos]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Orientation); \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_GetScrollPos(classname *Self, int Orientation) \
			{ \
			printf("[" #baseclass "_GetScrollPos]\n"); \
			\
			return Self->Base_GetScrollPos(Orientation); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETSCROLLTHUMB(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self, int Orientation); \
		} \
	\
	int classname::GetScrollThumb(int Orientation) const \
		{ \
		printf("[" #classname "::GetScrollThumb]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Orientation); \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_GetScrollThumb(classname *Self, int Orientation) \
			{ \
			printf("[" #baseclass "_GetScrollThumb]\n"); \
			\
			return Self->Base_GetScrollThumb(Orientation); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_GETSCROLLRANGE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self, int Orientation); \
		} \
	\
	int classname::GetScrollRange(int Orientation) const \
		{ \
		printf("[" #classname "::GetScrollRange]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Orientation); \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_GetScrollRange(classname *Self, int Orientation) \
			{ \
			printf("[" #baseclass "_GetScrollRange]\n"); \
			\
			return Self->Base_GetScrollRange(Orientation); \
			} \
		};

/*
#define WXADA_IMPLEMENT_WINDOW_GETTITLE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern const wxChar *funcname(void *Self); \
		} \
	\
	wxString classname::GetTitle() const \
		{ \
		printf("[" #classname "::GetTitle]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*//*); \
		} \
	\
	extern "C" \
		{ \
		wxString baseclass##_GetTitle(classname *Self) \
			{ \
			printf("[" #baseclass "_GetTitle]\n"); \
			\
			return Self->Base_GetTitle(); \
			} \
		};
*/

#define WXADA_IMPLEMENT_WINDOW_GETWINDOWSTYLEFLAG(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern long funcname(void *Self); \
		} \
	\
	long classname::GetWindowStyleFlag() const \
		{ \
		printf("[" #classname "::GetWindowStyleFlag]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		long baseclass##_GetWindowStyleFlag(classname *Self) \
			{ \
			printf("[" #baseclass "_GetWindowStyleFlag]\n"); \
			\
			return Self->Base_GetWindowStyleFlag(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_HASCAPTURE(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::HasCapture() const \
		{ \
		printf("[" #classname "::HasCapture]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_HasCapture(classname *Self) \
			{ \
			printf("[" #baseclass "_HasCapture]\n"); \
			\
			return Self->Base_HasCapture() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_HASTRANSPARENTWINDOW(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::HasTransparentBackground() \
		{ \
		printf("[" #classname "::HasTransparentBackground]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_HasTransparentBackground(classname *Self) \
			{ \
			printf("[" #baseclass "_HasTransparentBackground]\n"); \
			\
			return Self->Base_HasTransparentBackground() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_INHERITATTRIBUTES(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::InheritAttributes() \
		{ \
		printf("[" #classname "::InheritAttributes]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_InheritAttributes(classname *Self) \
			{ \
			printf("[" #baseclass "_InheritAttributes]\n"); \
			\
			Self->Base_InheritAttributes(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_INITDIALOG(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::InitDialog() \
		{ \
		printf("[" #classname "::InitDialog]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_InitDialog(classname *Self) \
			{ \
			printf("[" #baseclass "_InitDialog]\n"); \
			\
			Self->Base_InitDialog(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_ISENABLED(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::IsEnabled() const \
		{ \
		printf("[" #classname "::IsEnabled]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_IsEnabled(classname *Self) \
			{ \
			printf("[" #baseclass "_IsEnabled]\n"); \
			\
			return Self->Base_IsEnabled() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_ISRETAINED(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::IsRetained() const \
		{ \
		printf("[" #classname "::IsRetained]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_IsRetained(classname *Self) \
			{ \
			printf("[" #baseclass "_IsRetained]\n"); \
			\
			return Self->Base_IsRetained() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_ISSHOWN(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::IsShown() const \
		{ \
		printf("[" #classname "::IsShown]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_IsShown(classname *Self) \
			{ \
			printf("[" #baseclass "_IsShown]\n"); \
			\
			return Self->Base_IsShown() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_ISTOPLEVEL(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::IsTopLevel() const \
		{ \
		printf("[" #classname "::IsTopLevel]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_IsTopLevel(classname *Self) \
			{ \
			printf("[" #baseclass "_IsTopLevel]\n"); \
			\
			return Self->Base_IsTopLevel() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_LAYOUT(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::Layout() \
		{ \
		printf("[" #classname "::Layout]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		int baseclass##_Layout(classname *Self) \
			{ \
			printf("[" #baseclass "_Layout]\n"); \
			\
			return Self->Base_Layout() == true ? 0 : 1; \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_LOWER(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self); \
		} \
	\
	void classname::Lower() \
		{ \
		printf("[" #classname "::Lower]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_Lower(classname *Self) \
			{ \
			printf("[" #baseclass "_Lower]\n"); \
			\
			Self->Base_Lower(); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_MAKEMODAL(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern void funcname(void *Self, bool Flag); \
		} \
	\
	void classname::MakeModal(bool Flag) \
		{ \
		printf("[" #classname "::MakeModal]\n"); \
		\
		funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/, Flag); \
		} \
	\
	extern "C" \
		{ \
		void baseclass##_MakeModal(classname *Self, int Flag) \
			{ \
			printf("[" #baseclass "_MakeModal]\n"); \
			\
			Self->Base_MakeModal(Flag == 1 ? true : false); \
			} \
		};

#define WXADA_IMPLEMENT_WINDOW_VIRTUALS(classname, baseclass, adaprefix)	\
	WXADA_IMPLEMENT_EVTHANDLER_VIRTUALS(classname, baseclass, adaprefix) \
	WXADA_IMPLEMENT_WINDOW_CAPTUREMOUSE(classname, baseclass, Ada_##adaprefix##_Capture_Mouse) \
	WXADA_IMPLEMENT_WINDOW_DOCLIENTTOSCREEN(classname, baseclass, Ada_##adaprefix##_Do_Client_To_Screen) \
	WXADA_IMPLEMENT_WINDOW_DESTROY(classname, baseclass, Ada_##adaprefix##_Destroy) \
	WXADA_IMPLEMENT_WINDOW_DOGETBESTSIZE(classname, baseclass, Ada_##adaprefix##_Do_Get_Best_Size) \
	WXADA_IMPLEMENT_WINDOW_DOGETCLIENTSIZE(classname, baseclass, Ada_##adaprefix##_Do_Get_Client_Size) \
	WXADA_IMPLEMENT_WINDOW_DOGETPOSITION(classname, baseclass, Ada_##adaprefix##_Do_Get_Position) \
	WXADA_IMPLEMENT_WINDOW_DOGETSIZE(classname, baseclass, Ada_##adaprefix##_Do_Get_Size) \
	WXADA_IMPLEMENT_WINDOW_DOGETVIRTUALSIZE(classname, baseclass, Ada_##adaprefix##_Do_Get_Virtual_Size) \
	WXADA_IMPLEMENT_WINDOW_DOSETCLIENTSIZE(classname, baseclass, Ada_##adaprefix##_Do_Set_Client_Size) \
	WXADA_IMPLEMENT_WINDOW_DOMOVEINTABORDER(classname, baseclass, Ada_##adaprefix##_Do_Move_In_Tab_Order) \
	WXADA_IMPLEMENT_WINDOW_DOMOVEWINDOW(classname, baseclass, Ada_##adaprefix##_Do_Move_Window) \
	WXADA_IMPLEMENT_WINDOW_DOSETSIZE(classname, baseclass, Ada_##adaprefix##_Do_Set_Size) \
	WXADA_IMPLEMENT_WINDOW_DOUPDATEWINDOWUI(classname, baseclass, Ada_##adaprefix##_Do_Update_Window_UI) \
	WXADA_IMPLEMENT_WINDOW_ENABLE(classname, baseclass, Ada_##adaprefix##_Enable) \
	WXADA_IMPLEMENT_WINDOW_FIT(classname, baseclass, Ada_##adaprefix##_Fit) \
	WXADA_IMPLEMENT_WINDOW_FITINSIDE(classname, baseclass, Ada_##adaprefix##_Fit_Inside) \
	WXADA_IMPLEMENT_WINDOW_FREEZE(classname, baseclass, Ada_##adaprefix##_Freeze) \
	WXADA_IMPLEMENT_WINDOW_GETCHARHEIGHT(classname, baseclass, Ada_##adaprefix##_Get_Char_Height) \
	WXADA_IMPLEMENT_WINDOW_GETCHARWIDTH(classname, baseclass, Ada_##adaprefix##_Get_Char_Width) \
	WXADA_IMPLEMENT_WINDOW_GETLABEL(classname, baseclass, Ada_##adaprefix##_Get_Label) \
	WXADA_IMPLEMENT_WINDOW_GETMAXSIZE(classname, baseclass, Ada_##adaprefix##_Get_Max_Size) \
	WXADA_IMPLEMENT_WINDOW_GETMINSIZE(classname, baseclass, Ada_##adaprefix##_Get_Min_Size) \
	WXADA_IMPLEMENT_WINDOW_GETNAME(classname, baseclass, Ada_##adaprefix##_Get_Name) \
	WXADA_IMPLEMENT_WINDOW_GETSCROLLPOS(classname, baseclass, Ada_##adaprefix##_Get_Scroll_Position) \
	WXADA_IMPLEMENT_WINDOW_GETSCROLLTHUMB(classname, baseclass, Ada_##adaprefix##_Get_Scroll_Thumb) \
	WXADA_IMPLEMENT_WINDOW_GETSCROLLRANGE(classname, baseclass, Ada_##adaprefix##_Get_Scroll_Range) \
	WXADA_IMPLEMENT_WINDOW_GETWINDOWSTYLEFLAG(classname, baseclass, Ada_##adaprefix##_Get_Window_Style_Flag) \
	WXADA_IMPLEMENT_WINDOW_HASCAPTURE(classname, baseclass, Ada_##adaprefix##_Has_Capture) \
	WXADA_IMPLEMENT_WINDOW_HASTRANSPARENTWINDOW(classname, baseclass, Ada_##adaprefix##_Has_Transparent_Background) \
	WXADA_IMPLEMENT_WINDOW_INHERITATTRIBUTES(classname, baseclass, Ada_##adaprefix##_Inherit_Attributes) \
	WXADA_IMPLEMENT_WINDOW_INITDIALOG(classname, baseclass, Ada_##adaprefix##_Init_Dialog) \
	WXADA_IMPLEMENT_WINDOW_ISENABLED(classname, baseclass, Ada_##adaprefix##_Is_Enabled) \
	WXADA_IMPLEMENT_WINDOW_ISRETAINED(classname, baseclass, Ada_##adaprefix##_Is_Retained) \
	WXADA_IMPLEMENT_WINDOW_ISSHOWN(classname, baseclass, Ada_##adaprefix##_Is_Shown) \
	WXADA_IMPLEMENT_WINDOW_ISTOPLEVEL(classname, baseclass, Ada_##adaprefix##_Is_Top_Level) \
	WXADA_IMPLEMENT_WINDOW_LAYOUT(classname, baseclass, Ada_##adaprefix##_Layout) \
	WXADA_IMPLEMENT_WINDOW_LOWER(classname, baseclass, Ada_##adaprefix##_Lower) \
	WXADA_IMPLEMENT_WINDOW_MAKEMODAL(classname, baseclass, Ada_##adaprefix##_Make_Modal)

//	WXADA_IMPLEMENT_WINDOW_GETTITLE(classname, baseclass, Ada_##adaprefix##_Get_Title) \

#endif // !_WXCORE_WINDOW_VIRTUALS_H_
