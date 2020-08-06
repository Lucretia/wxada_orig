-- wx-core-notify_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Notify_Event.C;

use type Interfaces.C.int;

package body wx.Core.Notify_Event is

  procedure New_Notify_Event(
    Self       : in out Notify_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Notify_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id)), True);
    
  end New_Notify_Event;
  
  
  procedure Allow(Self : in Notify_Event_Type) is
  
  begin
  
    wx.Core.Notify_Event.C.Allow(Get_wxObject(Self));
    
  end Allow;
  
  
  function Is_Allowed(Self : in Notify_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Notify_Event.C.IsAllowed(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Allowed;
  
  
  procedure Veto(Self : in Notify_Event_Type) is
  
  begin
  
    wx.Core.Notify_Event.C.Veto(Get_wxObject(Self));
    
  end Veto;
  
  
  -- Notify_Event_Factory.
  function Notify_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Notify_Event_Type;
  
  end Notify_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxNotifyEvent", Notify_Event_Factory'Access);
  
end wx.Core.Notify_Event;
