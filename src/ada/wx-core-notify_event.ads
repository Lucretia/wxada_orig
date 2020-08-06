-- wx-core-notify_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;

package wx.Core.Notify_Event is

  -- This is the actual type (wxNotifyEvent) we are creating here.
  type Notify_Event_Type is new wx.Base.Command_Event.Command_Event_Type with private;
--  type Notify_Event_Access is access all Notify_Event_Type;
--  type Notify_Event_View is access constant Notify_Event_Type;
  type Notify_Event_Class is access all Notify_Event_Type'Class;
 
  procedure New_Notify_Event(
    Self       : in out Notify_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type);

  procedure Allow(Self : in Notify_Event_Type);
  function Is_Allowed(Self : in Notify_Event_Type) return Boolean;
  procedure Veto(Self : in Notify_Event_Type);
  
  type Notify_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Notify_Event_Type);
  
private

  type Notify_Event_Type is new wx.Base.Command_Event.Command_Event_Type with null record;
  
end wx.Core.Notify_Event;
