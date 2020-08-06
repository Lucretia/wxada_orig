-- wx-core-context_menu_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Point;

package wx.Core.Context_Menu_Event is

  -- This is the actual type (wxContextMenuEvent) we are creating here.
  type Context_Menu_Event_Type is new wx.Base.Command_Event.Command_Event_Type with private;
--  type Context_Menu_Event_Access is access all Context_Menu_Event_Type;
--  type Context_Menu_Event_View is access constant Context_Menu_Event_Type;
  type Context_Menu_Event_Class is access all Context_Menu_Event_Type'Class;

  -- Events.
  Evt_Context_Menu : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Context_Menu_Event(
    Self       : in out Context_Menu_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type;
    Position   : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position);
  
  function Get_Position(Self : in Context_Menu_Event_Type) return wx.Core.Point.Point_Type;
  procedure Set_Position(Self : in Context_Menu_Event_Type; Position : in wx.Core.Point.Point_Type);
  
  type Context_Menu_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Context_Menu_Event_Type);
  
private

  type Context_Menu_Event_Type is new wx.Base.Command_Event.Command_Event_Type with null record;
  
  pragma Import(C, Evt_Context_Menu, "wxEVT_CONTEXT_MENU");
  
end wx.Core.Context_Menu_Event;
