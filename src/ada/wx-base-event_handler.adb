-- wx-base-event_handler.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- Notes:
--   Do we setup an event handler function here and 
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;
with Ada.Tags;
with System;
with System.Address_Image;
with System.Address_To_Access_Conversions;
with Interfaces.C;
with wx.Debug;
with wx.Instance_Store;
with wx.Factory;
with wx.Base.Command_Event;
with wx.Base.Event_Handler.C;

use type Interfaces.C.int;
use type wx.VoidPtr;
use type System.Address;

package body wx.Base.Event_Handler is

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
  package Address_To_Event_Handler_Access is new System.Address_To_Access_Conversions(Event_Handler_Type);
  package Address_To_Event_Handler_Class is new System.Address_To_Access_Conversions(Event_Handler_Type'Class);
  

  procedure New_Event_Handler(Self : in out Event_Handler_Type) is
  
--    procedure SetAdaObject(Self, AdaObject : in System.Address);
--    pragma Import(C, SetAdaObject, "wxEvtHandler_SetAdaObject");
	
    --Self_Class   : Address_To_Event_Handler_Class.Object_Pointer := Self'Unchecked_Access;
    CPP_Instance : System.Address                                := wx.Base.Event_Handler.C.ctor;
    --CPP_Instance : System.Address                                := C.ctor;
    
  begin
  
    Set_wxObject(Self, CPP_Instance, True);
    
--    SetAdaObject(Get_wxObject(Self), Address_To_Event_Handler_Class.To_Address(Self_Class));
    
    wx.Instance_Store.Add(CPP_Instance, Self'Unchecked_Access);
    
  end New_Event_Handler;


  -- AddPendingEvent
  procedure Add_Pending_Event(Self : in out Event_Handler_Type; Event : in wx.Base.Event.Event_Type) is
  
  begin
  
    wx.Debug.Put_Line("Add_Pending_Event");
    
    wx.Base.Event_Handler.C.AddPendingEvent(Get_wxObject(Self), wx.Base.Event.Get_wxObject(Event));
  
  end Add_Pending_Event;
  
  
  procedure Connect(
    Self      : in Event_Handler_Type'Class;
    Id,
    LastId    : in wx.Base.Id.Id_Type;
    EventType : in wx.Base.Event.Event_Id_Type;
    Callback  : in Connect_Callback_Type) is
  
    type Event_Handler_Constant_Class is access constant Event_Handler_Type'Class;
    
    function Connect_Callback_Type_To_VoidPtr is new Ada.Unchecked_Conversion(
      Source => Connect_Callback_Type,
      Target => VoidPtr);

    -- We need this "hack" to force the compiler to stop bitching about constant pointers!
    function To_Non_Constant is new Ada.Unchecked_Conversion(
      Source => Event_Handler_Constant_Class,
      Target => Address_To_Event_Handler_Class.Object_Pointer);
    
    -- Get the access type here so we don't have to do it in user code, much nicer.
    Self_Constant : Event_Handler_Constant_Class := Self'Access;
    
  begin
  
    wx.Debug.Put_Line("[wx.Base.EvtHandler.Connect] EventType: " & wx.Base.Event.Event_Id_Type'Image(EventType));
    
    -- We pass the Class-wide type of Self, this is so the event handler callback can pass the correct tagged type as the first parameter,
    -- causing the correct dispatching to occur.
    wx.Base.Event_Handler.C.Connect(
      Get_wxObject(Self),
      Interfaces.C.int(Id),
      Interfaces.C.int(LastId),
      Interfaces.C.int(EventType),
      Address_To_Event_Handler_Class.To_Address(To_Non_Constant(Self_Constant)),
      Connect_Callback_Type_To_VoidPtr(Callback));
      
  end Connect;
  
  
  -- Disconnect
  function Disconnect(Self : in Event_Handler_Type; Id, LastId : in wx.Base.Id.Id_Type; EventType : in wx.Base.Event.Event_Id_Type) return Boolean is
  
  begin
  
    if wx.Base.Event_Handler.C.Disconnect(Get_wxObject(Self), Interfaces.C.int(Id), Interfaces.C.int(LastId), Interfaces.C.int(EventType)) = 0 then
    
      return False;
    
    end if;
    
    return True;
    
  end Disconnect;


  -- Disconnect
  function Disconnect(Self : in Event_Handler_Type; Id : in wx.Base.Id.Id_Type; EventType : in wx.Base.Event.Event_Id_Type) return Boolean is
  
  begin

    return Disconnect(Self, Id, wx.Base.Id.Id_Any, EventType);
    
  end Disconnect;

  
--    void *GetClientData(wxEvtHandler *Self)
--    wxClientData *GetClientObject(wxEvtHandler *Self)


  -- GetEvtHandlerEnabled
  function Is_Enabled(Self : in Event_Handler_Type) return Boolean is

  begin
  
    if wx.Base.Event_Handler.C.GetEvtHandlerEnabled(Get_wxObject(Self)) = 0 then
    
      return False;
    
    end if;
    
    return True;
    
  end Is_Enabled;
  
  
  -- Get_Next_Handler
  function Get_Next_Handler(Self : in Event_Handler_Type) return Event_Handler_Class is
  
    Next_Handler_Pointer : System.Address := wx.Base.Event_Handler.C.GetNextHandler(Get_wxObject(Self));
    
  begin
  
    if Next_Handler_Pointer = System.Null_Address then
    
      return null;
    
    end if;

    return Event_Handler_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Next_Handler_Pointer), Next_Handler_Pointer, False));
    
  end Get_Next_Handler;
  
  
  -- Get_Previous_Handler
  function Get_Previous_Handler(Self : in Event_Handler_Type) return Event_Handler_Class is
  
    Previous_Handler_Pointer : System.Address := wx.Base.Event_Handler.C.GetPreviousHandler(Get_wxObject(Self));
    
  begin
  
    if Previous_Handler_Pointer = System.Null_Address then
    
      return null;
    
    end if;
    
    return Event_Handler_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Previous_Handler_Pointer), Previous_Handler_Pointer, False));
        
  end Get_Previous_Handler;
  
  
