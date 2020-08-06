// wxcore_bitmap.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxBitmap class.

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

#include "wx_debug.hh"


extern "C"
	{
	wxBitmap *wxBitmap_ctor_From_Bitmap(wxBitmap *Bitmap)
		{
		WXADA_MSG(wxString::Format("[wxBitmap_ctor_From_Bitmap]\n"));
		
		return new wxBitmap(*Bitmap);
		}
	
	wxBitmap *wxBitmap_ctor_From_XBM(const char *Bits, int Width, int Height)
		{
		WXADA_MSG(wxString::Format("[wxBitmap_ctor_From_XBM]\n"));
		
		return new wxBitmap(Bits, Width, Height, 1);
		}
	
	wxBitmap *wxBitmap_ctor_From_XPM(const char *Bits)
		{
		WXADA_MSG(wxString::Format("[wxBitmap_ctor_From_XPM]\n"));
		
		return new wxBitmap(Bits);
		}
	
	wxBitmap *wxBitmap_ctor_From_Filename(const wxChar *Filename, int Type)
		{
		WXADA_MSG(wxString::Format("[wxBitmap_ctor_From_Filename]\n"));
		
		return new wxBitmap(wxString(Filename), Type);
		}
	
	wxBitmap *wxBitmap_ctor_From_Image(wxImage *Image, int Depth)
		{
		WXADA_MSG(wxString::Format("[wxBitmap_ctor_From_Image]\n"));
		
		return new wxBitmap(*Image, Depth);
		}
	
	void wxBitmap_dtor(wxBitmap *Self)
		{
		WXADA_MSG("[wxBitmap_dtor]\n");
		
		delete Self;
		
		WXADA_MSG("[wxBitmap_dtor 2]\n");
		}
		
	void wxBitmap_AddHandler(wxBitmapHandler *Handler)
		{
		wxBitmap::AddHandler(Handler);
		}
	
	/* TODO: How?
	wxImage *wxBitmap_ConvertToImage(wxBitmap *Self)
		{
		This returns an wxImage NOT a wxImage *
		return Self->ConvertToImage();
		}
	*/
	
	// Should this be used in a constructor? i.e. New_Bitmap(Self : in out Bitmap_Type; Icon : in Icon_Type);
	int wxBitmap_CopyFromIcon(wxBitmap *Self, wxIcon *Icon)
		{
		return Self->CopyFromIcon(*Icon) == true ? 1 : 0;
		}
	
	wxBitmapHandler *wxBitmap_FindHandler(wxChar *Name)
		{
		return wxBitmap::FindHandler(Name);
		}
	
	wxBitmapHandler *wxBitmap_FindHandler_From_Extension(wxChar *Extension, int BitmapType)
		{
		return wxBitmap::FindHandler(Extension, wx_static_cast(wxBitmapType, BitmapType));
		}
	
	wxBitmapHandler *wxBitmap_FindHandler_From_Type(int BitmapType)
		{
		return wxBitmap::FindHandler(wx_static_cast(wxBitmapType, BitmapType));
		}
	
	int wxBitmap_GetDepth(wxBitmap *Self)
		{
		return Self->GetDepth();
		}
	
	//GetHandlers
	
	int wxBitmap_GetHeight(wxBitmap *Self)
		{
		return Self->GetHeight();
		}
	
	wxPalette *wxBitmap_GetPalette(wxBitmap *Self)
		{
		return Self->GetPalette();
		}
	
	wxMask *wxBitmap_GetMask(wxBitmap *Self)
		{
		return Self->GetMask();
		}
	
	int wxBitmap_GetWidth(wxBitmap *Self)
		{
		return Self->GetWidth();
		}
	
	/* TODO: How?
	wxBitmap *wxBitmap_GetSubBitmap(wxBitmap *Self, int x1, int y1, int x2, int y2)
		{
		This returns an wxBitmap NOT a wxBitmap *
		return Self->GetSubBitmap(wxRect(x1, y1, x2, y2));
		}
		*/
	
	void wxBitmap_InitStandardHandlers()
		{
		wxBitmap::InitStandardHandlers();
		}
	
	void wxBitmap_InsertHandler(wxBitmapHandler *Handler)
		{
		wxBitmap::InsertHandler(Handler);
		}
	
	//LoadFile
	
	int wxBitmap_Ok(wxBitmap *Self)
		{
		return Self->Ok() == true ? 1 : 0;
		}
	
	int wxBitmap_RemoveHandler(wxChar *Name)
		{
		return wxBitmap::RemoveHandler(Name) == true ? 1 : 0;
		}
	
	//SaveFile
	
	void wxBitmap_SetDepth(wxBitmap *Self, int Depth)
		{
		Self->SetDepth(Depth);
		}
		
	void wxBitmap_SetHeight(wxBitmap *Self, int Height)
		{
		Self->SetHeight(Height);
		}
		
	void wxBitmap_SetMask(wxBitmap *Self, wxMask *Mask)
		{
		Self->SetMask(Mask);
		}
		
	void wxBitmap_SetPalette(wxBitmap *Self, wxPalette *Palette)
		{
		Self->SetPalette(*Palette);
		}
		
	void wxBitmap_SetWidth(wxBitmap *Self, int Width)
		{
		Self->SetWidth(Width);
		}
	};
