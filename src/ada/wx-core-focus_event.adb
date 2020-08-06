-- wx-core-focus_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Focus_Event.C;

use type Interfaces.C.int;
use type System.Address;

package body wx.Core.Focus_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  package Address_To_Window_Class is new System.Address_To_Access_Conversions(wx.Core.Window.Window_Type'Class);
  
  procedure New_Focus_Event(
    Self       : in out Focus_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Focus_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id)),
      True);
    
  end New_Focus_Event;
  
  
  function Get_Window(Self : in Focus_Event_Type) return wx.Core.Window.Window_Class is
  
	Window : System.Address := wx.Core.Focus_Event.C.GetWindow(Get_wxObject(Self));
	
  begin
  
--    return DC_Class(Create_Ada_Type(Get_CPP_Class_Name(DC), DC, False));

    if Window = System.Null_Address then
    
      return null;
    
    end if;
    
    return wx.Core.Window.Create_Ada_Window(Window);
    
  end Get_Window;
  
  
  procedure Set_Window(Self : in Focus_Event_Type; Window : in wx.Core.Window.Window_Class) is
  
  begin
  
    wx.Core.Focus_Event.C.SetWindow(Get_wxObject(Self), Address_To_Window_Class.To_Address(Address_To_Window_Class.Object_Pointer(Window)));
    
  end Set_Window;
  
  
  -- Focus_Event_Factory.
  function Focus_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Focus_Event_Type;
  
  end Focus_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxFocusEvent", Focus_Event_Factory'Access);
  
end wx.Core.Focus_Event;