--    bool SearchEventTable(wxEvtHandler *Self, wxEventTable *Table, wxEvent *Event)
--    void SetClientData(wxEvtHandler *Self, void *Data)
--    void SetClientObject(wxEvtHandler *Self, wxClientData *Data)


  -- SetEvtHandlerEnabled
  procedure Enable(Self : in out Event_Handler_Type; Enabled : in Boolean) is
  
    Enabled_Converted : Interfaces.C.int := 1;
  
  begin
  
    if Enabled = False then
    
      Enabled_Converted := 0;
    
    end if;

    wx.Base.Event_Handler.C.SetEvtHandlerEnabled(Get_wxObject(Self), Enabled_Converted);
    
  end Enable;
  
  
  procedure Set_Next_Handler(Self : in out Event_Handler_Type; Handler : in Event_Handler_Class) is
  
  begin
  
    wx.Base.Event_Handler.C.SetNextHandler(Get_wxObject(Self), Get_wxObject(Handler.all));
    
  end Set_Next_Handler;
  
  
  procedure Set_Previous_Handler(Self : in out Event_Handler_Type; Handler : in Event_Handler_Class) is
  
  begin
  
    wx.Base.Event_Handler.C.SetPreviousHandler(Get_wxObject(Self), Get_wxObject(Handler.all));
    
  end Set_Previous_Handler;

  
  -- Finalize
  procedure Finalize(Self : in out Event_Handler_Type) is
  
    Self_Class : Event_Handler_Class := Self'Unchecked_Access;
    
  begin
  
    wx.Debug.Put_Line("[wx.Base.Event_Handler.Finalize] Tag: " & Ada.Tags.Expanded_Name(Self_Class'Tag));
    
    if Is_wxObject_Owner(Self) = True then
    
      wx.Debug.Put_Line("[wx.Base.Event_Handler.Finalize] It is the owner!! Tag: " & Ada.Tags.Expanded_Name(Self_Class'Tag));
    
      wx.Base.Event_Handler.C.dtor(Get_wxObject(Self));
    
      Set_wxObject(Self, System.Null_Address, False);
    
    end if;
    
  end Finalize;
  

  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.
  
  
  -- ProcessEvent
  function Process_Event(Self : in Event_Handler_Type; Event : in wx.Base.Event.Event_Type) return Boolean is
  
  begin
  
    wx.Debug.Put_Line("[wx.Base.Event_Handler.Process_Event]");
    
    if wx.Base.Event_Handler.C.ProcessEvent(Get_wxObject(Self), wx.Base.Event.Get_wxObject(Event)) = 0 then
    
      return False;
    
    end if;
    
    return True;
    
  end Process_Event;
  
  
  -- END
  
  
  type Event_Access is access all wx.Base.Event.Event_Type;
        
  function Create_Ada_Event(Event : in System.Address; CXX_Class_Name : in String) return wx.Base.Event.Event_Class is
  
  begin
  
    if CXX_Class_Name = "wxAdaEvent" then
    
      wx.Debug.Put_Line("Trying to do something with an Ada derived event!");
    
      -- We are trying to process an Ada derived event. We can get the Ada event back from the C++ wxAdaEvent instance and pass it onto the callback.
      declare
      
        --function wxEvent_GetAdaEvent(Self : in System.Address) return System.Address;
        --pragma Import(C, wxEvent_GetAdaEvent, "wxEvent_GetAdaEvent");
	
        --package Address_To_Event_Access is new System.Address_To_Access_Conversions(Event_Type);
        --function Pointer_To_Event_Access is new Ada.Unchecked_Conversion(Source => Address_To_Event_Access.Object_Pointer, Target => Event_Access);
        
        --Ada_Event : Event_Class := Pointer_To_Event_Access(Address_To_Event_Access.To_Pointer(wxEvent_GetAdaEvent(Event))).all'Access;
      
      begin
      
        --Text_IO.Put_Line("[Ada_Event_Handler] Ada_Event.all : " & System.Address_Image(Get_wxObject(Ada_Event.all)));
        
        --return Ada_Event;
        --return Event_Class(CPP_To_Ada_Map.Find(Event));
        return wx.Base.Event.Event_Class(wx.Instance_Store.Find(Event));
        
      end;
    
    end if;
    
    wx.Debug.Put_Line("A " & CXX_Class_Name & " has been triggered, creating an Ada type for this!");
    
    -- Create an Ada event and pass it onto the callback.
    declare
      
      Proxy_Event : wx.Base.Event.Event_Class := wx.Base.Event.Event_Class(wx.Factory.Create_Ada_Type(CXX_Class_Name, Event, False));
      
    begin
      
      wx.Debug.Put_Line("[Ada_Event_Handler] Proxy_Event : " & System.Address_Image(wx.Base.Event.Get_wxObject(Proxy_Event.all)));
        
      -- The event class needs to be cast so that it compiles properly!
      return Proxy_Event;
        
    end;
    
  end Create_Ada_Event;
  
  
  -- Ada_Event_Handler
  --
  -- This is the entry point that all events go through to get back to the Ada side.
  --
  -- TODO: The pointer to 'Class of the Ada event handler type
  procedure Ada_Event_Handler(
    Parent     : Event_Handler_Class;
    Callback   : in Event_Function;
    Event      : in System.Address;
    Class_Name : in Interfaces.C.Strings.chars_ptr) is
  
    CXX_Class_Name : String                    := Interfaces.C.To_Ada(Interfaces.C.Strings.Value(Class_Name));
    Ada_Event      : wx.Base.Event.Event_Class := null;
    
    type Event_Access is access all wx.Base.Event.Event_Type;
    
    procedure Free is new Ada.Unchecked_Deallocation(
      Object => wx.Base.Event.Event_Type,
      Name   => Event_Access);
      
    function To_Access is new Ada.Unchecked_Conversion(
      Source => wx.Base.Event.Event_Class,
      Target => Event_Access);
    
    Ada_Event_Acccess : Event_Access := null;
    
  begin
  
    wx.Debug.Put_Line("Ada_Event_Handler: " & CXX_Class_Name);
    
    Ada_Event := Create_Ada_Event(Event, CXX_Class_Name);
    
    Callback(Parent, wx.Base.Event.Event_Type(Ada_Event.all));
    
    if CXX_Class_Name /= "wxAdaEvent" then
    
      -- The next line would work, if it didn't get called again on exit of the app!
      --Finalize(Ada_Event.all);
      
      Ada_Event_Acccess := To_Access(Ada_Event);
      
      Free(Ada_Event_Acccess);
      
    end if;
    
    return;
    
  end Ada_Event_Handler;
  
  
  -- START - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  
  
  function Ada_Event_Handler_Process_Event(Self, Event : in System.Address) return Interfaces.C.int is
  
    Ada_Event_Handler : Event_Handler_Class       := Event_Handler_Class(Address_To_Event_Handler_Class.To_Pointer(Self));
    Ada_Event         : wx.Base.Event.Event_Class := Create_Ada_Event(Event, Get_CPP_Class_Name(Event));
    
  begin
  
    wx.Debug.Put_Line("[Ada_Event_Handler_Process_Event]");
    
    if Process_Event(Ada_Event_Handler.all, wx.Base.Event.Event_Type(Ada_Event.all)) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Event_Handler_Process_Event;
  

  -- END
  
  
  -- Event_Handler_Factory.
  function Event_Handler_Factory return Root_WX_Class is
  
  begin
  
    return new Event_Handler_Type;
  
  end Event_Handler_Factory;

begin

  wx.Factory.Add_Factory("wxEvtHandler", Event_Handler_Factory'Access);

end wx.Base.Event_Handler;
