-- wx-core-size_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Point;
with wx.Core.Size_Event.C;

use type Interfaces.C.int;

package body wx.Core.Size_Event is

  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  procedure New_Size_Event(Self : in out Size_Event_Type; Size : in wx.Core.Size.Size_Type; Id : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Size_Event.C.ctor(Interfaces.C.int(Size.Width), Interfaces.C.int(Size.Height), Interfaces.C.int(Id)),
      True);
    
  end New_Size_Event;
  
  
  function Get_Size(Self : in Size_Event_Type) return wx.Core.Size.Size_Type is
  
	--Size : Size_Type;
	Width, Height : aliased Interfaces.C.int;
	
  begin
  
    wx.Core.Size_Event.C.GetSize(
      Get_wxObject(Self),
      Address_To_Object.To_Address(Width'Unchecked_Access),
      Address_To_Object.To_Address(Height'Unchecked_Access));
  
    return wx.Core.Size.Size_Type'(wx.Core.Point.Coord_Type(Width), wx.Core.Point.Coord_Type(Height));
    
  end Get_Size;
  
  
  -- Size_Event_Factory.
  function Size_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Size_Event_Type;
  
  end Size_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxSizeEvent", Size_Event_Factory'Access);
  
end wx.Core.Size_Event;
