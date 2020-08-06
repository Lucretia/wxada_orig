-- wx-core-button.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--with System.Address_To_Access_Conversions;
with Interfaces.C.Strings;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Button.C;

use type Interfaces.C.int;

package body wx.Core.Button is

  package Address_To_C_int_Access is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_C_int_Access;
  

  procedure New_Button(
    Self     : in out Button_Type;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Button_Styles_Type := 0) is
  
--    Self_Access : Button_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Button.C.ctor(
        System.Null_Address,
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Label),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
    
  end New_Button;
  
  
  procedure New_Button(
    Self     : in out Button_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Button_Styles_Type := 0) is
  
--    Self_Access : Button_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Button.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Label),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
    
  end New_Button;
  
	
  function Get_Label(Self : in Button_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Core.Button.C.GetLabel(Get_wxObject(Self)));
    
  end Get_Label;
  
  
  function Get_Default_Size(Self : in Button_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased Interfaces.C.int;
    
  begin
  
    wx.Core.Button.C.GetDefaultSize(
      Get_wxObject(Self),
      Address_To_C_int_Access.To_Address(Width'Unchecked_Access),
      Address_To_C_int_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(wx.Core.Point.Coord_Type(Width), wx.Core.Point.Coord_Type(Height));
    
  end Get_Default_Size;
  
  
  procedure Set_Default(Self : in Button_Type) is
  
  begin
  
    wx.Core.Button.C.SetDefault(Get_wxObject(Self));
    
  end Set_Default;
  
  
  procedure Set_Label(Self : in Button_Type; Label : in String) is
  
  begin
  
    wx.Core.Button.C.SetLabel(Get_wxObject(Self), Interfaces.C.Strings.New_String(Label));
    
  end Set_Label;
  

  -- Button_Factory.
  function Button_Factory return Root_WX_Class is
  
  begin
  
    return new Button_Type;
  
  end Button_Factory;
  
begin

  wx.Factory.Add_Factory("wxButton", Button_Factory'Access);
  
end wx.Core.Button;
