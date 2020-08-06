// wxcore_image.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxImage class.

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

#include <wx/image.h>


extern "C"
	{
	wxImage *wxImage_ctor_From_Image(wxImage *Image)
		{
		printf("wxImage_ctor_From_Image\n");
		return new wxImage(*Image);
		}

	/* Deprecated!	
	wxImage *wxImage_ctor_From_Bitmap(wxBitmap *Bitmap)
		{
		printf("wxImage_ctor_From_Bitmap\n");
		return new wxImage(*Bitmap);
		}
		*/
	
	wxImage *wxImage_ctor_From_Filename(const wxChar *Filename, int Type)
		{
		printf("wxImage_ctor_From_Filename\n");
		return new wxImage(wxString(Filename), Type);
		}
	
	wxImage *wxImage_ctor_From_Filename_MimeType(const wxChar *Filename, const wxChar *MimeType, int Index)
		{
		printf("wxImage_ctor_From_Filename_MimeType\n");
		return new wxImage(wxString(Filename), MimeType, Index);
		}
	
	void wxImage_dtor(wxImage *Self)
		{
		printf("wxImage_dtor\n");
		delete Self;
		printf("wxImage_dtor 2\n");
		}
		
	void wxImage_wxInitAllImageHandlers()
		{
		::wxInitAllImageHandlers();
		}
	};
