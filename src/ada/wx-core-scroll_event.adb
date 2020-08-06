-- wx-core-scroll_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Scroll_Event.C;

package body wx.Core.Scroll_Event is

  procedure New_Scroll_Event(
    Self        : in out Scroll_Event_Type;
    Command_Id  : in wx.Base.Event.Event_Id_Type;
    Id          : in wx.Base.Id.Id_Type;
    Position    : in Integer;
    Orientation : in Scroll_Bar_Styles_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Scroll_Event.C.ctor(
        Interfaces.C.int(Command_Id),
        Interfaces.C.int(Id),
        Interfaces.C.int(Position),
        Interfaces.C.int(Orientation)),
      True);
    
  end New_Scroll_Event;
  
  
  function Get_Orientation(Self : in Scroll_Event_Type) return Scroll_Bar_Styles_Type is
  
  begin
  
    return Scroll_Bar_Styles_Type(wx.Core.Scroll_Event.C.GetOrientation(Get_wxObject(Self)));
    
  end Get_Orientation;
  
  
  function Get_Position(Self : in Scroll_Event_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Scroll_Event.C.GetPosition(Get_wxObject(Self)));
    
  end Get_Position;
  
  
  -- Scroll_Event_Factory.
  function Scroll_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Scroll_Event_Type;
  
  end Scroll_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxScrollEvent", Scroll_Event_Factory'Access);
  
end wx.Core.Scroll_Event;
