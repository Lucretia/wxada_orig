-- wx-core-menu_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Menu_Event.C is

  function ctor(Command_Id, Id : in Interfaces.C.int; Menu : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxMenuEvent_ctor");

  function GetMenu(Self : in System.Address) return System.Address;
  pragma Import(C, GetMenu, "wxMenuEvent_GetMenu");

  function GetMenuId(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetMenuId, "wxMenuEvent_GetMenuId");

  function IsPopup(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsPopup, "wxMenuEvent_IsPopup");

end wx.Core.Menu_Event.C;
