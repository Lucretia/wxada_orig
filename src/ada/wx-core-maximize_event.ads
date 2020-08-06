-- wx-core-maximize_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Maximize_Event is

  -- This is the actual type (wxMaximizeEvent) we are creating here.
  type Maximize_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Maximize_Event_Access is access all Maximize_Event_Type;
--  type Maximize_Event_View is access constant Maximize_Event_Type;
  type Maximize_Event_Class is access all Maximize_Event_Type'Class;

  -- Events.
  Evt_Maximize : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Maximize_Event(Self : in out Maximize_Event_Type; Id : in wx.Base.Id.Id_Type);
  
  type Maximize_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Maximize_Event_Type);
  
private

  type Maximize_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Maximize, "wxEVT_MAXIMIZE");
  
end wx.Core.Maximize_Event;
