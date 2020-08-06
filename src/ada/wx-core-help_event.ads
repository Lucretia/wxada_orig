-- wx-core-help_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Point;

package wx.Core.Help_Event is

  -- This is the actual type (wxHelpEvent) we are creating here.
  type Help_Event_Type is new wx.Base.Command_Event.Command_Event_Type with private;
--  type Help_Event_Access is access all Help_Event_Type;
--  type Help_Event_View is access constant Help_Event_Type;
  type Help_Event_Class is access all Help_Event_Type'Class;

  -- Events.
  Evt_Help : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Help_Event(
    Self       : in out Help_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type;
    Position   : in wx.Core.Point.Point_Type);
  
  function Get_Position(Self : in Help_Event_Type) return wx.Core.Point.Point_Type;
  procedure Set_Position(Self : in Help_Event_Type; Position : in wx.Core.Point.Point_Type);
  
  type Focus_Help_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Help_Event_Type);
  
private

  type Help_Event_Type is new wx.Base.Command_Event.Command_Event_Type with null record;
  
  pragma Import(C, Evt_Help, "wxEVT_HELP");
  
end wx.Core.Help_Event;
