-- wx-core-key_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Key_Event.C;

use type Interfaces.C.int;

package body wx.Core.Key_Event is

  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
  
  function C_int_To_Key_Code is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => wx.Core.Keyboard.Key_Code_Type);
  
  procedure New_Key_Event(Self : in out Key_Event_Type; Command_Id : in wx.Base.Event.Event_Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Key_Event.C.ctor(Interfaces.C.int(Command_Id)),
      True);
    
  end New_Key_Event;
  
  
  function Alt_Down(Self : in Key_Event_Type) return Boolean is

  begin
  
    if wx.Core.Key_Event.C.AltDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Alt_Down;
  
  
  function Command_Down(Self : in Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Key_Event.C.CmdDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Command_Down;
  
  
  function Control_Down(Self : in Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Key_Event.C.ControlDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Control_Down;
  
  
  function Get_Key_Code(Self : in Key_Event_Type) return wx.Core.Keyboard.Key_Code_Type is
  
  begin
  
    return C_int_To_Key_Code(wx.Core.Key_Event.C.GetKeyCode(Get_wxObject(Self)));
    
  end Get_Key_Code;
  
  
  function Get_Position(Self : in Key_Event_Type) return wx.Core.Point.Point_Type is
  
    X, Y : aliased Interfaces.C.int;
  
  begin
  
    wx.Core.Key_Event.C.GetPosition(
      Get_wxObject(Self),
      Address_To_Object.To_Address(X'Unchecked_Access),
      Address_To_Object.To_Address(Y'Unchecked_Access));
      
    return wx.Core.Point.Point_Type'(wx.Core.Point.Coord_Type(X), wx.Core.Point.Coord_Type(Y));
    
  end Get_Position;
  
  
--  function Get_Raw_Key_Code(Self : in Key_Event_Type) return Key_Code_Type;
--  function Get_Key_Flags(Self : in Key_Event_Type) return Key_Code_Type;
--  function Get_Unicode_Key(Self : in Key_Event_Type) return Key_Code_Type;

  function Get_X(Self : in Key_Event_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return wx.Core.Point.Coord_Type(wx.Core.Key_Event.C.GetX(Get_wxObject(Self)));
    
  end Get_X;
  
  
  function Get_Y(Self : in Key_Event_Type) return wx.Core.Point.Coord_Type is
  
  begin
  
    return wx.Core.Point.Coord_Type(wx.Core.Key_Event.C.GetY(Get_wxObject(Self)));
    
  end Get_Y;
  
  
  function Has_Modifiers(Self : in Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Key_Event.C.HasModifiers(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Has_Modifiers;
  
  
  function Meta_Down(Self : in Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Key_Event.C.MetaDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Meta_Down;
  
  
  function Shift_Down(Self : in Key_Event_Type) return Boolean is
  
  begin
  
    if wx.Core.Key_Event.C.ShiftDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Shift_Down;


  -- Key_Event_Factory.
  function Key_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Key_Event_Type;
  
  end Key_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxKeyEvent", Key_Event_Factory'Access);
  
end wx.Core.Key_Event;
