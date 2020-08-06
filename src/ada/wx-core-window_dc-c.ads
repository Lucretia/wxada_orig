-- wx-core-window_dc-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;

private package wx.Core.Window_DC.C is

  function ctor(Window : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxWindowDC_ctor");

end wx.Core.Window_DC.C;
