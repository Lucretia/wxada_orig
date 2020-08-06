-- wx-core-pen.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Pen.C;

use type Interfaces.C.int;

package body wx.Core.Pen is
  
  function Pen_Style_Type_To_C_int is new Ada.Unchecked_Conversion(Source => Pen_Style_Type, Target => Interfaces.C.int);
  function C_int_To_Pen_Style_Type is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Pen_Style_Type);
  
  
  procedure New_Pen(Self : in out Pen_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Pen.C.ctor, True);
    
  end New_Pen;
  
  
  procedure New_Pen(
    Self   : in out Pen_Type;
    Colour : in wx.Core.Colour.Colour_Type;
    Width  : in Integer        := 1;
    Style  : in Pen_Style_Type := Solid) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Pen.C.ctor_From_Colour(
        wx.Core.Colour.Get_wxObject(Colour),
        Interfaces.C.int(Width),
        Pen_Style_Type_To_C_int(Style)),
      True);
    
  end New_Pen;
  
  
  procedure New_Pen(
    Self   : in out Pen_Type;
    Colour : in String;
    Width  : in Integer        := 1;
    Style  : in Pen_Style_Type := Solid) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Pen.C.ctor_From_Colour_Name(
        Interfaces.C.Strings.New_String(Colour),
        Interfaces.C.int(Width),
        Pen_Style_Type_To_C_int(Style)),
      True);
    
  end New_Pen;
  
  
  function Get_Style(Self : in Pen_Type) return Pen_Style_Type is
  
  begin
  
    return C_int_To_Pen_Style_Type(wx.Core.Pen.C.GetStyle(Get_wxObject(Self)));
    
  end Get_Style;
  
  
  function Get_Width(Self : in Pen_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Pen.C.GetWidth(Get_wxObject(Self)));
    
  end Get_Width;
  
  
  function Is_Ok(Self : in Pen_Type) return Boolean is
  
  begin
  
    if wx.Core.Pen.C.Ok(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Ok;
  
  
  procedure Set_Style(Self : in out Pen_Type; Style : in Pen_Style_Type) is
  
  begin
  
    wx.Core.Pen.C.SetStyle(Get_wxObject(Self), Pen_Style_Type_To_C_int(Style));
    
  end Set_Style;
  
  
  procedure Set_Width(Self : in out Pen_Type; Width : in Integer) is
  
  begin
  
    wx.Core.Pen.C.SetWidth(Get_wxObject(Self), Interfaces.C.int(Width));
    
  end Set_Width;

    
  -- Pen_Factory.
  function Pen_Factory return Root_WX_Class is
  
  begin
  
    return new Pen_Type;
  
  end Pen_Factory;
  
begin

  wx.Factory.Add_Factory("wxPen", Pen_Factory'Access);
  
end wx.Core.Pen;
