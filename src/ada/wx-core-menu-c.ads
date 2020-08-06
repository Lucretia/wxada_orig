-- wx-core-menu-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Menu.C is

  function ctor(Parent : in System.Address; Title : in Interfaces.C.Strings.chars_ptr; Style : in Interfaces.C.long) return System.Address;
  pragma Import(C, ctor, "wxMenu_ctor");

end wx.Core.Menu.C;
