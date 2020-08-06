-- wx-core-dial_up_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Dial_Up_Event.C;

use type Interfaces.C.int;

package body wx.Core.Dial_Up_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  procedure New_Dial_Up_Event(Self : in out Dial_Up_Event_Type; Is_Connected, Is_Own_Event : in Boolean) is
  
    Is_Connected_Converted : Interfaces.C.int := 0;
    Is_Own_Event_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Is_Connected = True then
    
      Is_Connected_Converted := 1;
      
    end if;
  
    if Is_Own_Event = True then
    
      Is_Own_Event_Converted := 1;
      
    end if;
  
    Set_wxObject(
      Self,
      wx.Core.Dial_Up_Event.C.ctor(Is_Connected_Converted, Is_Own_Event_Converted),
      True);
    
  end New_Dial_Up_Event;
  
  
  function Is_Connected_Event(Self : in Dial_Up_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Dial_Up_Event.C.IsConnectedEvent(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Connected_Event;
  
  
  function Is_Own_Event(Self : in Dial_Up_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Dial_Up_Event.C.IsOwnEvent(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Own_Event;
  
  
  -- Dial_Up_Event_Factory.
  function Dial_Up_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Dial_Up_Event_Type;
  
  end Dial_Up_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxDialUpEvent", Dial_Up_Event_Factory'Access);
  
end wx.Core.Dial_Up_Event;
