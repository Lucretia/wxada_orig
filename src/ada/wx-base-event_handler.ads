-- wx-base-event_handler.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with wx.Base.Id;
with wx.Base.Object;
with wx.Base.Event;
--with wx.Base.Command_Event; use wx.Base.Command_Event;

package wx.Base.Event_Handler is

  -- This is the actual type (wxEvtHandler) we are creating here.
  type Event_Handler_Type is new wx.Base.Object.Object_Type with private;
  type Event_Handler_Class is access all Event_Handler_Type'Class;
  
  procedure New_Event_Handler(Self : in out Event_Handler_Type);
  
  procedure Add_Pending_Event(Self : in out Event_Handler_Type; Event : in wx.Base.Event.Event_Type);
  
  -- The Connect procedure needs to be a generic, so that the Callback can be passed properly. It can be a number of different types.
  -- TODO: Add the other parameters if needed for wxAda.
  --       Add different variations of the Connect generic (easier) or default the parameters (possibly) to allow the variations of use.
  generic
    type Connect_Callback_Type is private;
  procedure Connect(
    Self      : in Event_Handler_Type'Class;
    Id,
    LastId    : in wx.Base.Id.Id_Type;
    EventType : in wx.Base.Event.Event_Id_Type;
    Callback  : in Connect_Callback_Type);
    
  function Disconnect(Self : in Event_Handler_Type; Id, LastId : in wx.Base.Id.Id_Type; EventType : in wx.Base.Event.Event_Id_Type) return Boolean;
  function Disconnect(Self : in Event_Handler_Type; Id : in wx.Base.Id.Id_Type; EventType : in wx.Base.Event.Event_Id_Type) return Boolean;
    
--  function GetClientData(Self : in out Event_Handler_Type) return void *;
--  function GetClientObject(Self : in out Event_Handler_Type) return wxClientData *;
  function Is_Enabled(Self : in Event_Handler_Type) return Boolean;
  function Get_Next_Handler(Self : in Event_Handler_Type) return Event_Handler_Class;
  function Get_Previous_Handler(Self : in Event_Handler_Type) return Event_Handler_Class;
--  function SearchEventTable(Self : in out Event_Handler_Type; wxEventTable *Table, wxEvent *Event) return Boolean;
--  procedure SetClientData(Self : in out Event_Handler_Type; void *Data);
--  procedure SetClientObject(Self : in out Event_Handler_Type; wxClientData *Data);
  procedure Enable(Self : in out Event_Handler_Type; Enabled : in Boolean);
  procedure Set_Next_Handler(Self : in out Event_Handler_Type; Handler : in Event_Handler_Class);
  procedure Set_Previous_Handler(Self : in out Event_Handler_Type; Handler : in Event_Handler_Class);

  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.
  function Process_Event(Self : in Event_Handler_Type; Event : in wx.Base.Event.Event_Type) return Boolean;
  -- END - These primitive operations are the Ada equivalents of the C++ virtuals.
  
  -- TODO: Make Create_Ada_Event only visible inside the wx packages!
  --       Should this go in a private package?
  function Create_Ada_Event(Event : in System.Address; CXX_Class_Name : in String) return wx.Base.Event.Event_Class;
  
private

  type Event_Handler_Type is new wx.Base.Object.Object_Type with null record;
  
  procedure Finalize(Self : in out Event_Handler_Type);

  -- START - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  type Event_Function is access procedure(Self : access Event_Handler_Type'Class; Event : in out wx.Base.Event.Event_Type);
  
  procedure Ada_Event_Handler(
    Parent     : Event_Handler_Class;
    Callback   : in Event_Function;
    Event      : in System.Address;
    Class_Name : in Interfaces.C.Strings.chars_ptr);
  pragma Export(C, Ada_Event_Handler, "Ada_Event_Handler");
  
  function Ada_Event_Handler_Process_Event(Self, Event : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Event_Handler_Process_Event, "Ada_Event_Handler_Process_Event");
  -- END - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  
end wx.Base.Event_Handler;
