-- wx-base-Idle_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Base.Idle_Event.C;

use type Interfaces.C.int;
use type System.Address;

package body wx.Base.Idle_Event is

  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
  use Address_To_Object;
  
  package Address_To_Window_Class is new System.Address_To_Access_Conversions(wx.Core.Window.Window_Type'Class);
  
  function Idle_Mode_To_C_int is new Ada.Unchecked_Conversion(Source => Idle_Mode_Type, Target => Interfaces.C.int);
  function C_int_To_Idle_Mode is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Idle_Mode_Type);

  procedure New_Idle_Event(Self : in out Idle_Event_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Base.Idle_Event.C.ctor,
      True);
    
  end New_Idle_Event;
  
  
  function Can_Accept_Idle_Events(Window : in wx.Core.Window.Window_Class) return Boolean is
  
  begin

    if wx.Base.Idle_Event.C.CanSend(wx.Core.Window.Get_wxObject(Window.all)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Can_Accept_Idle_Events;
  
  
  function Get_Idle_Mode(Window : in wx.Core.Window.Window_Class) return Idle_Mode_Type is
  
  begin
  
    return C_int_To_Idle_Mode(wx.Base.Idle_Event.C.GetMode);
    
  end Get_Idle_Mode;
  
  
  procedure Request_More(Self : in Idle_Event_Type; Need_More : in Boolean) is
  
	Need_More_Converted : Interfaces.C.int := 0;
	
  begin
  
    if Need_More = True then
    
      Need_More_Converted := 1;
    
    end if;
  
    wx.Base.Idle_Event.C.RequestMore(Get_wxObject(Self), Need_More_Converted);
    
  end Request_More;
  
  
  function More_Requested(Self : in Idle_Event_Type) return Boolean is
  
  begin
  
    if wx.Base.Idle_Event.C.MoreRequested(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end More_Requested;
  
  
  procedure Set_Idle_Mode(Mode : in Idle_Mode_Type) is
  
  begin
  
    wx.Base.Idle_Event.C.SetMode(Idle_Mode_To_C_int(Mode));
    
  end Set_Idle_Mode;
  
  
  -- Idle_Event_Factory.
  function Idle_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Idle_Event_Type;
  
  end Idle_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxIdleEvent", Idle_Event_Factory'Access);
  
end wx.Base.Idle_Event;
