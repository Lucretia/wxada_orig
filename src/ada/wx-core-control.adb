-- wx-core-control.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;
--with System.Address_To_Access_Conversions;
with wx.Core.Control.C;

package body wx.Core.Control is

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
--  package Address_To_Object is new System.Address_To_Access_Conversions(wx.Core.Window.Window_Type);
--  use Address_To_Object;
  
  procedure New_Control(
    Self   : in out Control_Type;
    Parent : in wx.Core.Window.Window_Type'Class;
    Id     : in wx.Base.Id.Id_Type) is
  
--    Self_Access : Control_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Control.C.ctor(wx.Core.Window.Get_wxObject(Parent), Interfaces.C.int(Id)),
      True);
    
  end New_Control;
  
  
  function Get_Label(Self : in Control_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Core.Control.C.GetLabel(Get_wxObject(Self)));
    
  end Get_Label;
  
  
  procedure Set_Label(Self : in Control_Type; Label : in String) is
  
  begin
  
    wx.Core.Control.C.SetLabel(Get_wxObject(Self), Interfaces.C.Strings.New_String(Label));
    
  end Set_Label;
  
end wx.Core.Control;
