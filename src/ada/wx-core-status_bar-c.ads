-- wx-core-status_bar-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Status_Bar.C is

  function ctor(Parent : in System.Address; Id : in Interfaces.C.int; Style : in Interfaces.C.long) return System.Address;
  pragma Import(C, ctor, "wxStatusBar_ctor");

  procedure GetFieldRect(Self : in System.Address; Field : in Interfaces.C.int; X, Y, Width, Height, Result : out Interfaces.C.int);
  pragma Import(C, GetFieldRect, "wxStatusBar_GetFieldRect");

  function GetFieldsCount(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetFieldsCount, "wxStatusBar_GetFieldsCount");

  function GetStatusText(Self : in System.Address; Field : in Interfaces.C.int) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetStatusText, "wxStatusBar_GetStatusText");

  procedure PopStatusText(Self : in System.Address; Field : in Interfaces.C.int);
  pragma Import(C, PopStatusText, "wxStatusBar_PopStatusText");

  procedure PushStatusText(Self : in System.Address; Text : in Interfaces.C.Strings.chars_ptr; Field : in Interfaces.C.int);
  pragma Import(C, PushStatusText, "wxStatusBar_PushStatusText");

  procedure SetFieldsCount(Self : in System.Address; Total : in Interfaces.C.int; Widths : in System.Address := System.Null_Address);
  pragma Import(C, SetFieldsCount, "wxStatusBar_SetFieldsCount");

  procedure SetMinHeight(Self : in System.Address; Height : in Interfaces.C.int);
  pragma Import(C, SetMinHeight, "wxStatusBar_SetMinHeight");

  procedure SetStatusText(Self : in System.Address; Text : in Interfaces.C.Strings.chars_ptr; Field : in Interfaces.C.int);
  pragma Import(C, SetStatusText, "wxStatusBar_SetStatusText");

  procedure SetStatusWidths(Self : in System.Address; Total : in Interfaces.C.int; Widths : in System.Address);
  pragma Import(C, SetStatusWidths, "wxStatusBar_SetStatusWidths");

  procedure SetStatusStyles(Self : in System.Address; Total : in Interfaces.C.int; Styles : in System.Address);
  pragma Import(C, SetStatusStyles, "wxStatusBar_SetStatusStyles");

end wx.Core.Status_Bar.C;
