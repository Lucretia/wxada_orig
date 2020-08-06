-- wx-core-navigation_key_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Keyboard;
with wx.Core.Navigation_Key_Event.C;

use type Interfaces.C.int;

package body wx.Core.Navigation_Key_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  function C_int_To_Key_Code is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => wx.Core.Keyboard.Key_Code_Type);
  
  procedure New_Navigation_Key_Event(Self : in out Navigation_Key_Event_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Navigation_Key_Event.C.ctor,
      True);
    
  end New_Navigation_Key_Event;
  
  
  function Is_Forward(Self : in Navigation_Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Navigation_Key_Event.C.GetDirection(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Forward;
  
  
  procedure Set_Forward(Self : in out Navigation_Key_Event_Type; Forward : in Boolean) is
  
    Forward_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Forward = True then
    
      Forward_Converted := 1;
    
    end if;
  
    wx.Core.Navigation_Key_Event.C.SetDirection(Get_wxObject(Self), Forward_Converted);
    
  end Set_Forward;
  
    
  function Is_Window_Change(Self : in Navigation_Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Navigation_Key_Event.C.IsWindowChange(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Window_Change;
  
  
  procedure Set_Window_Change(Self : in out Navigation_Key_Event_Type; Window_Change : in Boolean) is
  
    Window_Change_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Window_Change = True then
    
      Window_Change_Converted := 1;
    
    end if;
  
    wx.Core.Navigation_Key_Event.C.SetWindowChange(Get_wxObject(Self), Window_Change_Converted);
    
  end Set_Window_Change;
  
  
  function Is_From_Tab(Self : in Navigation_Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Navigation_Key_Event.C.IsFromTab(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_From_Tab;
  
  
  procedure Set_From_Tab(Self : in Navigation_Key_Event_Type; From_Tab : in Boolean) is
  
    From_Tab_Converted : Interfaces.C.int := 0;
    
  begin
  
    if From_Tab = True then
    
      From_Tab_Converted := 1;
    
    end if;
  
    wx.Core.Navigation_Key_Event.C.SetFromTab(Get_wxObject(Self), From_Tab_Converted);
    
  end Set_From_Tab;
  
  
  function Get_Current_Focus(Self : in Navigation_Key_Event_Type) return wx.Core.Window.Window_Class is
  
  begin
  
    return null;
    
  end Get_Current_Focus;
  
  
  procedure Set_Current_Focus(Self : in out Navigation_Key_Event_Type; Focus : in wx.Core.Window.Window_Class) is
  
  begin
  
    null;
    
  end Set_Current_Focus;
  
  
  procedure Set_Flags(Self : in out Navigation_Key_Event_Type; Flags : in Flags_Type) is
  
  begin
  
    wx.Core.Navigation_Key_Event.C.SetFlags(Get_wxObject(Self), Interfaces.C.int(Flags));
    
  end Set_Flags;
  

  -- Navigation_Key_Event_Factory.
  function Navigation_Key_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Navigation_Key_Event_Type;
  
  end Navigation_Key_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxNavigationKeyEvent", Navigation_Key_Event_Factory'Access);
  
end wx.Core.Navigation_Key_Event;
