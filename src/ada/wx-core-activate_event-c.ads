-- wx-core-activate_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Activate_Event.C is

  function ctor(Command_Id, Active, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxActivateEvent_ctor");
	
  function GetActive(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetActive, "wxActivateEvent_GetActive");
	
end wx.Core.Activate_Event.C;
