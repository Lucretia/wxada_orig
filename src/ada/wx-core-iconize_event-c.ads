-- wx-core-iconize_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Iconize_Event.C is

  function ctor(Id, Iconize : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxIconizeEvent_ctor");

  function Iconized(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Iconized, "wxIconizeEvent_Iconized");

end wx.Core.Iconize_Event.C;
