-- wx-core-calculate_layout_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Point;
with wx.Core.Calculate_Layout_Event.C;

use type Interfaces.C.int;

package body wx.Core.Calculate_Layout_Event is

  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
  
  procedure New_Calculate_Layout_Event(Self : in out Calculate_Layout_Event_Type; Window_Id : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Calculate_Layout_Event.C.ctor(Interfaces.C.int(Window_Id)), True);
    
  end New_Calculate_Layout_Event;
  
  
  function Get_Rect(Self : in Calculate_Layout_Event_Type) return wx.Core.Rect.Rect_Type is
  
    X, Y, Width, Height : aliased Interfaces.C.int;
    Area                : wx.Core.Rect.Rect_Type;
    
  begin
  
    wx.Core.Calculate_Layout_Event.C.GetRect(
      Get_wxObject(Self),
      Address_To_Object.To_Address(X'Unchecked_Access),
      Address_To_Object.To_Address(Y'Unchecked_Access),
      Address_To_Object.To_Address(Width'Unchecked_Access),
      Address_To_Object.To_Address(Height'Unchecked_Access));
    
    wx.Core.Rect.New_Rect(
      Area,
      wx.Core.Point.Coord_Type(X),
      wx.Core.Point.Coord_Type(Y),
      wx.Core.Point.Coord_Type(Width),
      wx.Core.Point.Coord_Type(Height));
    
    return Area;
    
  end Get_Rect;
  
  
  procedure Set_Rect(Self : in Calculate_Layout_Event_Type; Area : in wx.Core.Rect.Rect_Type) is
  
  begin
  
    wx.Core.Calculate_Layout_Event.C.SetRect(
      Get_wxObject(Self),
      Interfaces.C.int(wx.Core.Rect.Left(Area)),
      Interfaces.C.int(wx.Core.Rect.Top(Area)),
      Interfaces.C.int(wx.Core.Rect.Width(Area)),
      Interfaces.C.int(wx.Core.Rect.Height(Area)));
    
  end Set_Rect;
  
  
  -- Calculate_Layout_Event_Factory.
  function Calculate_Layout_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Calculate_Layout_Event_Type;
  
  end Calculate_Layout_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxCalculateLayoutEvent", Calculate_Layout_Event_Factory'Access);
  
end wx.Core.Calculate_Layout_Event;
