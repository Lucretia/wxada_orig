-- wx-core-size_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Size_Event.C is

  function ctor(Width, Height, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxSizeEvent_ctor");

  procedure GetSize(Self : in System.Address; Width, Height : in System.Address);
  pragma Import(C, GetSize, "wxSizeEvent_GetSize");

end wx.Core.Size_Event.C;
