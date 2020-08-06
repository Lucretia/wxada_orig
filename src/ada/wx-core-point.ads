-- wx-core-point.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
package wx.Core.Point is

  -- This is the actual type (wxCoord) we are creating here.
  type Coord_Type is new Integer;
--  type Coord_Access is access all Coord_Type;
--  type Coord_View is access constant Coord_Type;
  
  type Point_Type is
    record
      X, Y : Coord_Type := 0;
    end record;
  
  type Point_Access is access all Point_Type;
  type Point_View is access constant Point_Type;
  
  Default_Coord    : constant Coord_Type := -1;
  Default_Position : constant Point_Type := (Default_Coord, Default_Coord);
    
end wx.Core.Point;
