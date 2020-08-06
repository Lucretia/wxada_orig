-- wx-core-scroll_bar-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Scroll_Bar.C is

  function ctor(
    Parent : in System.Address;
    Id,
    X,
    Y,
    Width,
    Height : in Interfaces.C.int;
    Style : in Interfaces.C.long) return System.Address;
  pragma Import(C, ctor, "wxScrollBar_ctor");

  function GetRange(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetRange, "wxScrollBar_GetRange");

  function GetPageSize(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetPageSize, "wxScrollBar_GetPageSize");

  function GetThumbPosition(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetThumbPosition, "wxScrollBar_GetThumbPosition");

  function GetThumbSize(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetThumbSize, "wxScrollBar_GetThumbSize");

  procedure SetThumbPosition(Self : in System.Address; ViewStart : in Interfaces.C.int);
  pragma Import(C, SetThumbPosition, "wxScrollBar_SetThumbPosition");

  procedure SetScrollbar(Self : in System.Address; Position, ThumbSize, Max_Range, PageSize, Refresh : in Interfaces.C.int);
  pragma Import(C, SetScrollbar, "wxScrollBar_SetScrollbar");

end wx.Core.Scroll_Bar.C;
