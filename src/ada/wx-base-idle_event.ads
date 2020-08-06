-- wx-base-idle_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;
with wx.Core.Window;

package wx.Base.Idle_Event is

  -- This is the actual type (wxIdleEvent) we are creating here.
  type Idle_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Idle_Event_Access is access all Idle_Event_Type;
--  type Idle_Event_View is access constant Idle_Event_Type;
  type Idle_Event_Class is access all Idle_Event_Type'Class;

  -- Events.
  Evt_Idle : constant wx.Base.Event.Event_Id_Type;
  
  type Idle_Mode_Type is (Process_All, Process_Specified);
  for Idle_Mode_Type use (Process_All => 0, Process_Specified => 1);
  
  procedure New_Idle_Event(Self : in out Idle_Event_Type);
  
  function Can_Accept_Idle_Events(Window : in wx.Core.Window.Window_Class) return Boolean;
  function Get_Idle_Mode(Window : in wx.Core.Window.Window_Class) return Idle_Mode_Type;
  procedure Request_More(Self : in Idle_Event_Type; Need_More : in Boolean);
  function More_Requested(Self : in Idle_Event_Type) return Boolean;
  procedure Set_Idle_Mode(Mode : in Idle_Mode_Type);
  
  type Idle_Event_Function is access procedure(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out Idle_Event_Type);
  
private

  type Idle_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Idle, "wxEVT_IDLE");
  
end wx.Base.Idle_Event;
