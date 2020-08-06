-- wx-core-paint_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Paint_Event.C is

  function ctor(Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxPaintEvent_ctor");

end wx.Core.Paint_Event.C;
