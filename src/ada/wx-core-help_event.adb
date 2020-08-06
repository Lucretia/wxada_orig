-- wx-core-help_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Help_Event.C;

use type Interfaces.C.int;
use type System.Address;

package body wx.Core.Help_Event is

  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
--  package Address_To_Window_Class is new System.Address_To_Access_Conversions(Window_Type'Class);
  
  procedure New_Help_Event(
    Self       : in out Help_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type;
    Position   : in wx.Core.Point.Point_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Help_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id), Interfaces.C.int(Position.X), Interfaces.C.int(Position.Y)),
      True);
    
  end New_Help_Event;
  
  
  function Get_Position(Self : in Help_Event_Type) return wx.Core.Point.Point_Type is
  
	X, Y : aliased Interfaces.C.int;
	
  begin
  
    wx.Core.Help_Event.C.GetPosition(
      Get_wxObject(Self),
      Address_To_Object.To_Address(X'Unchecked_Access),
      Address_To_Object.To_Address(Y'Unchecked_Access));
      
    return wx.Core.Point.Point_Type'(wx.Core.Point.Coord_Type(X), wx.Core.Point.Coord_Type(Y));
    
  end Get_Position;
  
  
  procedure Set_Position(Self : in Help_Event_Type; Position : in wx.Core.Point.Point_Type) is
  
  begin
  
    wx.Core.Help_Event.C.SetPosition(Get_wxObject(Self), Interfaces.C.int(Position.X), Interfaces.C.int(Position.Y));
    
  end Set_Position;
  
  
  -- Help_Event_Factory.
  function Help_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Help_Event_Type;
  
  end Help_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxHelpEvent", Help_Event_Factory'Access);
  
end wx.Core.Help_Event;
