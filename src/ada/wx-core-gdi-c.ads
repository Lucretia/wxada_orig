-- wx-core-gdi-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;

private package wx.Core.GDI.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxGDIObject_ctor");

end wx.Core.GDI.C;
