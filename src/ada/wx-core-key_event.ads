-- wx-core-key_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Core.Keyboard;
with wx.Core.Point;

package wx.Core.Key_Event is

  -- This is the actual type (wxMenuEvent) we are creating here.
  type Key_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Key_Event_Access is access all Key_Event_Type;
--  type Key_Event_View is access constant Key_Event_Type;
  type Key_Event_Class is access all Key_Event_Type'Class;

  -- Events.
  Evt_Char           : constant wx.Base.Event.Event_Id_Type;
  Evt_Char_Hook      : constant wx.Base.Event.Event_Id_Type;
  Evt_Key_Up         : constant wx.Base.Event.Event_Id_Type;
  Evt_Key_Down       : constant wx.Base.Event.Event_Id_Type;
  Evt_Hot_Key        : constant wx.Base.Event.Event_Id_Type;  -- WinCE port only? Which event type will be propagated?
  
  procedure New_Key_Event(Self : in out Key_Event_Type; Command_Id : in wx.Base.Event.Event_Id_Type);
  function Alt_Down(Self : in Key_Event_Type) return Boolean;
  function Command_Down(Self : in Key_Event_Type) return Boolean;
  function Control_Down(Self : in Key_Event_Type) return Boolean;
  function Get_Key_Code(Self : in Key_Event_Type) return wx.Core.Keyboard.Key_Code_Type;
  function Get_Position(Self : in Key_Event_Type) return wx.Core.Point.Point_Type;
--  function Get_Raw_Key_Code(Self : in Key_Event_Type) return Key_Code_Type;
--  function Get_Key_Flags(Self : in Key_Event_Type) return Key_Code_Type;
--  function Get_Unicode_Key(Self : in Key_Event_Type) return Key_Code_Type;
  function Get_X(Self : in Key_Event_Type) return wx.Core.Point.Coord_Type;
  function Get_Y(Self : in Key_Event_Type) return wx.Core.Point.Coord_Type;
  function Has_Modifiers(Self : in Key_Event_Type) return Boolean;
  function Meta_Down(Self : in Key_Event_Type) return Boolean;
  function Shift_Down(Self : in Key_Event_Type) return Boolean;
  
  type Key_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Key_Event_Type);
  
private

  type Key_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Char, "wxEVT_CHAR");
  pragma Import(C, Evt_Char_Hook, "wxEVT_CHAR_HOOK");
  pragma Import(C, Evt_Key_Down, "wxEVT_KEY_DOWN");
  pragma Import(C, Evt_Key_Up, "wxEVT_KEY_UP");
  pragma Import(C, Evt_Hot_Key, "wxEVT_HOTKEY");
  
end wx.Core.Key_Event;
