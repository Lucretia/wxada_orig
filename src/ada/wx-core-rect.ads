-- wx-core-rect.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.Point;
with wx.Core.Size;

package wx.Core.Rect is

  -- This is the actual type (wxRect) we are creating here.
  type Rect_Type is private;

  procedure New_Rect(Self : in out Rect_Type; Left, Top, Width, Height : in wx.Core.Point.Coord_Type);
  procedure New_Rect(Self : in out Rect_Type; Top_Left, Bottom_Right : in wx.Core.Point.Point_Type);
  procedure New_Rect(Self : in out Rect_Type; Position : in wx.Core.Point.Point_Type; Size : in wx.Core.Size.Size_Type);
  procedure New_Rect(Self : in out Rect_Type; Size : in wx.Core.Size.Size_Type);
  
  function Left(Self : in Rect_Type) return wx.Core.Point.Coord_Type;
  pragma Inline(Left);
  
  function Top(Self : in Rect_Type) return wx.Core.Point.Coord_Type;
  pragma Inline(Top);
  
  function Width(Self : in Rect_Type) return wx.Core.Point.Coord_Type;
  pragma Inline(Width);
  
  function Height(Self : in Rect_Type) return wx.Core.Point.Coord_Type;
  pragma Inline(Height);
  
  function Right(Self : in Rect_Type) return wx.Core.Point.Coord_Type;
  pragma Inline(Right);
  
  function Bottom(Self : in Rect_Type) return wx.Core.Point.Coord_Type;
  pragma Inline(Bottom);
  
  function Top_Left(Self : in Rect_Type) return wx.Core.Point.Point_Type;
  pragma Inline(Top_Left);
  
  function Bottom_Right(Self : in Rect_Type) return wx.Core.Point.Point_Type;
  pragma Inline(Bottom_Right);
  
  function Size(Self : in Rect_Type) return wx.Core.Size.Size_Type;
  pragma Inline(Size);

  function Deflate(Self : in Rect_Type; Delta_X, Delta_Y : in wx.Core.Point.Coord_Type) return Rect_Type;
  pragma Inline(Deflate);

  function Inflate(Self : in Rect_Type; Delta_X, Delta_Y : in wx.Core.Point.Coord_Type) return Rect_Type;
  
  function Is_Inside(Self : in Rect_Type; X, Y : in wx.Core.Point.Coord_Type) return Boolean;
  function Is_Inside(Self : in Rect_Type; Point : in wx.Core.Point.Point_Type) return Boolean;
  pragma Inline(Is_Inside);

  function Intersects(Self, Rect : in Rect_Type) return Boolean;
  
  function Is_Empty(Self : in Rect_Type) return Boolean;
  
  procedure Offset(Self : in out Rect_Type; Delta_X, Delta_Y : in wx.Core.Point.Coord_Type);
  pragma Inline(Offset);
  
  procedure Offset(Self : in out Rect_Type; Delta_Point : in wx.Core.Point.Point_Type);
  pragma Inline(Offset);
  
  procedure Set_Left(Self : in out Rect_Type; Left : in wx.Core.Point.Coord_Type);
  pragma Inline(Set_Left);
  
  procedure Set_Top(Self : in out Rect_Type; Top : in wx.Core.Point.Coord_Type);
  pragma Inline(Set_Top);
  
  procedure Set_Width(Self : in out Rect_Type; Width : in wx.Core.Point.Coord_Type);
  pragma Inline(Set_Width);
  
  procedure Set_Height(Self : in out Rect_Type; Height : in wx.Core.Point.Coord_Type);
  pragma Inline(Set_Height);
  
  procedure Set_Size(Self : in out Rect_Type; Size : in wx.Core.Size.Size_Type);
  pragma Inline(Set_Size);
  
  function Union(Self, Rect : in Rect_Type) return Rect_Type;
  function Intersection(Self, Rect : in Rect_Type) return Rect_Type;
  
--  function X renames Left;
--  function Y renames Top;
--  function Position renames Top_Left;
  
private

  type Rect_Type is
    record
      Left, Top, Width, Height : wx.Core.Point.Coord_Type := 0;
    end record;
    
end wx.Core.Rect;
