-- wx-core-erase_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Erase_Event.C is

  function ctor(Id : in Interfaces.C.int; DC : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxEraseEvent_ctor");

  function GetDC(Self : in System.Address) return System.Address;
  pragma Import(C, GetDC, "wxEraseEvent_GetDC");

end wx.Core.Erase_Event.C;
