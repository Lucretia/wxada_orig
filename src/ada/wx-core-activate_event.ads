-- wx-core-activate_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Activate_Event is

  -- This is the actual type (wxActivateEvent) we are creating here.
  type Activate_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Activate_Event_Access is access all Activate_Event_Type;
--  type Activate_Event_View is access constant Activate_Event_Type;
  type Activate_Event_Class is access all Activate_Event_Type'Class;

  -- Events.
  Evt_Activate     : constant wx.Base.Event.Event_Id_Type;
  Evt_Activate_App : constant wx.Base.Event.Event_Id_Type;
--  Evt_Hibernate    : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Activate_Event(
    Self       : in out Activate_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Active     : in Boolean;
    Id         : in wx.Base.Id.Id_Type);
  
  function Is_Activated(Self : in Activate_Event_Type) return Boolean;
  
  type Activate_Event_Function is access procedure(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out Activate_Event_Type);
  
private

  type Activate_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Activate, "wxEVT_ACTIVATE");
  pragma Import(C, Evt_Activate_App, "wxEVT_ACTIVATE_APP");
--  pragma Import(C, Evt_Hibernate, "wxEVT_HIBERNATE");
  
end wx.Core.Activate_Event;
