-- wx-core-box_sizer-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Box_Sizer.C is

  function ctor(Orientation : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxBoxSizer_ctor");

  procedure RecalcSizes(Self : in System.Address);
  pragma Import(C, RecalcSizes, "wxBoxSizer_RecalcSizes");

  procedure CalcMin(Self : in System.Address);
  pragma Import(C, CalcMin, "wxBoxSizer_CalcMin");

  function GetOrientation(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetOrientation, "wxBoxSizer_GetOrientation");

end wx.Core.Box_Sizer.C;
