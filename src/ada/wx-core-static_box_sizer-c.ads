-- wx-core-static_box_sizer-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Static_Box_Sizer.C is

  function ctor(Box : in System.Address; Orientation : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxStaticBoxSizer_ctor");

  function GetStaticBox(Self : in System.Address) return System.Address;
  pragma Import(C, GetStaticBox, "wxStaticBoxSizer_GetStaticBox");

end wx.Core.Static_Box_Sizer.C;
