-- wx-core-brush.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Brush.C;

use type Interfaces.C.int;

package body wx.Core.Brush is
  
  function Brush_Style_Type_To_C_int is new Ada.Unchecked_Conversion(Source => Brush_Style_Type, Target => Interfaces.C.int);
  function C_int_To_Brush_Style_Type is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Brush_Style_Type);
  
  
  procedure New_Brush(Self : in out Brush_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Brush.C.ctor, True);
    
  end New_Brush;
  
  
  procedure New_Brush(Self : in out Brush_Type; Colour : in wx.Core.Colour.Colour_Type; Style : in Brush_Style_Type := Solid) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Brush.C.ctor_From_Colour(
        wx.Core.Colour.Get_wxObject(Colour),
        Brush_Style_Type_To_C_int(Style)),
      True);
    
  end New_Brush;
  
  
  procedure New_Brush(Self : in out Brush_Type; Colour : in String; Style : in Brush_Style_Type := Solid) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Brush.C.ctor_From_Colour_Name(
        Interfaces.C.Strings.New_String(Colour),
        Brush_Style_Type_To_C_int(Style)),
      True);
    
  end New_Brush;
  
  
  function Get_Colour(Self : in Brush_Type) return wx.Core.Colour.Colour_Class is
  
    Internal_Colour : System.Address := wx.Core.Brush.C.GetColour(Get_wxObject(Self));
    
  begin
  
    return wx.Core.Colour.Colour_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Internal_Colour), Internal_Colour, False));
    
  end Get_Colour;
  
  
  function Get_Style(Self : in Brush_Type) return Brush_Style_Type is
  
  begin
  
    return C_int_To_Brush_Style_Type(wx.Core.Brush.C.GetStyle(Get_wxObject(Self)));
    
  end Get_Style;
  
  
  function Is_Hatched(Self : in Brush_Type) return Boolean is
  
  begin
  
    if wx.Core.Brush.C.IsHatch(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Hatched;
  
  
  function Is_Ok(Self : in Brush_Type) return Boolean is
  
  begin
  
    if wx.Core.Brush.C.Ok(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Ok;
  
  
  procedure Set_Colour(Self : in out Brush_Type; Colour : in wx.Core.Colour.Colour_Type) is
  
  begin
  
    wx.Core.Brush.C.SetColour(Get_wxObject(Self), wx.Core.Colour.Get_wxObject(Colour));
    
  end Set_Colour;
  
  
  procedure Set_Colour(Self : in out Brush_Type; Colour : in String) is
  
  begin
  
    wx.Core.Brush.C.SetColour_From_Name(Get_wxObject(Self), Interfaces.C.Strings.New_String(Colour));
    
  end Set_Colour;
  
  
  procedure Set_Style(Self : in out Brush_Type; Style : in Brush_Style_Type) is
  
  begin
  
    wx.Core.Brush.C.SetStyle(Get_wxObject(Self), Brush_Style_Type_To_C_int(Style));
    
  end Set_Style;
  
  
  -- Brush_Factory.
  function Brush_Factory return Root_WX_Class is
  
  begin
  
    return new Brush_Type;
  
  end Brush_Factory;
  
begin

  wx.Factory.Add_Factory("wxBrush", Brush_Factory'Access);
  
end wx.Core.Brush;
