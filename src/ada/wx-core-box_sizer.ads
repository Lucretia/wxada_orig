-- wx-core-box_sizer.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with wx.Core.Sizer;

package wx.Core.Box_Sizer is

  -- This is the actual type (wxBoxSizer) we are creating here.
  type Box_Sizer_Type is new wx.Core.Sizer.Sizer_Type with private;
--  type Box_Sizer_Access is access all Box_Sizer_Type;
--  type Box_Sizer_View is access constant Box_Sizer_Type;
  type Box_Sizer_Class is access all Box_Sizer_Type'Class;
  
  type Box_Sizer_Orientation_Type is mod 2 ** Interfaces.C.int'Size;
  
  Box_Sizer_Orientation_Horizontal : constant Box_Sizer_Orientation_Type := 16#0000_0004#;
  Box_Sizer_Orientation_Vertical   : constant Box_Sizer_Orientation_Type := 16#0000_0008#;
  Box_Sizer_Orientation_Both       : constant Box_Sizer_Orientation_Type := Box_Sizer_Orientation_Horizontal or Box_Sizer_Orientation_Vertical;
  
  procedure New_Box_Sizer(Self : in out Box_Sizer_Type; Orientation : in Box_Sizer_Orientation_Type);
  
  procedure Recalculate_Sizes(Self : in out Box_Sizer_Type'Class);
  procedure Calculate_Min(Self : in out Box_Sizer_Type'Class);

  function Get_Orientation(Self : in Box_Sizer_Type'Class) return Box_Sizer_Orientation_Type;
  
private

  type Box_Sizer_Type is new wx.Core.Sizer.Sizer_Type with null record;
  
end wx.Core.Box_Sizer;
