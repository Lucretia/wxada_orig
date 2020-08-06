-- wx-core-spin_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Spin_Event.C;

package body wx.Core.Spin_Event is

  procedure New_Spin_Event(
    Self       : in out Spin_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Spin_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id)), True);
    
  end New_Spin_Event;
  
  
  function Get_Position(Self : in Spin_Event_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Spin_Event.C.GetPosition(Get_wxObject(Self)));
    
  end Get_Position;
  
  
  procedure Set_Position(Self : in Spin_Event_Type; Position : in Integer) is
  
  begin
  
    wx.Core.Spin_Event.C.SetPosition(Get_wxObject(Self), Interfaces.C.int(Position));
    
  end Set_Position;
  
  
  -- Spin_Event_Factory.
  function Spin_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Spin_Event_Type;
  
  end Spin_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxSpinEvent", Spin_Event_Factory'Access);
  
end wx.Core.Spin_Event;
