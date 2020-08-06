-- wx-core-joystick_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C;
with System.Address_To_Access_Conversions;

use type Interfaces.C.int;

package body wx.Core.Joystick_Event is

  package C renames Interfaces.C;
  package Address_To_Object is new System.Address_To_Access_Conversions(C.int);
  use Address_To_Object;
  
--  function Joystick_To_C_int is new Ada.Unchecked_Conversion(Source => Joystick_Type, Target => C.int);
  
  procedure New_Joystick_Event(
    Self       : in out Joystick_Event_Type;
    Command_Id : in Event_Id_Type;
    State      : in Joystick_Button_State_Type := (others => False);
    Joystick   : in Joystick_Type := Joystick_1;
    Change     : in Joystick_Button_State_Type := (others => False)) is
  
	function wxJoystickEvent_ctor(Command_Id, State, Joystick, Change : in C.int) return System.Address;
	pragma Import(C, wxJoystickEvent_ctor, "wxJoystickEvent_ctor");
	
	type State_Type is mod 2 ** C.int'Size;
	
	Joystick_State, Joystick_Change : State_Type := 0;
	
  begin
  
    -- Determine the states of the joystick buttons.
    for State_Index in State'Range loop
    
      if State(State_Index) = True then
      
        Joystick_State := Joystick_State or State_Type(Joystick_Button_Type'Pos(State_Index));
      
      end if;
      
    end loop;
  
    -- Determine which of the joystick buttons have changed.
    for Change_Index in Change'Range loop
    
      if Change(Change_Index) = True then
      
        Joystick_Change := Joystick_Change or Joystick_Button_Type'Pos(Change_Index);
      
      end if;
      
    end loop;
  
    Set_wxObject(
      Self,
      wxKeyEvent_ctor(C.int(Command_Id), Joystick_State, Joystick_Type'Image(Joystick), Joystick_Change),
      True);
    
  end New_Joystick_Event;
  
  
  function Is_Button_Down_Event(Self : in Joystick_Event_Type; Button : in Joystick_Button_Type := Button_Any) return Boolean is

    function wxJoystickEvent_ButtonDown(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_ButtonDown, "wxJoystickEvent_ButtonDown");
  
  begin
  
    if wxJoystickEvent_ButtonDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Button_Down_Event;
  
  
  function Is_Button_Down(Self : in Joystick_Event_Type; Button : in Joystick_Button_Type := Button_Any) return Boolean is

    function wxJoystickEvent_ButtonIsDown(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_ButtonIsDown, "wxJoystickEvent_ButtonIsDown");
  
  begin
  
    if wxJoystickEvent_ButtonIsDown(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Button_Down;
  
  
  function Is_Button_Up_Event(Self : in Joystick_Event_Type; Button : in Joystick_Button_Type := Button_Any) return Boolean is

    function wxJoystickEvent_ButtonUp(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_ButtonUp, "wxJoystickEvent_ButtonUp");
  
  begin
  
    if wxJoystickEvent_ButtonUp(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Button_Up_Event;
  
  
  function Get_Button_Change(Self : in Joystick_Event_Type) return Joystick_Button_Type is
  
    function wxJoystickEvent_GetButtonChange(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_GetButtonChange, "wxJoystickEvent_GetButtonChange");
  
  begin
  
    return Joystick_Type'Val(wxJoystickEvent_GetButtonChange(Get_wxObject(Self)));
    
  end Get_Button_Change;
  
  
  function Get_Button_State(Self : in Joystick_Event_Type) return Joystick_Button_State_Type is
  
  begin

    return Joystick_Button_State_Type'(others => False);
    
  end Get_Button_State;
  
  
  function Get_Joystick(Self : in Joystick_Event_Type) return Joystick_Type is
  
    function wxJoystickEvent_GetJoystick(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_GetJoystick, "wxJoystickEvent_GetJoystick");
  
  begin
  
    return Joystick_Type'Val(wxJoystickEvent_GetJoystick(Get_wxObject(Self)));
    
  end Get_Joystick;
  
  
  function Get_Position(Self : in Joystick_Event_Type) return Point_Type is
  
    procedure wxJoystickEvent_GetPosition(Self, X, Y : in System.Address);
    pragma Import(C, wxJoystickEvent_GetPosition, "wxJoystickEvent_GetPosition");
  
    X, Y : C.int;
    
  begin
  
    wxJoystickEvent_GetPosition(
      Get_wxObject(Self),
      Address_To_Object.To_Address(X'Access),
      Address_To_Object.To_Address(Y'Access));
      
    return Point_Type(Coord_Type(X), Coord_Type(Y));
    
  end Get_Position;
  
  
  function Get_Z_Position(Self : in Joystick_Event_Type) return Integer is
  
    function wxJoystickEvent_GetZPosition(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_GetZPosition, "wxJoystickEvent_GetZPosition");
  
  begin
  
    return Integer(wxJoystickEvent_GetZPosition(Get_wxObject(Self)));
    
  end Get_Z_Position;
  
  
  function Is_Button(Self : in Joystick_Event_Type) return Boolean is
  
    function wxJoystickEvent_IsButton(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_IsButton, "wxJoystickEvent_IsButton");
  
  begin
  
    if wxJoystickEvent_IsButton(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Button;
  
  
  function Is_Move(Self : in Joystick_Event_Type) return Boolean is
  
    function wxJoystickEvent_IsMove(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_IsMove, "wxJoystickEvent_IsMove");
  
  begin
  
    if wxJoystickEvent_IsMove(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Move;
  
  
  function Is_Z_Move(Self : in Joystick_Event_Type) return Boolean is
  
    function wxJoystickEvent_IsZMove(Self : in System.Address) return C.int;
    pragma Import(C, wxJoystickEvent_IsZMove, "wxJoystickEvent_IsZMove");
  
  begin
  
    if wxJoystickEvent_IsZMove(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Z_Move;
  
  
  -- Joystick_Event_Factory.
  function Joystick_Event_Factory return Factory_Class is
  
  begin
  
    return new Joystick_Event_Type;
  
  end Joystick_Event_Factory;
  
begin

  Add_Factory("wxJoystickEvent", Joystick_Event_Factory'Access);
  
end wx.Core.Joystick_Event;
