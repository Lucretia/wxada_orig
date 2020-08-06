-- wx-core-spin.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--with System.Address_To_Access_Conversions;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Spin.C;

use type Interfaces.C.int;

package body wx.Core.Spin is

  procedure New_Spin(
    Self          : in out Spin_Type;
    Id            : in wx.Base.Id.Id_Type;
    Value         : in String;
    Position      : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size          : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style         : in Spin_Styles_Type         := Spin_Arrow_Keys;
    Min_Value     : in Integer                  := 0;
    Max_Value     : in Integer                  := 100;
    Initial_Value : in Integer                  := 0) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Spin.C.ctor(
        System.Null_Address,
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Value),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style),
        Interfaces.C.int(Min_Value),
        Interfaces.C.int(Max_Value),
        Interfaces.C.int(Initial_Value)),
      True);
      
  end New_Spin;
    

  procedure New_Spin(
    Self          : in out Spin_Type;
    Parent        : in wx.Core.Window.Window_Type'Class;
    Id            : in wx.Base.Id.Id_Type;
    Value         : in String;
    Position      : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size          : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style         : in Spin_Styles_Type         := Spin_Arrow_Keys;
    Min_Value     : in Integer                  := 0;
    Max_Value     : in Integer                  := 100;
    Initial_Value : in Integer                  := 0) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Spin.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Value),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style),
        Interfaces.C.int(Min_Value),
        Interfaces.C.int(Max_Value),
        Interfaces.C.int(Initial_Value)),
      True);
      
  end New_Spin;

  
  procedure Set_Value(Self : in Spin_Type; Value : in Integer) is
  
  begin
  
    wx.Core.Spin.C.SetValue(Get_wxObject(Self), Interfaces.C.int(Value));
    
  end Set_Value;
  
  
  function Get_Value(Self : in Spin_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Spin.C.GetValue(Get_wxObject(Self)));
    
  end Get_Value;
  
  
  procedure Set_Range(Self : in Spin_Type; Min_Value, Max_Value : in Integer) is
  
  begin
  
    wx.Core.Spin.C.SetRange(Get_wxObject(Self), Interfaces.C.int(Min_Value), Interfaces.C.int(Max_Value));
    
  end Set_Range;
  
  
  procedure Set_Selection(Self : in Spin_Type; From, To : in Long_Integer) is
  
  begin
  
    wx.Core.Spin.C.SetSelection(Get_wxObject(Self), Interfaces.C.long(From), Interfaces.C.long(To));
    
  end Set_Selection;
  
  
  function Get_Min(Self : in Spin_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Spin.C.GetMin(Get_wxObject(Self)));
    
  end Get_Min;
  
  
  function Get_Max(Self : in Spin_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Spin.C.GetMax(Get_wxObject(Self)));
    
  end Get_Max;

    
  -- Spin_Factory.
  function Spin_Factory return Root_WX_Class is
  
  begin
  
    return new Spin_Type;
  
  end Spin_Factory;
  
begin

  wx.Factory.Add_Factory("wxSpinCtrl", Spin_Factory'Access);
  
end wx.Core.Spin;
