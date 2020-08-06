-- wx-core-spin_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Spin_Event.C is

  function ctor(CommandType, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxSpinEvent_ctor");

  function GetPosition(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetPosition, "wxSpinEvent_GetPosition");

  procedure SetPosition(Self : in System.Address; Position : in Interfaces.C.int);
  pragma Import(C, SetPosition, "wxSpinEvent_SetPosition");

end wx.Core.Spin_Event.C;
