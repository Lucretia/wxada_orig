-- wx-core-panel-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Panel.C is

  function ctor(Parent : in System.Address; Id, X, Y, Width, Height, Style : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxPanel_ctor");

  function GetDefaultItem(Self : in System.Address) return System.Address;
  pragma Import(C, GetDefaultItem, "wxPanel_GetDefaultItem");

  procedure InitDialog(Self : in System.Address);
  pragma Import(C, InitDialog, "wxPanel_InitDialog");

  procedure SetDefaultItem(Self, Default : in System.Address);
  pragma Import(C, SetDefaultItem, "wxPanel_SetDefaultItem");

  procedure SetFocus(Self : in System.Address);
  pragma Import(C, SetFocus, "wxPanel_SetFocus");

  procedure SetFocusIgnoringChildren(Self : in System.Address);
  pragma Import(C, SetFocusIgnoringChildren, "wxPanel_SetFocusIgnoringChildren");

end wx.Core.Panel.C;
