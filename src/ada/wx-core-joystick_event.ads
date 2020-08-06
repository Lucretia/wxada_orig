-- wx-core-joystick_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Core.Keyboard;
with wx.Core.Point;
with wx.Core.Joystick;

package wx.Core.Joystick_Event is

  -- This is the actual type (wxJoystickEvent) we are creating here.
  type Joystick_Event_Type is new Event_Type with private;
--  type Joystick_Event_Access is access all Joystick_Event_Type;
--  type Joystick_Event_View is access constant Joystick_Event_Type;
  type Joystick_Event_Class is access all Joystick_Event_Type'Class;
  
  type Joystick_Button_State_Type is array (1 .. 4) of Boolean;

  -- Events.
  Evt_Joystick_Button_Down : constant Event_Id_Type;
  Evt_Joystick_Button_Up   : constant Event_Id_Type;
  Evt_Joystick_Move        : constant Event_Id_Type;
  Evt_Joystick_Z_Move      : constant Event_Id_Type;
  
  procedure New_Joystick_Event(
    Self       : in out Joystick_Event_Type;
    Command_Id : in Event_Id_Type;
    State      : in Joystick_Button_State_Type := (others => False);
    Joystick   : in Joystick_Type := Joystick_1;
    Change     : in Joystick_Button_State_Type := (others => False));
    
  function Is_Button_Down_Event(Self : in Joystick_Event_Type; Button : in Joystick_Button_Type := Button_Any) return Boolean;
  function Is_Button_Down(Self : in Joystick_Event_Type; Button : in Joystick_Button_Type := Button_Any) return Boolean;
  function Is_Button_Up_Event(Self : in Joystick_Event_Type; Button : in Joystick_Button_Type := Button_Any) return Boolean;
  function Get_Button_Change(Self : in Joystick_Event_Type) return Joystick_Button_Type;
  function Get_Button_State(Self : in Joystick_Event_Type) return Joystick_Button_State_Type;
  function Get_Joystick(Self : in Joystick_Event_Type) return Joystick_Type;
  function Get_Position(Self : in Joystick_Event_Type) return Point_Type;
  function Get_Z_Position(Self : in Joystick_Event_Type) return Integer;
  function Is_Button(Self : in Joystick_Event_Type) return Boolean;
  function Is_Move(Self : in Joystick_Event_Type) return Boolean;
  function Is_Z_Move(Self : in Joystick_Event_Type) return Boolean;
  
  type Joystick_Event_Function is access procedure(Self : access Event_Handler_Type'Class; Event : in out Joystick_Event_Type);
  
private

  type Joystick_Event_Type is new Event_Type with null record;
  
  pragma Import(C, Evt_Joystick_Button_Down, "wxEVT_JOY_BUTTON_DOWN");
  pragma Import(C, Evt_Joystick_Button_Up, "wxEVT_JOY_BUTTON_UP");
  pragma Import(C, Evt_Joystick_Move, "wxEVT_JOY_MOVE");
  pragma Import(C, Evt_Joystick_Z_Move, "wxEVT_JOY_ZMOVE");
  
end wx.Core.Joystick_Event;
