-- wx-base-event_handler-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Base.Event_Handler.C is

  function ctor return System.Address;
  pragma Import(C, ctor, "wxEvtHandler_ctor");
    
  procedure dtor(Self : in System.Address);
  pragma Import(C, dtor, "wxEvtHandler_dtor");
  
  procedure AddPendingEvent(Self, Event : in System.Address);
  pragma Import(C, AddPendingEvent, "wxEvtHandler_AddPendingEvent");

  procedure Connect(
    Self                 : in System.Address;
    Id,
    LastId,
    EventType            : in Interfaces.C.int;
    Parent_Event_Handler : in System.Address;
    Callback             : in VoidPtr);
  pragma Import(C, Connect, "wxEvtHandler_Connect");

  function Disconnect(Self : in System.Address; Id, LastId, EventType : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, Disconnect, "wxEvtHandler_Disconnect");
  
  function GetEvtHandlerEnabled(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetEvtHandlerEnabled, "wxEvtHandler_GetEvtHandlerEnabled");
  
  function GetNextHandler(Self : in System.Address) return System.Address;
  pragma Import(C, GetNextHandler, "wxEvtHandler_GetNextHandler");
  
  function GetPreviousHandler(Self : in System.Address) return System.Address;
  pragma Import(C, GetPreviousHandler, "wxEvtHandler_GetPreviousHandler");
  
  procedure SetEvtHandlerEnabled(Self : System.Address; Enabled : in Interfaces.C.int);
  pragma Import(C, SetEvtHandlerEnabled, "wxEvtHandler_SetEvtHandlerEnabled");
    
  procedure SetNextHandler(Self, Handler : in System.Address);
  pragma Import(C, SetNextHandler, "wxEvtHandler_SetNextHandler");
  
  procedure SetPreviousHandler(Self, Handler : in System.Address);
  pragma Import(C, SetPreviousHandler, "wxEvtHandler_SetPreviousHandler");
  
  function ProcessEvent(Self, Event : in System.Address) return Interfaces.C.int;
  pragma Import(C, ProcessEvent, "wxEvtHandler_ProcessEvent");
  
end wx.Base.Event_Handler.C;
