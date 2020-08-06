-- wx-core-maximize_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Maximize_Event.C is

  function ctor(Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxMaximizeEvent_ctor");

end wx.Core.Maximize_Event.C;
