-- wx-core-close_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Close_Event is

  -- This is the actual type (wxCloseEvent) we are creating here.
  type Close_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Close_Event_Access is access all Close_Event_Type;
--  type Close_Event_View is access constant Close_Event_Type;
  type Close_Event_Class is access all Close_Event_Type'Class;

  -- Events.
  Evt_Close_Window      : constant wx.Base.Event.Event_Id_Type;
  Evt_End_Session       : constant wx.Base.Event.Event_Id_Type;
  Evt_Query_End_Session : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Close_Event(
    Self       : in out Close_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type);
  
  function Can_Veto(Self : in Close_Event_Type) return Boolean;
  function Is_Logging_Off(Self : in Close_Event_Type) return Boolean;
  procedure Set_Can_Veto(Self : in out Close_Event_Type; Can_Veto : in Boolean);
  procedure Set_Logging_Off(Self : in out Close_Event_Type; Logging_Off : in Boolean);
  procedure Veto(Self : in out Close_Event_Type; Veto : in Boolean);
  
  type Close_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Close_Event_Type);
  
private

  type Close_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Close_Window, "wxEVT_CLOSE_WINDOW");
  pragma Import(C, Evt_End_Session, "wxEVT_END_SESSION");
  pragma Import(C, Evt_Query_End_Session, "wxEVT_QUERY_END_SESSION");
  
end wx.Core.Close_Event;
