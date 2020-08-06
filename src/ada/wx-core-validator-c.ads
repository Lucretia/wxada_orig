-- wx-core-validator-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Validator.C is

  function ctor(AdaEvent : in System.Address) return System.Address;
  pragma Import(C, ctor, "wxValidator_ctor");

  function GetAdaValidator(Self : in System.Address) return System.Address;
  pragma Import(C, GetAdaValidator, "wxValidator_GetAdaValidator");
  
  function GetWindow(Self : in System.Address) return System.Address;
  pragma Import(C, GetWindow, "wxValidator_GetWindow");

  procedure SetBellOnError(Self : in System.Address; DoIt : Interfaces.C.int);
  pragma Import(C, SetBellOnError, "wxValidator_SetBellOnError");

  procedure SetWindow(Self, Window : in System.Address);
  pragma Import(C, SetWindow, "wxValidator_SetWindow");

end wx.Core.Validator.C;
