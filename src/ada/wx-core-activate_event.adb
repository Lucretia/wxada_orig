-- wx-core-activate_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Activate_Event.C;

use type Interfaces.C.int;

package body wx.Core.Activate_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  

  procedure New_Activate_Event(
    Self       : in out Activate_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Active     : in Boolean;
    Id         : in wx.Base.Id.Id_Type) is
  
	Active_Converted : Interfaces.C.int := 0;
	
  begin
  
    if Active = True  then
    
      Active_Converted := 1;
    
    end if;
  
    Set_wxObject(
      Self,
      wx.Core.Activate_Event.C.ctor(Interfaces.C.int(Command_Id), Active_Converted, Interfaces.C.int(Id)),
      True);
    
  end New_Activate_Event;
  
  
  function Is_Activated(Self : in Activate_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Activate_Event.C.GetActive(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Activated;
  
  
  -- Activate_Event_Factory.
  function Activate_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Activate_Event_Type;
  
  end Activate_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxActivateEvent", Activate_Event_Factory'Access);
  
end wx.Core.Activate_Event;
