-- wx-base-event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- Notes:
-- + Use child packages for the different types of events, i.e. command, menu, etc. Or associate them with the type that generates them.
with Interfaces.C;
with wx.Base.Object;
with wx.Base.Id;

use type Interfaces.C.int;

package wx.Base.Event is

  -- This is the actual type (wxEvent) we are creating here.
  type Event_Type is new wx.Base.Object.Object_Type with private;
--  type Event_Access is access all Event_Type;
--  type Event_View is access constant Event_Type;
  type Event_Class is access all Event_Type'Class;

  -- Also, wxEventType (also known as WXTYPE) should be a new integer based type, all the event codes can then be mapped as constants onto this type.
  type Event_Id_Type is range Integer'First .. Integer'Last;
  
  Evt_Null       : constant Event_Id_Type := 0;
  Evt_First      : constant Event_Id_Type := 10000;
  Evt_User_First : constant Event_Id_Type := Evt_First + 2000;
  
  -- Propagation_state
  type Propagation_State_Type is range 0 .. Interfaces.C.int'Last;
  
  Event_Propagate_None : constant Propagation_State_Type := Propagation_State_Type'First;
  Event_Propagate_Max  : constant Propagation_State_Type := Propagation_State_Type'Last;
  
  function New_Event_Id return Event_Id_Type;
  
  procedure New_Event(Self : in out Event_Type; Id : in wx.Base.Id.Id_Type; Event_Id : in Event_Id_Type);
  
  -- N.B: There is no Clone primitive as this is a limited type! Only on the C++ side do the events get cloned!
  -- TODO: How can the [SG]et_Event_Object primitives be implemented?
  
  function Get_Event_Object(Self : in Event_Type) return wx.Base.Object.Object_Class;
  function Get_Event_Type(Self : in Event_Type) return Event_Id_Type;
  function Get_Id(Self : in Event_Type) return wx.Base.Id.Id_Type;
  function Get_Skipped(Self : in Event_Type) return Boolean;
  function Get_Time_Stamp(Self : in Event_Type) return Long_Integer;
  function Get_Propagation_State(Self : in Event_Type) return Propagation_State_Type;
  function Is_Command_Event(Self : in Event_Type) return Boolean;
  procedure Resume_Propagation(Self : in Event_Type; Propagation_Level : in Propagation_State_Type);
  procedure Set_Event_Object(Self : in out Event_Type; Object : in wx.Base.Object.Object_Class);
  procedure Set_Event_Type(Self : in Event_Type; Event_Id : in Event_Id_Type);
  procedure Set_Id(Self : in Event_Type; Id : in wx.Base.Id.Id_Type);
  procedure Set_Time_Stamp(Self : in Event_Type; Time_Stamp : in Long_Integer);
  function Should_Propagate(Self : in Event_Type) return Boolean;
  procedure Skip(Self : in Event_Type; Skip : in Boolean);
  function Stop_Propagation(Self : in Event_Type) return Propagation_State_Type;
  
private

  type Event_Type is new wx.Base.Object.Object_Type with
    record
      Ada_Event_Object : wx.Base.Object.Object_Class := null;
    end record;
  
--  procedure Finalize(Self : in out Event_Type);
  
end wx.Base.Event;
