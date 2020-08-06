-- wx-core-app-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;

private package wx.Core.App.C is

  function ctor(AdaObject : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxApp_ctor");

  procedure dtor(Self : in System.Address);
  pragma Import(C, dtor, "wxApp_dtor");
  
end wx.Core.App.C;
