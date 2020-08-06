-- wx-core-paint_dc-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Paint_DC.C is

  function ctor(Window : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxPaintDC_ctor");

end wx.Core.Paint_DC.C;
