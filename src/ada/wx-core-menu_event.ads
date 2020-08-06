-- wx-core-menu_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Menu;

package wx.Core.Menu_Event is

  -- This is the actual type (wxMenuEvent) we are creating here.
  type Menu_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Menu_Event_Access is access all Menu_Event_Type;
--  type Menu_Event_View is access constant Menu_Event_Type;
  type Menu_Event_Class is access all Menu_Event_Type'Class;

  -- Events.
  Evt_Menu_Open      : constant wx.Base.Event.Event_Id_Type;
  Evt_Menu_Close     : constant wx.Base.Event.Event_Id_Type;
  Evt_Menu_Highlight : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Menu_Event(
    Self       : in out Menu_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type;
    Menu       : in wx.Core.Menu.Menu_Class);
    
  function Get_Menu(Self : in Menu_Event_Type) return wx.Core.Menu.Menu_Class;
  function Get_Menu_Id(Self : in Menu_Event_Type) return wx.Base.Id.Id_Type;
  function Is_Popup(Self : in Menu_Event_Type) return Boolean;
  
  type Menu_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Menu_Event_Type);
  
private

  type Menu_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Menu_Open, "wxEVT_MENU_OPEN");
  pragma Import(C, Evt_Menu_Close, "wxEVT_MENU_CLOSE");
  pragma Import(C, Evt_Menu_Highlight, "wxEVT_MENU_HIGHLIGHT");
  
end wx.Core.Menu_Event;
