-- wx-core-dial_up_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Dial_Up_Event.C is

  function ctor(IsConnected, IsOwnEvent : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxDialUpEvent_ctor");

  function IsConnectedEvent(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsConnectedEvent, "wxDialUpEvent_IsConnectedEvent");

  function IsOwnEvent(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsOwnEvent, "wxDialUpEvent_IsOwnEvent");

end wx.Core.Dial_Up_Event.C;
