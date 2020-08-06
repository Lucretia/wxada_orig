-- wx-core-menu_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Menu_Event.C;

use type Interfaces.C.int;

package body wx.Core.Menu_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  procedure New_Menu_Event(
    Self       : in out Menu_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type;
    Menu       : in wx.Core.Menu.Menu_Class) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Menu_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id), wx.Core.Menu.Get_wxObject(Menu.all)),
      True);
    
  end New_Menu_Event;
  
  
  function Get_Menu(Self : in Menu_Event_Type) return wx.Core.Menu.Menu_Class is
  
  begin
  
    -- TODO: Fix me!
    return null;
    
  end Get_Menu;
  
  
  function Get_Menu_Id(Self : in Menu_Event_Type) return wx.Base.Id.Id_Type is
  
  begin
  
    return wx.Base.Id.Id_Type(wx.Core.Menu_Event.C.GetMenuId(Get_wxObject(Self)));
    
  end Get_Menu_Id;
  
  
  function Is_Popup(Self : in Menu_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Menu_Event.C.IsPopup(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Popup;
  
  
  -- Menu_Event_Factory.
  function Menu_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Menu_Event_Type;
  
  end Menu_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxMenuEvent", Menu_Event_Factory'Access);
  
end wx.Core.Menu_Event;
