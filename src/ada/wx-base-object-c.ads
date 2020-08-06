-- wx-base-object-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;

private package wx.Base.Object.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxObject_ctor");

  procedure dtor(Self : in System.Address);
  pragma Import(C, dtor, "wxObject_dtor");

end wx.Base.Object.C;
