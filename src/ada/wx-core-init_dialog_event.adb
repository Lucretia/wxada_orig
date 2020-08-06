-- wx-core-init_dialog_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Init_Dialog_Event.C;

use type Interfaces.C.int;

package body wx.Core.Init_Dialog_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  procedure New_Init_Dialog_Event(Self : in out Init_Dialog_Event_Type; Id : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Init_Dialog_Event.C.ctor(Interfaces.C.int(Id)),
      True);
    
  end New_Init_Dialog_Event;
  
  
  -- Init_Dialog_Event_Factory.
  function Init_Dialog_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Init_Dialog_Event_Type;
  
  end Init_Dialog_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxInitDialogEvent", Init_Dialog_Event_Factory'Access);
  
end wx.Core.Init_Dialog_Event;
