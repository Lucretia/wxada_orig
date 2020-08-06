-- wx-core-notify_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Notify_Event.C is

  function ctor(CommandType, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxNotifyEvent_ctor");

  procedure Allow(Self : in System.Address);
  pragma Import(C, Allow, "wxNotifyEvent_Allow");

  function IsAllowed(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsAllowed, "wxNotifyEvent_IsAllowed");

  procedure Veto(Self : in System.Address);
  pragma Import(C, Veto, "wxNotifyEvent_Veto");

end wx.Core.Notify_Event.C;
