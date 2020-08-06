-- wx-core-size.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.Point;

package wx.Core.Size is

  -- This is the actual type (wxSize) we are creating here.
  type Size_Type is
    record
      Width, Height : wx.Core.Point.Coord_Type := 0;
    end record;
  
--  type Size_Access is access all Size_Type;
--  type Size_View is access constant Size_Type;
  
  Default_Size : constant Size_Type := (wx.Core.Point.Default_Coord, wx.Core.Point.Default_Coord);

  procedure Decrement_To(Self : in out Size_Type; Size : in Size_Type);
  function Is_Fully_Specified(Self : in Size_Type) return Boolean;

  procedure Increment_To(Self : in out Size_Type; Size : in Size_Type);
  procedure Set(Self : in out Size_Type; Width, Height : in wx.Core.Point.Coord_Type);
  procedure Set_Defaults(Self : in out Size_Type; Size : in Size_Type);

end wx.Core.Size;
