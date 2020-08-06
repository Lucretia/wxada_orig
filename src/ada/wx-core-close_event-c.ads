-- wx-core-close_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Close_Event.C is

  function ctor(Command_Id, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxCloseEvent_ctor");
	
  function CanVeto(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, CanVeto, "wxCloseEvent_CanVeto");

  function GetLoggingOff(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetLoggingOff, "wxCloseEvent_GetLoggingOff");

  procedure SetCanVeto(Self : in System.Address; Can_Veto : in Interfaces.C.int);
  pragma Import(C, SetCanVeto, "wxCloseEvent_SetCanVeto");
	
  procedure SetLoggingOff(Self : in System.Address; Logging_Off : in Interfaces.C.int);
  pragma Import(C, SetLoggingOff, "wxCloseEvent_SetLoggingOff");
	
  procedure Veto(Self : in System.Address; Logging_Off : in Interfaces.C.int);
  pragma Import(C, Veto, "wxCloseEvent_Veto");

end wx.Core.Close_Event.C;
