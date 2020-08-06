-- wx-base-app_console-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;

private package wx.Base.App_Console.C is

  function ctor(AdaObject : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxAppConsole_ctor");

  procedure dtor(Self : in System.Address);
  pragma Import(C, dtor, "wxAppConsole_dtor");
  
end wx.Base.App_Console.C;
