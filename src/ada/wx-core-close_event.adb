-- wx-core-close_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Close_Event.C;

use type Interfaces.C.int;

package body wx.Core.Close_Event is

  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
  use Address_To_Object;
  
  procedure New_Close_Event(
    Self       : in out Close_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Close_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id)),
      True);
    
  end New_Close_Event;
  
  
  function Can_Veto(Self : in Close_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Close_Event.C.CanVeto(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Can_Veto;
  
  
  function Is_Logging_Off(Self : in Close_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Close_Event.C.GetLoggingOff(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Logging_Off;
  
  
  procedure Set_Can_Veto(Self : in out Close_Event_Type; Can_Veto : in Boolean) is
  
	Can_Veto_Converted : Interfaces.C.int := 0;
	
  begin
  
    if Can_Veto = True then
    
      Can_Veto_Converted := 1;
    
    end if;
  
    wx.Core.Close_Event.C.SetCanVeto(Get_wxObject(Self), Can_Veto_Converted);
    
  end Set_Can_Veto;
  
  
  procedure Set_Logging_Off(Self : in out Close_Event_Type; Logging_Off : in Boolean) is
  
	Logging_Off_Converted : Interfaces.C.int := 0;
	
  begin
  
    if Logging_Off = True then
    
      Logging_Off_Converted := 1;
    
    end if;
  
    wx.Core.Close_Event.C.SetLoggingOff(Get_wxObject(Self), Logging_Off_Converted);
    
  end Set_Logging_Off;
  
  
  procedure Veto(Self : in out Close_Event_Type; Veto : in Boolean) is
  
	Veto_Converted : Interfaces.C.int := 0;
	
  begin
  
    if Veto = True then
    
      Veto_Converted := 1;
    
    end if;
  
    wx.Core.Close_Event.C.Veto(Get_wxObject(Self), Veto_Converted);
    
  end Veto;
  
  
  -- Close_Event_Factory.
  function Close_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Close_Event_Type;
  
  end Close_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxCloseEvent", Close_Event_Factory'Access);
  
end wx.Core.Close_Event;
