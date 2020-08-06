-- wx-core-context_menu_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Context_Menu_Event.C is

  function ctor(Command_Id, Id, X, Y : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxContextMenuEvent_ctor");

  procedure GetPosition(Self, X, Y : in System.Address);
  pragma Import(C, GetPosition, "wxContextMenuEvent_GetPosition");

  procedure SetPosition(Self : in System.Address; X, Y : in Interfaces.C.int);
  pragma Import(C, SetPosition, "wxContextMenuEvent_SetPosition");

end wx.Core.Context_Menu_Event.C;
