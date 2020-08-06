-- wx-core-control-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Control.C is

  function ctor(Parent : in System.Address; Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxControl_ctor");

  function GetLabel(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetLabel, "wxControl_GetLabel");

  procedure SetLabel(Self : in System.Address; Label : in Interfaces.C.Strings.chars_ptr);
  pragma Import(C, SetLabel, "wxControl_SetLabel");

end wx.Core.Control.C;
