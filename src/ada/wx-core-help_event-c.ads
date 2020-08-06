-- wx-core-help_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Help_Event.C is

  function ctor(Command_Id, Id, X, Y : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxHelpEvent_ctor");

  procedure GetPosition(Self, X, Y : in System.Address);
  pragma Import(C, GetPosition, "wxHelpEvent_GetPosition");

  procedure SetPosition(Self : in System.Address; X, Y : in Interfaces.C.int);
  pragma Import(C, SetPosition, "wxHelpEvent_SetPosition");

end wx.Core.Help_Event.C;
