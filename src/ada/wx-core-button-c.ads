-- wx-core-button-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Button.C is

  function ctor(
    Parent    : in System.Address;
    Id        : in Interfaces.C.int;
    Label     : in Interfaces.C.Strings.chars_ptr;
    X,
    Y,
    Width,
    Height    : in Interfaces.C.int;
    Style     : in Interfaces.C.long) return System.Address;
  pragma Import(C, ctor, "wxButton_ctor");
    
  function GetLabel(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetLabel, "wxButton_GetLabel");
    
  procedure GetDefaultSize(Self : in System.Address; Width, Height : in System.Address);
  pragma Import(C, GetDefaultSize, "wxButton_GetDefaultSize");
    
  procedure SetDefault(Self : in System.Address);
  pragma Import(C, SetDefault, "wxButton_SetDefault");
    
  procedure SetLabel(Self : in System.Address; Label : in Interfaces.C.Strings.chars_ptr);
  pragma Import(C, SetLabel, "wxButton_SetLabel");
    
end wx.Core.Button.C;
