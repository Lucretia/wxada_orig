-- wx-core-brush-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;

private package wx.Core.Brush.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxBrush_ctor");
  
  function ctor_From_Colour(Colour : in System.Address; Style : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor_From_Colour, "wxBrush_ctor_From_Colour");
  
  function ctor_From_Colour_Name(Colour : in Interfaces.C.Strings.chars_ptr; Style : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor_From_Colour_Name, "wxBrush_ctor_From_Colour_Name");
  
  function GetColour(Self : in System.Address) return System.Address;
  pragma Import(C, GetColour, "wxBrush_GetColour");
  
  function GetStyle(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetStyle, "wxBrush_GetStyle");
	
  function IsHatch(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsHatch, "wxBrush_IsHatch");
	
  function Ok(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Ok, "wxBrush_Ok");
	
  procedure SetColour(Self, Colour : in System.Address);
  pragma Import(C, SetColour, "wxBrush_SetColour");
	
  procedure SetColour_From_Name(Self : in System.Address; Colour : in Interfaces.C.Strings.chars_ptr);
  pragma Import(C, SetColour_From_Name, "wxBrush_SetColour_From_Name");
	
  procedure SetStyle(Self : in System.Address; Style : in Interfaces.C.int);
  pragma Import(C, SetStyle, "wxBrush_SetStyle");
	
end wx.Core.Brush.C;
