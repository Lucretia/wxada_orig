-- wx-core-static_box_sizer.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.Box_Sizer;
with wx.Core.Static_Box;

package wx.Core.Static_Box_Sizer is

  -- This is the actual type (wxStaticBoxSizer) we are creating here.
  type Static_Box_Sizer_Type is new wx.Core.Box_Sizer.Box_Sizer_Type with private;
--  type Static_Box_Sizer_Access is access all Static_Box_Sizer_Type;
--  type Static_Box_Sizer_View is access constant Static_Box_Sizer_Type;
  type Static_Box_Sizer_Class is access all Static_Box_Sizer_Type'Class;
  
  procedure New_Static_Box_Sizer(
    Self        : in out Static_Box_Sizer_Type;
    Box         : in wx.Core.Static_Box.Static_Box_Type'Class;
    Orientation : in wx.Core.Box_Sizer.Box_Sizer_Orientation_Type);
  
  function Get_Static_Box(Self : in Static_Box_Sizer_Type) return wx.Core.Static_Box.Static_Box_Class;
  
private

  type Static_Box_Sizer_Type is new wx.Core.Box_Sizer.Box_Sizer_Type with 
    record
      Box : wx.Core.Static_Box.Static_Box_Class := null;
    end record;
  
end wx.Core.Static_Box_Sizer;
