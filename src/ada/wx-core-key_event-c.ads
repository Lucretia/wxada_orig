-- wx-core-key_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Key_Event.C is

  function ctor(Command_Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxKeyEvent_ctor");

  function AltDown(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, AltDown, "wxKeyEvent_AltDown");

  function CmdDown(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, CmdDown, "wxKeyEvent_CmdDown");

  function ControlDown(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, ControlDown, "wxKeyEvent_ControlDown");

  function GetKeyCode(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetKeyCode, "wxKeyEvent_GetKeyCode");

  procedure GetPosition(Self, X, Y : in System.Address);
  pragma Import(C, GetPosition, "wxKeyEvent_GetPosition");

  function GetX(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetX, "wxKeyEvent_GetX");

  function GetY(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetY, "wxKeyEvent_GetY");

  function HasModifiers(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, HasModifiers, "wxKeyEvent_HasModifiers");

  function MetaDown(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, MetaDown, "wxKeyEvent_MetaDown");

  function ShiftDown(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, ShiftDown, "wxKeyEvent_ShiftDown");

end wx.Core.Key_Event.C;
