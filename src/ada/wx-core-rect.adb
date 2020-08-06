-- wx-core-rect.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.Point;
with wx.Core.Size;

use type wx.Core.Point.Point_Type;
use type wx.Core.Point.Coord_Type;
use type wx.Core.Size.Size_Type;

package body wx.Core.Rect is

  procedure New_Rect(Self : in out Rect_Type; Left, Top, Width, Height : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Left   := Left;
    Self.Top    := Top;
    Self.Width  := Width;
    Self.Height := Height;
    
  end New_Rect;
  
  
  procedure New_Rect(Self : in out Rect_Type; Top_Left, Bottom_Right : in wx.Core.Point.Point_Type) is
  
  begin
  
    Self.Left   := Top_Left.X;
    Self.Top    := Top_Left.Y;
    Self.Width  := Bottom_Right.X - Top_Left.X;
    Self.Height := Bottom_Right.Y - Top_Left.Y;
    
    if Self.Width < 0 then
    
      Self.Width := -Self.Width;
      Self.Left  := Bottom_Right.X;
      
    end if;
    
    Self.Width := Self.Width + 1;
  
    if Self.Height < 0 then
    
      Self.Height := -Self.Height;
      Self.Top    := Bottom_Right.Y;
      
    end if;
    
    Self.Height := Self.Height + 1;
    
  end New_Rect;
  
  
  procedure New_Rect(Self : in out Rect_Type; Position : in wx.Core.Point.Point_Type; Size : in wx.Core.Size.Size_Type) is
  
  begin
  
    Self.Left   := Position.X;
    Self.Top    := Position.Y;
    Self.Width  := Size.Width;
    Self.Height := Size.Height;
    
  end New_Rect;
  
  
  procedure New_Rect(Self : in out Rect_Type; Size : in wx.Core.Size.Size_Type) is
  
  begin
  
    Self.Left   := 0;
    Self.Top    := 0;
    Self.Width  := Size.Width;
    Self.Height := Size.Height;
    
  end New_Rect;
  
  
  function Left(Self : in Rect_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return Self.Left;
    
  end Left;
  
  
  function Top(Self : in Rect_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return Self.Top;
  
  end Top;
  
  
  function Width(Self : in Rect_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return Self.Width;
  
  end Width;
  
  
  function Height(Self : in Rect_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return Self.Height;
    
  end Height;
  
  
  function Right(Self : in Rect_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return Self.Left + Self.Width - 1;
  
  end Right;
  
  
  function Bottom(Self : in Rect_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return Self.Top + Self.Height - 1;
    
  end Bottom;
  
  
  function Top_Left(Self : in Rect_Type) return wx.Core.Point.Point_Type is
  
  begin
  
    return wx.Core.Point.Point_Type'(Self.Left, Self.Top);
    
  end Top_Left;
  
  
  function Bottom_Right(Self : in Rect_Type) return wx.Core.Point.Point_Type is
  
  begin
  
    return wx.Core.Point.Point_Type'(Bottom(Self), Right(Self));
    
  end Bottom_Right;
  
  
  function Size(Self : in Rect_Type) return wx.Core.Size.Size_Type is
  
  begin
  
    return wx.Core.Size.Size_Type'(Self.Width, Self.Height);
    
  end Size;
  

  function Deflate(Self : in Rect_Type; Delta_X, Delta_Y : in wx.Core.Point.Coord_Type) return Rect_Type is
  
  begin
  
    return Inflate(Self, -Delta_X, -Delta_Y);
    
  end Deflate;
  
  
  function Inflate(Self : in Rect_Type; Delta_X, Delta_Y : in wx.Core.Point.Coord_Type) return Rect_Type is
  
    Result : Rect_Type := Self;
    
  begin
  
    if -2 * Delta_X > Result.Width then

      -- Don't allow deflate to eat more width than we have, a well-defined rectangle cannot have negative width.
      Result.Left  := Result.Left + (Result.width / 2);
      Result.width := 0;
    
    else
    
      -- The inflate is valid.
      Result.Left  := Result.Left - Delta_X;
      Result.Width := Result.Width + (2 * Delta_X);
    
    end if;

    if -2 * Delta_Y > Result.Height then
    
      -- Don't allow deflate to eat more height than we have, a well-defined rectangle cannot have negative height.
      Result.Top    := Result.Top + Result.Height / 2;
      Result.Height := 0;
    
    else
    
      -- The inflate is valid.
      Result.Top    := Result.Top - Delta_Y;
      Result.Height := Result.Height + (2 * Delta_Y);
    
    end if;

    return Result;

  end Inflate;
  
  
  function Is_Inside(Self : in Rect_Type; X, Y : in wx.Core.Point.Coord_Type) return Boolean is
  
  begin
  
    if X >= Self.Left and Y >= Self.Top and Y - Self.Top < Self.Height and X - Self.Left < Self.Width then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Inside;
  
  
  function Is_Inside(Self : in Rect_Type; Point : in wx.Core.Point.Point_Type) return Boolean is
  
  begin
  
    return Is_Inside(Self, Point.X, Point.Y);
    
  end Is_Inside;
  

  function Intersects(Self, Rect : in Rect_Type) return Boolean is
  
    Result : Rect_Type := Intersection(Self, Rect);
    
  begin
  
    if Width(Result) /= 0 then
    
      return True;
      
    end if;
    
    return False;
    
  end Intersects;
  
  
  function Is_Empty(Self : in Rect_Type) return Boolean is
  
  begin
  
    if Self.Width <= 0 or Self.Height <= 0 then
    
      return True;
      
    end if;
    
    return False;
    
  end Is_Empty;
  
  
  procedure Offset(Self : in out Rect_Type; Delta_X, Delta_Y : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Left := Self.Left + Delta_X;
    Self.Top  := Self.Top + Delta_Y;
    
  end Offset;
  
  
  procedure Offset(Self : in out Rect_Type; Delta_Point : in wx.Core.Point.Point_Type) is
  
  begin
  
    Offset(Self, Delta_Point.X, Delta_Point.Y);
    
  end Offset;
  
  
  procedure Set_Left(Self : in out Rect_Type; Left : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Left := Left;
    
  end Set_Left;
  
  
  procedure Set_Top(Self : in out Rect_Type; Top : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Top := Top;
  
  end Set_Top;
  
  
  procedure Set_Width(Self : in out Rect_Type; Width : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Width := Width;
    
  end Set_Width;
  
  
  procedure Set_Height(Self : in out Rect_Type; Height : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Height := Height;
  
  end Set_Height;
  
  
  procedure Set_Size(Self : in out Rect_Type; Size : in wx.Core.Size.Size_Type) is
  
  begin
  
    Self.Width  := Size.Width;
    Self.Height := Size.Height;
    
  end Set_Size;
  
  
  function Union(Self, Rect : in Rect_Type) return Rect_Type is
    
  begin
  
    if Self.Width = 0 or Self.Height = 0 then
    
      return Rect;
    
    end if;
    
    if Rect.Width /= 0 and Rect.Height /= 0 then
    
      declare
      
        X1 : wx.Core.Point.Coord_Type := wx.Core.Point.Coord_Type'Min(Self.Left, Rect.Left);
        Y1 : wx.Core.Point.Coord_Type := wx.Core.Point.Coord_Type'Min(Self.Top, Rect.Top);
        X2 : wx.Core.Point.Coord_Type := wx.Core.Point.Coord_Type'Max(Self.Left + Self.Width, Rect.Left + Rect.Width);
        Y2 : wx.Core.Point.Coord_Type := wx.Core.Point.Coord_Type'Max(Self.Top + Self.Height, Rect.Top + Rect.Height);
        
      begin
      
        return Rect_Type'(X1, Y1, X2 - X1, Y2 - Y1);
        
      end;
      
    end if;
    
    return Self;
    
  end Union;
  

  function Intersection(Self, Rect : in Rect_Type) return Rect_Type is

    Result : Rect_Type  := Self;
    X2     : wx.Core.Point.Coord_Type := Right(Self);
    Y2     : wx.Core.Point.Coord_Type := Bottom(Self);
    
  begin
  
    if Result.Left < Rect.Left then
    
      Result.Left := Rect.Left;
    
    end if;
    
    if Result.Top < Rect.Top then
    
      Result.Top := Rect.Top;
    
    end if;
    
    if X2 > Right(Rect) then
    
      X2 := Right(Rect);
    
    end if;
    
    if Y2 > Bottom(Rect) then
    
      Y2 := Bottom(Rect);
    
    end if;
    
    Result.Width  := X2 - Result.Left + 1;
    Result.Height := Y2 - Result.Top + 1;
    
    if Result.Width <= 0 or Result.Height <= 0 then
    
      Result.Width  := 0;
      Result.Height := 0;
    
    end if;
    
    return Result;
      
  end Intersection;
  
end wx.Core.Rect;
