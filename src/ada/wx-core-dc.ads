-- wx-core-dc.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;
with wx.Core.Point;
with wx.Core.Colour;
with wx.Core.Pen;
with wx.Core.Brush;
with wx.Core.Bitmap;

package wx.Core.DC is

  -- This is the actual type (wxDC) we are creating here.
  type DC_Type is new wx.Base.Object.Object_Type with private;
--  type DC_Access is access all DC_Type;
--  type DC_View is access constant DC_Type;
  type DC_Class is access all DC_Type'Class;
  
  type Flood_Style_Type is (Border, Surface);
  for Flood_Style_Type use (Border => 0, Surface => 1);
  
  procedure New_DC(Self : in out DC_Type);
  
  procedure Begin_Drawing(Self : in DC_Type);
  procedure Clear(Self : in DC_Type);
  
  procedure Draw_Bitmap(
    Self        : in DC_Type;
    Bitmap      : in wx.Core.Bitmap.Bitmap_Type;
    Position    : in wx.Core.Point.Point_Type;
    Transparent : in Boolean);
    
  procedure Draw_Line(Self : in DC_Type; Start_Point, End_Point : in wx.Core.Point.Point_Type);
  procedure End_Drawing(Self : in DC_Type);
  
  function Flood_Fill(
    Self   : in DC_Type;
    Point  : in wx.Core.Point.Point_Type;
    Colour : in wx.Core.Colour.Colour_Type;
    Style  : in Flood_Style_Type := Surface) return Boolean;
    
  function Get_Background(Self : in DC_Type) return wx.Core.Brush.Brush_Class;
  function Get_Brush(Self : in DC_Type) return wx.Core.Brush.Brush_Class;
  function Get_Pen(Self : in DC_Type) return wx.Core.Pen.Pen_Class;
  function Is_Ok(Self : in DC_Type) return Boolean;
  procedure Set_Background(Self : in DC_Type; Brush : in wx.Core.Brush.Brush_Type);
  procedure Set_Brush(Self : in DC_Type; Brush : in wx.Core.Brush.Brush_Type);
  procedure Set_Pen(Self : in DC_Type; Pen : in wx.Core.Pen.Pen_Type);
  procedure Set_Text_Background(Self : in DC_Type; Colour : in wx.Core.Colour.Colour_Type);
  procedure Set_Text_Foreground(Self : in DC_Type; Colour : in wx.Core.Colour.Colour_Type);
  
private
  
  type DC_Type is new wx.Base.Object.Object_Type with null record;
  
end wx.Core.DC;
