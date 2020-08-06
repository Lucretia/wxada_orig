-- wx-core-scroll_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Scroll_Event.C is

  function ctor(CommandType, Id, Position, Orientation : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxScrollEvent_ctor");

  function GetOrientation(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetOrientation, "wxScrollEvent_GetOrientation");

  function GetPosition(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetPosition, "wxScrollEvent_GetPosition");

end wx.Core.Scroll_Event.C;
