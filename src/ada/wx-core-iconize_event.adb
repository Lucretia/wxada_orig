-- wx-core-iconize_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Iconize_Event.C;

use type Interfaces.C.int;
use type System.Address;

package body wx.Core.Iconize_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
--  package Address_To_Window_Class is new System.Address_To_Access_Conversions(Window_Type'Class);
  
  procedure New_Iconize_Event(
    Self    : in out Iconize_Event_Type;
    Id      : in wx.Base.Id.Id_Type := 0;
    Iconize : in Boolean            := True) is
  
	Iconize_Converted : Interfaces.C.int := 0;
	
  begin
  
    if Iconize = True then
    
      Iconize_Converted := 1;
    
    end if;
  
    Set_wxObject(
      Self,
      wx.Core.Iconize_Event.C.ctor(Interfaces.C.int(Id), Iconize_Converted),
      True);
    
  end New_Iconize_Event;
  
  
  function Is_Iconized(Self : in Iconize_Event_Type) return Boolean is
  
  begin

    if wx.Core.Iconize_Event.C.Iconized(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Iconized;
  
  
  -- Iconize_Event_Factory.
  function Iconize_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Iconize_Event_Type;
  
  end Iconize_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxIconizeEvent", Iconize_Event_Factory'Access);
  
end wx.Core.Iconize_Event;
