-- wx-core-slider-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Slider.C is

  function ctor(
    Parent     : in System.Address;
    Id,
    Value,
    Min_Value,
    Max_Value,
    X,
    Y,
    Width,
    Height      : in Interfaces.C.int;
    Style       : in Interfaces.C.long) return System.Address;
  pragma Import(C, ctor, "wxSlider_ctor");

  procedure ClearSel(Self : in System.Address);
  pragma Import(C, ClearSel, "wxSlider_ClearSel");

  procedure ClearTicks(Self : in System.Address);
  pragma Import(C, ClearTicks, "wxSlider_ClearTicks");

  function GetLineSize(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetLineSize, "wxSlider_GetLineSize");

  function GetMax(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetMax, "wxSlider_GetMax");

  function GetMin(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetMin, "wxSlider_GetMin");

  function GetPageSize(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetPageSize, "wxSlider_GetPageSize");

  function GetSelEnd(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetSelEnd, "wxSlider_GetSelEnd");

  function GetSelStart(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetSelStart, "wxSlider_GetSelStart");

  function GetThumbLength(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetThumbLength, "wxSlider_GetThumbLength");

  function GetTickFreq(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetTickFreq, "wxSlider_GetTickFreq");

  function GetValue(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetValue, "wxSlider_GetValue");

  procedure SetRange(Self : in System.Address; MinValue, MaxValue : in Interfaces.C.int);
  pragma Import(C, SetRange, "wxSlider_SetRange");

  procedure SetTickFreq(Self : in System.Address; Frequency, Position : in Interfaces.C.int);
  pragma Import(C, SetTickFreq, "wxSlider_SetTickFreq");

  procedure SetLineSize(Self : in System.Address; LineSize : in Interfaces.C.int);
  pragma Import(C, SetLineSize, "wxSlider_SetLineSize");

  procedure SetPageSize(Self : in System.Address; LineSize : in Interfaces.C.int);
  pragma Import(C, SetPageSize, "wxSlider_SetPageSize");

  procedure SetSelection(Self : in System.Address; StartPos, EndPos : in Interfaces.C.int);
  pragma Import(C, SetSelection, "wxSlider_SetSelection");

  procedure SetThumbLength(Self : in System.Address; Length : in Interfaces.C.int);
  pragma Import(C, SetThumbLength, "wxSlider_SetThumbLength");

  procedure SetTick(Self : in System.Address; TickPos : in Interfaces.C.int);
  pragma Import(C, SetTick, "wxSlider_SetTick");

  procedure SetValue(Self : in System.Address; Value : in Interfaces.C.int);
  pragma Import(C, SetValue, "wxSlider_SetValue");

end wx.Core.Slider.C;
