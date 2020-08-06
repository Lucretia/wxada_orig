-- wx-core-dc.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.DC.C;

use type Interfaces.C.int;

package body wx.Core.DC is
  
  function Flood_Style_Type_C_int is new Ada.Unchecked_Conversion(Source => Flood_Style_Type, Target => Interfaces.C.int);
  
  procedure New_DC(Self : in out DC_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.DC.C.ctor, True);
    
  end New_DC;


  procedure Begin_Drawing(Self : in DC_Type) is
  
  begin
  
    wx.Core.DC.C.BeginDrawing(Get_wxObject(Self));
    
  end Begin_Drawing;

    
  procedure Clear(Self : in DC_Type) is
  
  begin
  
    wx.Core.DC.C.Clear(Get_wxObject(Self));
    
  end Clear;


  procedure Draw_Bitmap(
    Self        : in DC_Type;
    Bitmap      : in wx.Core.Bitmap.Bitmap_Type;
    Position    : in wx.Core.Point.Point_Type;
    Transparent : in Boolean) is
  
    Transparent_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Transparent = True then
    
      Transparent_Converted := 1;
    
    end if;
  
    wx.Core.DC.C.DrawBitmap(
      Get_wxObject(Self),
      wx.Core.Bitmap.Get_wxObject(Bitmap),
      Interfaces.C.int(Position.X),
      Interfaces.C.int(Position.Y),
      Transparent_Converted);
    
  end Draw_Bitmap;

    
  procedure Draw_Line(Self : in DC_Type; Start_Point, End_Point : in wx.Core.Point.Point_Type) is
  
  begin
  
    wx.Core.DC.C.DrawLine(
      Get_wxObject(Self),
      Interfaces.C.int(Start_Point.X),
      Interfaces.C.int(Start_Point.Y),
      Interfaces.C.int(End_Point.X),
      Interfaces.C.int(End_Point.Y));
    
  end Draw_Line;
  
  
  procedure End_Drawing(Self : in DC_Type) is
  
  begin
  
    wx.Core.DC.C.EndDrawing(Get_wxObject(Self));
    
  end End_Drawing;


  function Flood_Fill(
    Self   : in DC_Type;
    Point  : in wx.Core.Point.Point_Type;
    Colour : in wx.Core.Colour.Colour_Type;
    Style  : in Flood_Style_Type := Surface) return Boolean is
  
  begin
  
    if wx.Core.DC.C.FloodFill(
      Get_wxObject(Self),
      Interfaces.C.int(Point.X),
      Interfaces.C.int(Point.Y),
      wx.Core.Colour.Get_wxObject(Colour),
      Flood_Style_Type_C_int(Style)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Flood_Fill;


  function Get_Background(Self : in DC_Type) return wx.Core.Brush.Brush_Class is
  
    Internal_Brush : System.Address := wx.Core.DC.C.GetBackground(Get_wxObject(Self));
    
  begin
  
    return wx.Core.Brush.Brush_Class(
      wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Internal_Brush), Internal_Brush, False));
    
  end Get_Background;
  
  
  function Get_Brush(Self : in DC_Type) return wx.Core.Brush.Brush_Class is
  
    Internal_Brush : System.Address := wx.Core.DC.C.GetBrush(Get_wxObject(Self));
    
  begin
  
    return wx.Core.Brush.Brush_Class(
      wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Internal_Brush), Internal_Brush, False));
    
  end Get_Brush;

	
  function Get_Pen(Self : in DC_Type) return wx.Core.Pen.Pen_Class is
  
    Internal_Pen : System.Address := wx.Core.DC.C.GetPen(Get_wxObject(Self));
    
  begin
  
    return wx.Core.Pen.Pen_Class(
      wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Internal_Pen), Internal_Pen, False));
    
  end Get_Pen;
  
  
  function Is_Ok(Self : in DC_Type) return Boolean is
  
  begin
  
    if wx.Core.DC.C.Ok(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Ok;
  
  
  procedure Set_Background(Self : in DC_Type; Brush : in wx.Core.Brush.Brush_Type) is
  
  begin
  
    wx.Core.DC.C.SetBackground(Get_wxObject(Self), wx.Core.Brush.Get_wxObject(Brush));
    
  end Set_Background;
  
  
  procedure Set_Brush(Self : in DC_Type; Brush : in wx.Core.Brush.Brush_Type) is
  
  begin
  
    wx.Core.DC.C.SetBrush(Get_wxObject(Self), wx.Core.Brush.Get_wxObject(Brush));
    
  end Set_Brush;
  
  
  procedure Set_Pen(Self : in DC_Type; Pen : in wx.Core.Pen.Pen_Type) is
  
  begin
  
    wx.Core.DC.C.SetPen(Get_wxObject(Self), wx.Core.Pen.Get_wxObject(Pen));
    
  end Set_Pen;
  
  
  procedure Set_Text_Background(Self : in DC_Type; Colour : in wx.Core.Colour.Colour_Type) is
  
  begin
  
    wx.Core.DC.C.SetTextBackground(Get_wxObject(Self), wx.Core.Colour.Get_wxObject(Colour));
    
  end Set_Text_Background;
  
  
  procedure Set_Text_Foreground(Self : in DC_Type; Colour : in wx.Core.Colour.Colour_Type) is
  
  begin
  
    wx.Core.DC.C.SetTextForeground(Get_wxObject(Self), wx.Core.Colour.Get_wxObject(Colour));
    
  end Set_Text_Foreground;
  
  
  -- DC_Factory.
  function DC_Factory return Root_WX_Class is
  
  begin
  
    return new DC_Type;
  
  end DC_Factory;
  
begin

  wx.Factory.Add_Factory("wxDC", DC_Factory'Access);
  
end wx.Core.DC;
