-- wx-core-pen.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- TODO:
--
-- * All access will be through a wrapper around wxPenList which will return a Pen_Class which does not own the internal C++ pointer.
-- * Creating a new Pen will also own the C++ pointer, as usual.
-- * Combine the functionality of FindOrCreatePen into the New_Pen procedure? i.e. Search for the internal pointer first, then return either
--   an owned version of a pointer? Dunno about this!
with wx.Core.GDI;
with wx.Core.Colour;

package wx.Core.Pen is

  -- This is the actual type (wxPen) we are creating here.
  type Pen_Type is new wx.Core.GDI.GDI_Type with private;
--  type Pen_Access is access all Pen_Type;
--  type Pen_View is access constant Pen_Type;
  type Pen_Class is access all Pen_Type'Class;
  
  -- Pen Styles.
  type Pen_Style_Type is (
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
  for Pen_Style_Type use (
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

  procedure New_Pen(Self : in out Pen_Type);
  
  procedure New_Pen(
    Self   : in out Pen_Type;
    Colour : in wx.Core.Colour.Colour_Type;
    Width  : in Integer        := 1;
    Style  : in Pen_Style_Type := Solid);
    
  procedure New_Pen(
    Self   : in out Pen_Type;
    Colour : in String;
    Width  : in Integer        := 1;
    Style  : in Pen_Style_Type := Solid);

  --function Get_Cap(Self : in out Pen_Type;
  --function Get_Colour(Self : in out Pen_Type;
  --function Get_Dashes(Self : in out Pen_Type;
  --function Get_Join(Self : in out Pen_Type;
  --function Get_Stipple(Self : in out Pen_Type;
  function Get_Style(Self : in Pen_Type) return Pen_Style_Type;
  function Get_Width(Self : in Pen_Type) return Integer;
  function Is_Ok(Self : in Pen_Type) return Boolean;
  --procedure Set_Cap(Self : in out Pen_Type;
  --procedure Set_Colour(Self : in out Pen_Type;
  --procedure Set_Dashes(Self : in out Pen_Type;
  --procedure Set_Join(Self : in out Pen_Type;
  --procedure Set_Stipple(Self : in out Pen_Type;
  procedure Set_Style(Self : in out Pen_Type; Style : in Pen_Style_Type);
  procedure Set_Width(Self : in out Pen_Type; Width : in Integer);
    
private
  
  type Pen_Type is new wx.Core.GDI.GDI_Type with null record;
  
  -- TODO: Add Adjust!
--  procedure Finalize(Self : in out Pen_Type);
  
end wx.Core.Pen;
