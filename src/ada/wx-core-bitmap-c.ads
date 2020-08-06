-- wx-core-bitmap-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;

private package wx.Core.Bitmap.C is

  function ctor_From_Bitmap(Bitmap : in System.Address) return System.Address;
  pragma Import(C, ctor_From_Bitmap, "wxBitmap_ctor_From_Bitmap");
  
  function ctor_From_Filename(Filename : in Interfaces.C.Strings.chars_ptr; BitmapType : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor_From_Filename, "wxBitmap_ctor_From_Filename");
  
  function GetDepth(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetDepth, "wxBitmap_GetDepth");
  
  function GetHeight(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetHeight, "wxBitmap_GetHeight");
  
  function GetWidth(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetWidth, "wxBitmap_GetWidth");
  
  procedure InitStandardHandlers;
  pragma Import(C, InitStandardHandlers, "wxBitmap_InitStandardHandlers");
  
--  function GetSubBitmap(Self : in wxObject_Access; x1, y1, x2, y2 : in Interfaces.C.int) return wxObject_Access;
--  pragma Import(C, GetSubBitmap, "wxBitmap_GetSubBitmap");
    
  function Ok(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Ok, "wxBitmap_Ok");
	
  procedure SetDepth(Self : in System.Address; Depth : in Interfaces.C.int);
  pragma Import(C, SetDepth, "wxBitmap_SetDepth");
	
  procedure SetHeight(Self : in System.Address; Height : in Interfaces.C.int);
  pragma Import(C, SetHeight, "wxBitmap_SetHeight");
	
  procedure SetWidth(Self : in System.Address; Width : in Interfaces.C.int);
  pragma Import(C, SetWidth, "wxBitmap_SetWidth");
	
end wx.Core.Bitmap.C;
