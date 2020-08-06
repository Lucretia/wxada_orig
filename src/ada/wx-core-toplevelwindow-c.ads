-- wx-core-toplevelwindow-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.TopLevelWindow.C is

  function ctor(
    Parent : in System.Address;
    Id     : in Interfaces.C.int;
    Title  : in Interfaces.C.Strings.chars_ptr;
    X,
    Y,
    Width,
    Height : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxTopLevelWindow_ctor");

end wx.Core.TopLevelWindow.C;
