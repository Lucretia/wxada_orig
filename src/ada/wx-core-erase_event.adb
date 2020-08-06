-- wx-core-erase_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Erase_Event.C;

use type Interfaces.C.int;

package body wx.Core.Erase_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  procedure New_Erase_Event(Self : in out Erase_Event_Type; Id : in wx.Base.Id.Id_Type; DC : in wx.Core.DC.DC_Class) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Erase_Event.C.ctor(Interfaces.C.int(Id), wx.Core.DC.Get_wxObject(DC.all)),
      True);
    
  end New_Erase_Event;
  
  
  function Get_DC(Self : in Erase_Event_Type) return wx.Core.DC.DC_Class is
  
	DC : System.Address := wx.Core.Erase_Event.C.GetDC(Get_wxObject(Self));
	
  begin
  
    return wx.Core.DC.DC_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(DC), DC, False));
    
  end Get_DC;
  
  
  -- Erase_Event_Factory.
  function Erase_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Erase_Event_Type;
  
  end Erase_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxEraseEvent", Erase_Event_Factory'Access);
  
end wx.Core.Erase_Event;
