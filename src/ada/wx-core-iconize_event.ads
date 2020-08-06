-- wx-core-iconize_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Iconize_Event is

  -- This is the actual type (wxIconizeEvent) we are creating here.
  type Iconize_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Iconize_Event_Access is access all Iconize_Event_Type;
--  type Iconize_Event_View is access constant Iconize_Event_Type;
  type Iconize_Event_Class is access all Iconize_Event_Type'Class;

  -- Events.
  Evt_Iconize : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Iconize_Event(
    Self    : in out Iconize_Event_Type;
    Id      : in wx.Base.Id.Id_Type := 0;
    Iconize : in Boolean            := True);
  
  function Is_Iconized(Self : in Iconize_Event_Type) return Boolean;
  
  type Iconize_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Iconize_Event_Type);
  
private

  type Iconize_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Iconize, "wxEVT_ICONIZE");
  
end wx.Core.Iconize_Event;
