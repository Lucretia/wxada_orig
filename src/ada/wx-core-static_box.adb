-- wx-core-static_box.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Static_Box.C;

package body wx.Core.Static_Box is

  procedure New_Static_Box(
    Self     : in out Static_Box_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Static_Box_Styles_Type   := 0) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Static_Box.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Label),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.int(Style)),
      True);
    
  end New_Static_Box;
  
    
  -- Static_Box_Factory.
  function Static_Box_Factory return Root_WX_Class is
  
  begin
  
    return new Static_Box_Type;
  
  end Static_Box_Factory;
  
begin

  wx.Factory.Add_Factory("wxStaticBox", Static_Box_Factory'Access);
  
end wx.Core.Static_Box;
