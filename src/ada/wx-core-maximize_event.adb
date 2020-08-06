-- wx-core-maximize_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Maximize_Event.C;

use type Interfaces.C.int;

package body wx.Core.Maximize_Event is

  procedure New_Maximize_Event(Self : in out Maximize_Event_Type; Id : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Maximize_Event.C.ctor(Interfaces.C.int(Id)),
      True);
    
  end New_Maximize_Event;
  
  
  -- Maximize_Event_Factory.
  function Maximize_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Maximize_Event_Type;
  
  end Maximize_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxMaximizeEvent", Maximize_Event_Factory'Access);
  
end wx.Core.Maximize_Event;
