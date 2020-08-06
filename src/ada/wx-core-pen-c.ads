-- wx-core-pen-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Pen.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxPen_ctor");

  function ctor_From_Colour(Colour : in System.Address; Width, Style : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor_From_Colour, "wxPen_ctor_From_Colour");

  function ctor_From_Colour_Name(Colour : in Interfaces.C.Strings.chars_ptr; Width, Style : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor_From_Colour_Name, "wxPen_ctor_From_Colour_Name");

  function GetStyle(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetStyle, "wxPen_GetStyle");

  function GetWidth(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetWidth, "wxPen_GetWidth");

  function Ok(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Ok, "wxPen_Ok");

  procedure SetStyle(Self : in System.Address; Style : in Interfaces.C.int);
  pragma Import(C, SetStyle, "wxPen_SetStyle");

  procedure SetWidth(Self : in System.Address; Width : in Interfaces.C.int);
  pragma Import(C, SetWidth, "wxPen_SetWidth");

end wx.Core.Pen.C;
