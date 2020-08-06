-- wx-core-focus_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Window;

package wx.Core.Focus_Event is

  -- This is the actual type (wxFocusEvent) we are creating here.
  type Focus_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Focus_Event_Access is access all Focus_Event_Type;
--  type Focus_Event_View is access constant Focus_Event_Type;
  type Focus_Event_Class is access all Focus_Event_Type'Class;

  -- Events.
  Evt_Set_Focus  : constant wx.Base.Event.Event_Id_Type;
  Evt_Kill_Focus : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Focus_Event(
    Self       : in out Focus_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type);
  
  function Get_Window(Self : in Focus_Event_Type) return wx.Core.Window.Window_Class;
  procedure Set_Window(Self : in Focus_Event_Type; Window : in wx.Core.Window.Window_Class);
  
  type Focus_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Focus_Event_Type);
  
private

  type Focus_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Set_Focus, "wxEVT_SET_FOCUS");
  pragma Import(C, Evt_Kill_Focus, "wxEVT_KILL_FOCUS");
  
end wx.Core.Focus_Event;
