-- wx-core-spin-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Spin.C is

  function ctor(
    Parent  : in System.Address;
    Id      : in Interfaces.C.int;
    Value   : in Interfaces.C.Strings.chars_ptr;
    X,
    Y,
    Width,
    Height  : in Interfaces.C.int;
    Style   : in Interfaces.C.long;
    Min_Value,
    Max_Value,
    Initial : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxSpinCtrl_ctor");

  procedure SetValue(Self : in System.Address; Value : in Interfaces.C.int);
  pragma Import(C, SetValue, "wxSpinCtrl_SetValue");

  function GetValue(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetValue, "wxSpinCtrl_GetValue");

  procedure SetRange(Self : in System.Address; Min_Value, Max_Value : in Interfaces.C.int);
  pragma Import(C, SetRange, "wxSpinCtrl_SetRange");

  procedure SetSelection(Self : in System.Address; Min_Value, Max_Value : in Interfaces.C.long);
  pragma Import(C, SetSelection, "wxSpinCtrl_SetSelection");

  function GetMin(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetMin, "wxSpinCtrl_GetMin");

  function GetMax(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetMax, "wxSpinCtrl_GetMax");

end wx.Core.Spin.C;
