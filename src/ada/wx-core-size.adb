-- wx-core-size.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.Point;

use type wx.Core.Point.Coord_Type;

package body wx.Core.Size is

  procedure Decrement_To(Self : in out Size_Type; Size : in Size_Type) is
  
  begin
  
    if Size.Width < Self.Width then
    
      Self.Width := Size.Width;
      
    end if;
    
    if Size.Height < Self.Height then
    
      Self.Height := Size.Height;
      
    end if;
    
  end Decrement_To;
  
  
  function Is_Fully_Specified(Self : in Size_Type) return Boolean is
  
  begin
  
    if Self.Width = wx.Core.Point.Default_Coord or Self.Height = wx.Core.Point.Default_Coord then
    
      return False;
      
    end if;
    
    return True;
    
  end Is_Fully_Specified;
  
  
  procedure Increment_To(Self : in out Size_Type; Size : in Size_Type) is
  
  begin
  
    if Size.Width > Self.Width then
    
      Self.Width := Size.Width;
      
    end if;
    
    if Size.Height > Self.Height then
    
      Self.Height := Size.Height;
      
    end if;
    
  end Increment_To;
  
  
  procedure Set(Self : in out Size_Type; Width, Height : in wx.Core.Point.Coord_Type) is
  
  begin
  
    Self.Width  := Width;
    Self.Height := Height;
    
  end Set;
  
  
  procedure Set_Defaults(Self : in out Size_Type; Size : in Size_Type) is
  
  begin
  
    if Self.Width = wx.Core.Point.Default_Coord then
    
      Self.Width := Size.Width;
      
    end if;
    
    if Self.Height = wx.Core.Point.Default_Coord then
    
      Self.Height := Size.Height;
      
    end if;
    
  end Set_Defaults;
  
end wx.Core.Size;
