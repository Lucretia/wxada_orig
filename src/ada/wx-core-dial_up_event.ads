-- wx-core-dial_up_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;

package wx.Core.Dial_Up_Event is

  -- This is the actual type (wxDialUpEvent) we are creating here.
  type Dial_Up_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Dial_Up_Event_Access is access all Dial_Up_Event_Type;
--  type Dial_Up_Event_View is access constant Dial_Up_Event_Type;
  type Dial_Up_Event_Class is access all Dial_Up_Event_Type'Class;

  -- Events.
  Evt_Dial_Up_Connected    : constant wx.Base.Event.Event_Id_Type;
  Evt_Dial_Up_Disconnected : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Dial_Up_Event(Self : in out Dial_Up_Event_Type; Is_Connected, Is_Own_Event : in Boolean);
  
  function Is_Connected_Event(Self : in Dial_Up_Event_Type) return Boolean;
  function Is_Own_Event(Self : in Dial_Up_Event_Type) return Boolean;
  
  type Dial_Up_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Dial_Up_Event_Type);
  
private

  type Dial_Up_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Dial_Up_Connected, "wxEVT_DIALUP_CONNECTED");
  pragma Import(C, Evt_Dial_Up_Disconnected, "wxEVT_DIALUP_DISCONNECTED");
  
end wx.Core.Dial_Up_Event;
