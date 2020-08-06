-- wx-base-event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Debug;
with wx.Factory;
with wx.Instance_Store;
with wx.Base.Event.C;
with wx.Base.Object;

use type wx.VoidPtr;
use type wx.Base.Object.Object_Class;

package body wx.Base.Event is

  function New_Event_Id return Event_Id_Type is
  
  begin
  
    return Event_Id_Type(wx.Base.Event.C.NewEventType);
    
  end New_Event_Id;
  
  
  procedure New_Event(Self : in out Event_Type; Id : in wx.Base.Id.Id_Type; Event_Id : in Event_Id_Type) is
  
    CPP_Instance : System.Address := wx.Base.Event.C.ctor(Interfaces.C.int(Id), Interfaces.C.int(Event_Id));
    
  begin
  
    wx.Debug.Put_Line("[wx.Base.Event.New_Event] Enter");
    
    -- Set the Ada type to contain the pointer to the C++ instance.
    Set_wxObject(Self, CPP_Instance, True);
    
    -- Now map the Ada event type's address onto the C++ instance pointer. This is how the event handler knows how to get hold of the
    -- Ada class wide type to pass to the callback.
    wx.Instance_Store.Add(CPP_Instance, Self'Unchecked_Access);
    
    wx.Debug.Put_Line("[wx.Base.Event.New_Event] Exit");
    
  end New_Event;
  

  function Get_Event_Object(Self : in Event_Type) return wx.Base.Object.Object_Class is
  
  begin
  
    if Self.Ada_Event_Object = null then
    
      -- This is an Ada derived event.
      return Self.Ada_Event_Object;
    
    end if;
    
    -- Otherwise, this is a C++ derived event, so we need to create a new Ada type for it. Make sure the Ada type doesn't own the C++ pointer!
    declare
    
      -- We need to get hold of the C++ pointer actually stored within the wxEvent instance.
      Internal_Object : System.Address := wx.Base.Event.C.GetEventObject(Get_wxObject(Self));
    
    begin
    
      -- Create and return a new Ada type!
--      return Create_Ada_Type(Get_CPP_Class_Name(Internal_Object), Internal_Object, False);
      return wx.Base.Object.Object_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Internal_Object), Internal_Object, False));
      
    end;
    
  end Get_Event_Object;


  function Get_Event_Type(Self : in Event_Type) return Event_Id_Type is
  
  begin
  
    return Event_Id_Type(wx.Base.Event.C.GetEventType(Get_wxObject(Self)));
    
  end Get_Event_Type;
  
  
  function Get_Id(Self : in Event_Type) return wx.Base.Id.Id_Type is
  
  begin
  
    return wx.Base.Id.Id_Type(wx.Base.Event.C.GetId(Get_wxObject(Self)));
    
  end Get_Id;
  
  
  function Get_Skipped(Self : in Event_Type) return Boolean is
  
  begin
  
    if wx.Base.Event.C.GetSkipped(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Get_Skipped;
  
  
  function Get_Time_Stamp(Self : in Event_Type) return Long_Integer is
  
  begin
  
    return Long_Integer(wx.Base.Event.C.GetTimestamp(Get_wxObject(Self)));
    
  end Get_Time_Stamp;
  
  
  -- Get_Propagation_State
  --
  -- A new function which replaces access to the global m_propagationLevel.
  function Get_Propagation_State(Self : in Event_Type) return Propagation_State_Type is
  
  begin
  
    return Propagation_State_Type(wx.Base.Event.C.GetPropagationState(Get_wxObject(Self)));
    
  end Get_Propagation_State;
  
  
  function Is_Command_Event(Self : in Event_Type) return Boolean is
  
  begin
  
    if wx.Base.Event.C.IsCommandEvent(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Command_Event;
  
  
  procedure Resume_Propagation(Self : in Event_Type; Propagation_Level : in Propagation_State_Type) is
  
  begin
  
    wx.Base.Event.C.ResumePropagation(Get_wxObject(Self), Interfaces.C.int(Propagation_Level));
    
  end Resume_Propagation;
  
  
  procedure Set_Event_Object(Self : in out Event_Type; Object : in wx.Base.Object.Object_Class) is
  
  begin
  
    Self.Ada_Event_Object := Object;
    
  end Set_Event_Object;


  procedure Set_Event_Type(Self : in Event_Type; Event_Id : in Event_Id_Type) is
  
  begin
  
    wx.Base.Event.C.SetEventType(Get_wxObject(Self), Interfaces.C.int(Event_Id));
    
  end Set_Event_Type;
  
  
  procedure Set_Id(Self : in Event_Type; Id : in wx.Base.Id.Id_Type) is
  
  begin
  
    wx.Base.Event.C.SetId(Get_wxObject(Self), Interfaces.C.int(Id));

  end Set_Id;
  
  
  procedure Set_Time_Stamp(Self : in Event_Type; Time_Stamp : in Long_Integer) is
  
  begin
  
    wx.Base.Event.C.SetTimestamp(Get_wxObject(Self), Interfaces.C.long(Time_Stamp));
    
  end Set_Time_Stamp;
  
  
  function Should_Propagate(Self : in Event_Type) return Boolean is
  
  begin
  
    if wx.Base.Event.C.ShouldPropagate(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Should_Propagate;
  
  
  procedure Skip(Self : in Event_Type; Skip : in Boolean) is
  
	Skip_Value : Interfaces.C.int;
	
  begin
  
    if Skip = True then
    
      Skip_Value := 1;
    
    else
    
      Skip_Value := 0;
      
    end if;
  
    wx.Base.Event.C.Skip(Get_wxObject(Self), Skip_Value);
    
  end Skip;
  
  
  function Stop_Propagation(Self : in Event_Type) return Propagation_State_Type is
  
  begin
  
    return Propagation_State_Type(wx.Base.Event.C.StopPropagation(Get_wxObject(Self)));
    
  end Stop_Propagation;
  
  
  -- Finalize
--  procedure Finalize(Self : in out Event_Type) is
  
--    procedure dtor(Self : in wxObject_Access);
--    pragma Import(C, dtor, "dtor");
  
--  begin
  
--    if Get_wxObject(Self) /= Null_wxObject then
    
--      Put_Line("[wx.Base.Event.Finalize] Non-null event!");
--      if Is_wxObject_Owner(Self) = True then
    
--        dtor(Get_wxObject(Self));
      
--      end if;
--      Put_Line("[wx.Base.Event.Finalize] Not crashed then!");
      
--      Set_wxObject(Self, Null_wxObject, False);
    
--    end if;
    
--  end Finalize;


  -- ********************************************************** PRIVATE **********************************************************
  
  -- Construct_Ada_Event
  --
  -- This is a totally private function and should never be called from Ada code. It is called from the C event handling system to
  -- construct an Ada event object, which contains a copy of the C++ wxEvent data.
--  function Construct_Ada_Event(CXX_Object : in wxObject.wxCXX_Object) return Object is
  
--    Ada_Event : Object;
    
--  begin
  
--    Ada_Event.CXX_Object := CXX_Object;
    
--    return Ada_Event;
    
--  end Construct_Ada_Event;
  
--  pragma Export(C, Construct_Ada_Event, "ConstructAdaEvent");
  

  -- Event_Factory.
  function Event_Factory return Root_WX_Class is
  
  begin
  
    return new Event_Type;
  
  end Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxEvent", Event_Factory'Access);
  
end wx.Base.Event;
