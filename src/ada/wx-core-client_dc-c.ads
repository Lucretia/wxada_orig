-- wx-core-client_dc-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;

private package wx.Core.Client_DC.C is

  function ctor(Window : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxClientDC_ctor");
  
end wx.Core.Client_DC.C;
