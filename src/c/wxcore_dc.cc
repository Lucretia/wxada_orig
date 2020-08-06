// wxcore_dc.cc
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence
//
// Implements a wrapper around the wxDC class.

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


extern "C"
	{
	wxDC *wxDC_ctor()
		{
		//return new wxDC;
		return NULL;// Pure virtuals!
		}
	
	void wxDC_dtor(wxDC *Self)
		{
		delete Self;
		}
	
	void wxDC_BeginDrawing(wxDC *Self)
		{
		Self->BeginDrawing();
		}
	
	//bool Blit(wxCoord xdest, wxCoord ydest, wxCoord width, wxCoord height, wxDC* source, wxCoord xsrc, wxCoord ysrc, int logicalFunc = wxCOPY, bool useMask = false, wxCoord xsrcMask = -1, wxCoord ysrcMask = -1)
	//void CalcBoundingBox(wxCoord x, wxCoord y)
	
	void wxDC_Clear(wxDC *Self)
		{
		Self->Clear();
		}
	
	//virtual void ComputeScaleAndOrigin()
	//void CrossHair(wxCoord x, wxCoord y)
	//void DestroyClippingRegion()
	//wxCoord DeviceToLogicalX(wxCoord x);
	//wxCoord DeviceToLogicalXRel(wxCoord x)
	//wxCoord DeviceToLogicalY(wxCoord y)
	//wxCoord DeviceToLogicalYRel(wxCoord y)
	//void DrawArc(wxCoord x1, wxCoord y1, wxCoord x2, wxCoord y2, wxCoord xc, wxCoord yc)
	
	void wxDC_DrawBitmap(wxDC *Self, wxBitmap *Bitmap, int x, int y, int transparent)
		{
		Self->DrawBitmap(*Bitmap, x, y, transparent == 1 ? true : false);
		}
		
	//void DrawCheckMark(wxCoord x, wxCoord y, wxCoord width, wxCoord height)
	//void DrawCheckMark(const wxRect &rect)
	//void DrawCircle(wxCoord x, wxCoord y, wxCoord radius)
	//void DrawCircle(const wxPoint& pt, wxCoord radius)
	//void DrawEllipse(wxCoord x, wxCoord y, wxCoord width, wxCoord height)
	//void DrawEllipse(const wxPoint& pt, const wxSize& size)
	//void DrawEllipse(const wxRect& rect)
	//void DrawEllipticArc(wxCoord x, wxCoord y, wxCoord width, wxCoord height, double start, double end)
	//void DrawIcon(const wxIcon& icon, wxCoord x, wxCoord y)
	//virtual void DrawLabel(const wxString& text, const wxBitmap& image, const wxRect& rect, int alignment = wxALIGN_LEFT | wxALIGN_TOP, int indexAccel = -1, wxRect *rectBounding = NULL)
	//void DrawLabel(const wxString& text, const wxRect& rect, int alignment = wxALIGN_LEFT | wxALIGN_TOP, int indexAccel = -1)
	
	void wxDC_DrawLine(wxDC *Self, int x1, int y1, int x2, int y2)
		{
		Self->DrawLine(x1, y1, x2, y2);
		}
	
	//void DrawLines(int n, wxPoint points[], wxCoord xoffset = 0, wxCoord yoffset = 0)
	//void DrawLines(wxList *points, wxCoord xoffset = 0, wxCoord yoffset = 0)
	//void DrawPolygon(int n, wxPoint points[], wxCoord xoffset = 0, wxCoord yoffset = 0, int fill_style = wxODDEVEN_RULE)
	//void DrawPolygon(wxList *points, wxCoord xoffset = 0, wxCoord yoffset = 0, int fill_style = wxODDEVEN_RULE)
	//void DrawPolyPolygon(int n, int count[], wxPoint points[], wxCoord xoffset = 0, wxCoord yoffset = 0, int fill_style = wxODDEVEN_RULE)
	//void DrawPoint(wxCoord x, wxCoord y)
	//void DrawRectangle(wxCoord x, wxCoord y, wxCoord width, wxCoord height)
	//void DrawRotatedText(const wxString& text, wxCoord x, wxCoord y, double angle)
	//void DrawRoundedRectangle(wxCoord x, wxCoord y, wxCoord width, wxCoord height, double radius = 20)
	//void DrawSpline(int n, wxPoint points[])
	//void DrawSpline(wxList *points)
	//void DrawSpline(wxCoord x1, wxCoord y1, wxCoord x2, wxCoord y2, wxCoord x3, wxCoord y3)
	//void DrawText(const wxString& text, wxCoord x, wxCoord y)
	//void EndDoc()
	
	void wxDC_EndDrawing(wxDC *Self)
		{
		Self->EndDrawing();
		}
	
	//void EndPage()
	
	int wxDC_FloodFill(wxDC *Self, int x, int y, wxColour *Colour, int Style)
		{
		return Self->FloodFill(x, y, *Colour, Style) == true ? 1 : 0;
		}
	
	const wxBrush *wxDC_GetBackground(wxDC *Self)
		{
		return &Self->GetBackground();
		}
		
	//int GetBackgroundMode() const
	
	const wxBrush *wxDC_GetBrush(wxDC *Self)
		{
		return &Self->GetBrush();
		}
		
	//wxCoord GetCharHeight()
	//wxCoord GetCharWidth()
	//void GetClippingBox(wxCoord *x, wxCoord *y, wxCoord *width, wxCoord *height)
	//const wxFont& GetFont() const
	//int GetLogicalFunction()
	//int GetMapMode()
	//bool GetPartialTextExtents(const wxString& text, wxArrayInt& widths) const
	
	const wxPen *wxDC_GetPen(wxDC *Self)
		{
		return &Self->GetPen();
		}
	
	//bool GetPixel(wxCoord x, wxCoord y, wxColour *colour)
	//wxSize GetPPI() const
	//void GetSize(wxCoord *width, wxCoord *height) const
	//wxSize GetSize() const
	//void GetSizeMM(wxCoord *width, wxCoord *height) const
	//wxSize GetSizeMM() const
	//const wxColour& GetTextBackground() const
	//void GetTextExtent(const wxString& string, wxCoord *w, wxCoord *h, wxCoord *descent = NULL, wxCoord *externalLeading = NULL, wxFont *font = NULL)
	//const wxColour& GetTextForeground() const
	//void GetUserScale(double *x, double *y)
	//wxCoord LogicalToDeviceX(wxCoord x)
	//wxCoord LogicalToDeviceXRel(wxCoord x)
	//wxCoord LogicalToDeviceY(wxCoord y)
	//wxCoord LogicalToDeviceYRel(wxCoord y)
	//wxCoord MaxX()
	//wxCoord MaxY()
	//wxCoord MinX()
	//wxCoord MinY()
	
	int wxDC_Ok(wxDC *Self)
		{
		return Self->Ok() == true ? 1 : 0;
		}
	
	//void ResetBoundingBox()
	//void SetAxisOrientation(bool xLeftRight, bool yBottomUp)
	
	void wxDC_SetBackground(wxDC *Self, wxBrush *Brush)
		{
		Self->SetBackground(*Brush);
		}
		
	//void SetBackgroundMode(int mode)
	
	void wxDC_SetBrush(wxDC *Self, wxBrush *Brush)
		{
		Self->SetBrush(*Brush);
		}
		
	//void SetClippingRegion(wxCoord x, wxCoord y, wxCoord width, wxCoord height)
	//void SetClippingRegion(const wxPoint& pt, const wxSize& sz)
	//void SetClippingRegion(const wxRect& rect)
	//void SetClippingRegion(const wxRegion& region)
	//void SetDeviceOrigin(wxCoord x, wxCoord y)
	//void SetFont(const wxFont& font)
	//void SetLogicalFunction(int function)
	//void SetMapMode(int int)
	//void SetPalette(const wxPalette& palette)
	
	void wxDC_SetPen(wxDC *Self, wxPen *Pen)
		{
		printf("Pen : %p\n", Pen);
		Self->SetPen(*Pen);
		}
	
	void wxDC_SetTextBackground(wxDC *Self, wxColour *Colour)
		{
		Self->SetTextBackground(*Colour);
		}
		
	void wxDC_SetTextForeground(wxDC *Self, wxColour *Colour)
		{
		Self->SetTextForeground(*Colour);
		}
		
	//void SetUserScale(double xScale, double yScale)
	//bool StartDoc(const wxString& message)
	//bool StartPage()
	};
