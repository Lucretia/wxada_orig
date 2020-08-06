-- wx-core-spin_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Core.Notify_Event;

package wx.Core.Spin_Event is

  -- This is the actual type (wxSpinEvent) we are creating here.
  type Spin_Event_Type is new wx.Core.Notify_Event.Notify_Event_Type with private;
--  type Spin_Event_Access is access all Spin_Event_Type;
--  type Spin_Event_View is access constant Spin_Event_Type;
  type Spin_Event_Class is access all Spin_Event_Type'Class;

  -- Events.
  Evt_Spin      : constant wx.Base.Event.Event_Id_Type;
  Evt_Spin_Up   : constant wx.Base.Event.Event_Id_Type;
  Evt_Spin_Down : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Spin_Event(
    Self       : in out Spin_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type);

  function Get_Position(Self : in Spin_Event_Type) return Integer;
  procedure Set_Position(Self : in Spin_Event_Type; Position : in Integer);
  
  type Spin_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Spin_Event_Type);
  
private

  type Spin_Event_Type is new wx.Core.Notify_Event.Notify_Event_Type with null record;
  
  pragma Import(C, Evt_Spin, "wxEVT_SCROLL_THUMBTRACK");
  pragma Import(C, Evt_Spin_Up, "wxEVT_SCROLL_LINEUP");
  pragma Import(C, Evt_Spin_Down, "wxEVT_SCROLL_LINEDOWN");
  
end wx.Core.Spin_Event;
