-- wx-base-idle_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Base.Idle_Event.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxIdleEvent_ctor");

  function CanSend(Window : in System.Address) return Interfaces.C.int;
  pragma Import(C, CanSend, "wxIdleEvent_CanSend");
	
  function GetMode return Interfaces.C.int;
  pragma Import(C, GetMode, "wxIdleEvent_GetMode");
	
  procedure RequestMore(Self : in System.Address; NeedMore : in Interfaces.C.int);
  pragma Import(C, RequestMore, "wxIdleEvent_RequestMore");
	
  function MoreRequested(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, MoreRequested, "wxIdleEvent_MoreRequested");
	
  procedure SetMode(Mode : in Interfaces.C.int);
  pragma Import(C, SetMode, "wxIdleEvent_SetMode");
	
end wx.Base.Idle_Event.C;
