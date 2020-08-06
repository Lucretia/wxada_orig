-- wx-core-box_sizer.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Factory;
with wx.Core.Box_Sizer.C;

package body wx.Core.Box_Sizer is

  procedure New_Box_Sizer(Self : in out Box_Sizer_Type; Orientation : in Box_Sizer_Orientation_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Box_Sizer.C.ctor(Interfaces.C.int(Orientation)), True);
    
  end New_Box_Sizer;
  
  
  procedure Recalculate_Sizes(Self : in out Box_Sizer_Type'Class) is
  
  begin
  
    wx.Core.Box_Sizer.C.RecalcSizes(Get_wxObject(Self));
    
  end Recalculate_Sizes;
  
  
  procedure Calculate_Min(Self : in out Box_Sizer_Type'Class) is
  
  begin
  
    wx.Core.Box_Sizer.C.CalcMin(Get_wxObject(Self));
    
  end Calculate_Min;
  

  function Get_Orientation(Self : in Box_Sizer_Type'Class) return Box_Sizer_Orientation_Type is
  
  begin
  
    return Box_Sizer_Orientation_Type(wx.Core.Box_Sizer.C.GetOrientation(Get_wxObject(Self)));
    
  end Get_Orientation;

    
  -- Box_Sizer_Factory.
  function Box_Sizer_Factory return Root_WX_Class is
  
  begin
  
    return new Box_Sizer_Type;
  
  end Box_Sizer_Factory;
  
begin

  wx.Factory.Add_Factory("wxBoxSizer", Box_Sizer_Factory'Access);
  
end wx.Core.Box_Sizer;
