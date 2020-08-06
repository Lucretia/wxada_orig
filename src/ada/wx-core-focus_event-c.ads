-- wx-core-focus_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Focus_Event.C is

  function ctor(Command_Id, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxFocusEvent_ctor");

  function GetWindow(Self : in System.Address) return System.Address;
  pragma Import(C, GetWindow, "wxFocusEvent_GetWindow");

  procedure SetWindow(Self, Window : in System.Address);
  pragma Import(C, SetWindow, "wxFocusEvent_SetWindow");

end wx.Core.Focus_Event.C;
