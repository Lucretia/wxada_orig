-- wx-core-sizer-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Sizer.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxSizer_ctor");

  procedure Add(Self, Window : in System.Address; Proportion, Flags, Border : in Interfaces.C.int);
  pragma Import(C, Add, "wxSizer_Add");

  procedure AddSpacer(Self : in System.Address; Size : in Interfaces.C.int);
  pragma Import(C, AddSpacer, "wxSizer_AddSpacer");

  procedure AddStretchSpacer(Self : in System.Address; Proportion : in Interfaces.C.int);
  pragma Import(C, AddStretchSpacer, "wxSizer_AddStretchSpacer");

  procedure SetSizeHints(Self, Window : in System.Address);
  pragma Import(C, SetSizeHints, "wxSizer_SetSizeHints");

  procedure SetVirtualSizeHints(Self, Window : in System.Address);
  pragma Import(C, SetVirtualSizeHints, "wxSizer_SetVirtualSizeHints");

end wx.Core.Sizer.C;
