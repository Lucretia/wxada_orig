-- wx-core-brush.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.GDI;
with wx.Core.Colour;

package wx.Core.Brush is

  -- This is the actual type (wxBrush) we are creating here.
  type Brush_Type is new wx.Core.GDI.GDI_Type with private;
--  type Brush_Access is access all Brush_Type;
--  type Brush_View is access constant Brush_Type;
  type Brush_Class is access all Brush_Type'Class;
  
  -- Brush Styles.
  type Brush_Style_Type is (
    Solid,
    Dot,
    Long_Dash,
    Short_Dash,
    Dot_Dash,
    User_Dash,
    Transparent,
    Stipple,
    Backward_Diagonal_Hatch,
    Cross_Diagonal_Hatch,
    Forward_Diagonal_Hatch,
    Cross_Hatch,
    Horizontal_Hatch,
    Vertical_Hatch);
  for Brush_Style_Type use (
    Solid => 100,
    Dot => 101,
    Long_Dash => 102,
    Short_Dash => 103,
    Dot_Dash => 104,
    User_Dash => 105,
    Transparent => 106,
    Stipple => 110,
    Backward_Diagonal_Hatch => 111,
    Cross_Diagonal_Hatch => 112,
    Forward_Diagonal_Hatch => 113,
    Cross_Hatch => 114,
    Horizontal_Hatch => 115,
    Vertical_Hatch => 116);

  procedure New_Brush(Self : in out Brush_Type);
  procedure New_Brush(Self : in out Brush_Type; Colour : in wx.Core.Colour.Colour_Type; Style : in Brush_Style_Type := Solid);
  procedure New_Brush(Self : in out Brush_Type; Colour : in String; Style : in Brush_Style_Type := Solid);

  function Get_Colour(Self : in Brush_Type) return wx.Core.Colour.Colour_Class;
  --function Get_Stipple(Self : in out Brush_Type;
  function Get_Style(Self : in Brush_Type) return Brush_Style_Type;
  function Is_Hatched(Self : in Brush_Type) return Boolean;
  function Is_Ok(Self : in Brush_Type) return Boolean;
  procedure Set_Colour(Self : in out Brush_Type; Colour : in wx.Core.Colour.Colour_Type);
  procedure Set_Colour(Self : in out Brush_Type; Colour : in String);
  --procedure Set_Stipple(Self : in out Pen_Type;
  procedure Set_Style(Self : in out Brush_Type; Style : in Brush_Style_Type);
    
private
  
  type Brush_Type is new wx.Core.GDI.GDI_Type with null record;
  
  -- TODO: Add Adjust!
--  procedure Finalize(Self : in out Pen_Type);
  
end wx.Core.Brush;
