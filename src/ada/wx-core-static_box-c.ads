-- wx-core-static_box-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Static_Box.C is

  function ctor(
    Parent : in System.Address;
    Id     : in Interfaces.C.int;
    Label  : in Interfaces.C.Strings.chars_ptr;
    X,
    Y,
    Width,
    Height,
    Style  : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxStaticBox_ctor");

end wx.Core.Static_Box.C;
