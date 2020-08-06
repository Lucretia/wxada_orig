-- wx-base-event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Base.Event.C is

  function NewEventType return Interfaces.C.int;
  pragma Import(C, NewEventType, "wxEvent_NewEventType");
	
  function ctor(Id, Event_Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxEvent_ctor");
    
  --procedure SetAdaEvent(Self, AdaEvent : in System.Address);
  --pragma Import(C, SetAdaEvent, "wxEvent_SetAdaEvent");
	
  function GetEventObject(Self : in System.Address) return System.Address;
  pragma Import(C, GetEventObject, "wxEvent_GetEventObject");
	
  function GetEventType(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetEventType, "wxEvent_GetEventType");
	
  function GetId(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetId, "wxEvent_GetId");
	
  function GetSkipped(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetSkipped, "wxEvent_GetSkipped");
	
  function GetTimestamp(Self : in System.Address) return Interfaces.C.long;
  pragma Import(C, GetTimestamp, "wxEvent_GetTimestamp");
	
  function GetPropagationState(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetPropagationState, "wxEvent_GetPropagationState");
	
  function IsCommandEvent(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsCommandEvent, "wxEvent_IsCommandEvent");
	
  procedure ResumePropagation(Self : in System.Address; Propagation_Level : in Interfaces.C.int);
  pragma Import(C, ResumePropagation, "wxEvent_ResumePropagation");
	
  procedure SetEventType(Self : in System.Address; EventType : in Interfaces.C.int);
  pragma Import(C, SetEventType, "wxEvent_SetEventType");
	
  procedure SetId(Self : in System.Address; Id : in Interfaces.C.int);
  pragma Import(C, SetId, "wxEvent_SetId");
	
  procedure SetTimestamp(Self : in System.Address; Time_Stamp : in Interfaces.C.long);
  pragma Import(C, SetTimestamp, "wxEvent_SetTimestamp");
	
  function ShouldPropagate(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, ShouldPropagate, "wxEvent_ShouldPropagate");
	
  procedure Skip(Self : in System.Address; Skip : in Interfaces.C.int);
  pragma Import(C, Skip, "wxEvent_Skip");
	
  function StopPropagation(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, StopPropagation, "wxEvent_StopPropagation");
	

end wx.Base.Event.C;
