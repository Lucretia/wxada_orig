-- wx-core-panel.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--with System.Address_To_Access_Conversions;
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Panel.C;

use type Interfaces.C.int;
use type System.Address;

package body wx.Core.Panel is

  procedure New_Panel(
    Self     : in out Panel_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Panel_Styles_Type        := wx.Core.Window.Tab_Traversal) is
  
--    Self_Access : Panel_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(Self,
      wx.Core.Panel.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.int(Style)),
      True);
    
  end New_Panel;
  
  
-- No longer existing
--  function Get_Default_Item(Self : in Panel_Type) return wx.Core.Window.Window_Class is
  
--    Default_Item : System.Address := wx.Core.Panel.C.GetDefaultItem(Get_wxObject(Self));
    
--  begin

--    if Default_Item = System.Null_Address then
    
--      return null;
    
--    end if;
    
    -- We have a pointer so we can create an Ada type of the correct type.
--    return wx.Core.Window.Window_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Default_Item), Default_Item, False));
      
--  end Get_Default_Item;
  
  
  procedure Init_Dialog(Self : in Panel_Type) is
  
  begin
  
    wx.Core.Panel.C.InitDialog(Get_wxObject(Self));
    
  end Init_Dialog;
  
  
--  void OnSysColourChanged(wxSysColourChangedEvent& event)

-- No longer existing
--  procedure Set_Default_Item(Self : in Panel_Type; Window : in wx.Core.Window.Window_Type'Class) is
  
--  begin
  
--    wx.Core.Panel.C.SetDefaultItem(Get_wxObject(Self), wx.Core.Window.Get_wxObject(Window));
    
--  end Set_Default_Item;
  
  
  procedure Set_Focus(Self : in Panel_Type) is
  
  begin
  
    wx.Core.Panel.C.SetFocus(Get_wxObject(Self));
    
  end Set_Focus;
  
  
  procedure Set_Focus_Ignoring_Children(Self : in Panel_Type) is
  
  begin
  
    wx.Core.Panel.C.SetFocusIgnoringChildren(Get_wxObject(Self));
    
  end Set_Focus_Ignoring_Children;
  
  
  -- Private
  
  
  -- Panel_Factory.
  function Panel_Factory return Root_WX_Class is
  
  begin
  
    return new Panel_Type;
  
  end Panel_Factory;
  
begin

  wx.Factory.Add_Factory("wxPanel", Panel_Factory'Access);
  
end wx.Core.Panel;
