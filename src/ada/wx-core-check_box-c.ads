-- wx-core-check_box-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;
with Interfaces.C.Strings;

private package wx.Core.Check_Box.C is

  function ctor(
    Parent : in System.Address;
    Id     : in Interfaces.C.int;
    Label  : in Interfaces.C.Strings.chars_ptr;
    X,
    Y,
    Width,
    Height : in Interfaces.C.int;
    Style  : in Interfaces.C.long) return System.Address;
  pragma Import(C, ctor, "wxCheckBox_ctor");
    
  function GetValue(Parent : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetValue, "wxCheckBox_GetValue");
    
  function Get3StateValue(Parent : in System.Address) return Interfaces.C.int;
  pragma Import(C, Get3StateValue, "wxCheckBox_Get3StateValue");
    
  function Is3rdStateAllowedForUser(Parent : in System.Address) return Interfaces.C.int;
  pragma Import(C, Is3rdStateAllowedForUser, "wxCheckBox_Is3rdStateAllowedForUser");
    
  function Is3State(Parent : in System.Address) return Interfaces.C.int;
  pragma Import(C, Is3State, "wxCheckBox_Is3State");
    
  procedure SetValue(Parent : in System.Address; State : in Interfaces.C.int);
  pragma Import(C, SetValue, "wxCheckBox_SetValue");
    
  procedure Set3StateValue(Parent : in System.Address; State : in Interfaces.C.int);
  pragma Import(C, Set3StateValue, "wxCheckBox_Set3StateValue");
    
end wx.Core.Check_Box.C;
