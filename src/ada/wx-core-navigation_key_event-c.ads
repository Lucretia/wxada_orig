-- wx-core-navigation_key_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

package wx.Core.Navigation_Key_Event.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxNavigationKeyEvent_ctor");

  function GetDirection(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetDirection, "wxNavigationKeyEvent_GetDirection");

  procedure SetDirection(Self : in System.Address; Forward : in Interfaces.C.int);
  pragma Import(C, SetDirection, "wxNavigationKeyEvent_SetDirection");

  function IsWindowChange(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsWindowChange, "wxNavigationKeyEvent_IsWindowChange");

  procedure SetWindowChange(Self : in System.Address; Window_Change : in Interfaces.C.int);
  pragma Import(C, SetWindowChange, "wxNavigationKeyEvent_SetWindowChange");

  function IsFromTab(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsFromTab, "wxNavigationKeyEvent_IsFromTab");

  procedure SetFromTab(Self : in System.Address; From_Tab : in Interfaces.C.int);
  pragma Import(C, SetFromTab, "wxNavigationKeyEvent_SetFromTab");

  procedure SetFlags(Self : in System.Address; Flags : in Interfaces.C.int);
  pragma Import(C, SetFlags, "wxNavigationKeyEvent_SetFlags");

end wx.Core.Navigation_Key_Event.C;
