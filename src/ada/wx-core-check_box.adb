-- wx-core-check_box.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Check_Box.C;

use type Interfaces.C.int;

package body wx.Core.Check_Box is

  function Check_Box_State_To_C_int is new Ada.Unchecked_Conversion(Source => Check_Box_State_Type, Target => Interfaces.C.int);
  function C_int_To_Check_Box_State is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Check_Box_State_Type);
  
  procedure New_Check_Box(
    Self     : in out Check_Box_Type;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Check_Box_Styles_Type    := Check_Box_Two_State) is
  
--    Self_Access : Check_Box_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Check_Box.C.ctor(
        System.Null_Address,
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Label),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
    
  end New_Check_Box;
  
  
  procedure New_Check_Box(
    Self     : in out Check_Box_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Check_Box_Styles_Type    := Check_Box_Two_State) is
  
--    Self_Access : Check_Box_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Check_Box.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Label),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
    
  end New_Check_Box;


  function Get_Value(Self : in Check_Box_Type) return Boolean is
  
  begin
  
    if wx.Core.Check_Box.C.GetValue(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Get_Value;
  
  
  function Get_Value(Self : in Check_Box_Type) return Check_Box_State_Type is
  
  begin
  
    return C_int_To_Check_Box_State(wx.Core.Check_Box.C.Get3StateValue(Get_wxObject(Self)));
    
  end Get_Value;
  
  
  function Is_Third_State_User_Selectable(Self : in Check_Box_Type) return Boolean is
  
  begin
  
    if wx.Core.Check_Box.C.Is3rdStateAllowedForUser(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Third_State_User_Selectable;
  
  
  function Is_Three_State(Self : in Check_Box_Type) return Boolean is
  
  begin
  
    if wx.Core.Check_Box.C.Is3State(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Three_State;
  
  
  procedure Set_Value(Self : in Check_Box_Type; State : in Boolean) is
  
    Converted_State : Interfaces.C.int;
    
  begin
  
    if State = True then
    
      Converted_State := 1;
    
    else
    
      Converted_State := 0;
    
    end if;
  
    wx.Core.Check_Box.C.SetValue(Get_wxObject(Self), Converted_State);
    
  end Set_Value;
  
  
  procedure Set_Value(Self : in Check_Box_Type; State : in Check_Box_State_Type) is
  
  begin
  
    wx.Core.Check_Box.C.Set3StateValue(Get_wxObject(Self), Check_Box_State_To_C_int(State));
    
  end Set_Value;


  -- Check_Box_Factory.
  function Check_Box_Factory return Root_WX_Class is
  
  begin
  
    return new Check_Box_Type;
  
  end Check_Box_Factory;
  
begin

  wx.Factory.Add_Factory("wxCheckBox", Check_Box_Factory'Access);
  
end wx.Core.Check_Box;
