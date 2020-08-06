-- wx-core-frame-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Frame.C is

  function ctor(
    Parent : in System.Address;
    Id     : in Interfaces.C.int;
    Title  : in Interfaces.C.Strings.chars_ptr;
    X,
    Y,
    Width,
    Height : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxFrame_ctor");

  procedure SetStatusBar(Self, Status_Bar : in System.Address);
  pragma Import(C, SetStatusBar, "wxFrame_SetStatusBar");

  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.

  --function Destroy(Self : in System.Address) return Interfaces.C.int;
  --pragma Import(C, Destroy, "wxFrame_Destroy");
  
  
  -- END

end wx.Core.Frame.C;
