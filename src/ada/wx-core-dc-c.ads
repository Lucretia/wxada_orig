-- wx-core-dc-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.DC.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxDC_ctor");

  procedure BeginDrawing(Self : in System.Address);
  pragma Import(C, BeginDrawing, "wxDC_BeginDrawing");

  procedure Clear(Self : in System.Address);
  pragma Import(C, Clear, "wxDC_Clear");

  procedure DrawBitmap(Self, Bitmap : in System.Address; x, y, Transparent : in Interfaces.C.int);
  pragma Import(C, DrawBitmap, "wxDC_DrawBitmap");

  procedure DrawLine(Self : in System.Address; x1, y1, x2, y2 : in Interfaces.C.int);
  pragma Import(C, DrawLine, "wxDC_DrawLine");

  procedure EndDrawing(Self : in System.Address);
  pragma Import(C, EndDrawing, "wxDC_EndDrawing");

  function FloodFill(Self : in System.Address; x, y : in Interfaces.C.int; Colour : in System.Address; Style : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, FloodFill, "wxDC_FloodFill");

  function GetBackground(Self : in System.Address) return System.Address;
  pragma Import(C, GetBackground, "wxDC_GetBackground");

  function GetBrush(Self : in System.Address) return System.Address;
  pragma Import(C, GetBrush, "wxDC_GetBrush");

  function GetPen(Self : in System.Address) return System.Address;
  pragma Import(C, GetPen, "wxDC_GetPen");

  function Ok(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Ok, "wxDC_Ok");

  procedure SetBackground(Self, Brush : in System.Address);
  pragma Import(C, SetBackground, "wxDC_SetBackground");

  procedure SetBrush(Self, Brush : in System.Address);
  pragma Import(C, SetBrush, "wxDC_SetBrush");

  procedure SetPen(Self, Pen : in System.Address);
  pragma Import(C, SetPen, "wxDC_SetPen");

  procedure SetTextBackground(Self, Colour : in System.Address);
  pragma Import(C, SetTextBackground, "wxDC_SetTextBackground");

  procedure SetTextForeground(Self, Colour : in System.Address);
  pragma Import(C, SetTextForeground, "wxDC_SetTextForeground");

end wx.Core.DC.C;
