-- wx-core-scroll_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Window;

package wx.Core.Scroll_Event is

  -- This is the actual type (wxScrollEvent) we are creating here.
  type Scroll_Event_Type is new wx.Base.Command_Event.Command_Event_Type with private;
--  type Scroll_Event_Access is access all Scroll_Event_Type;
--  type Scroll_Event_View is access constant Scroll_Event_Type;
  type Scroll_Event_Class is access all Scroll_Event_Type'Class;

  -- Scroll Bar styles.
  subtype Scroll_Bar_Styles_Type is wx.Core.Window.Window_Styles_Type;
  
  Scroll_Bar_Horizontal : constant Scroll_Bar_Styles_Type := 16#0000_0004#;
  Scroll_Bar_Vertical   : constant Scroll_Bar_Styles_Type := 16#0000_0008#;
  
  -- Events.
  Evt_Scroll_Top           : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_Line_Up       : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_Line_Down     : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_Page_Up       : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_Page_Down     : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_Thumb_Track   : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_Thumb_Release : constant wx.Base.Event.Event_Id_Type;
  Evt_Scroll_End_Scroll    : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Scroll_Event(
    Self        : in out Scroll_Event_Type;
    Command_Id  : in wx.Base.Event.Event_Id_Type;
    Id          : in wx.Base.Id.Id_Type;
    Position    : in Integer;
    Orientation : in Scroll_Bar_Styles_Type);

  function Get_Orientation(Self : in Scroll_Event_Type) return Scroll_Bar_Styles_Type;
  function Get_Position(Self : in Scroll_Event_Type) return Integer;
  
  type Scroll_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Scroll_Event_Type);
  
private

  type Scroll_Event_Type is new wx.Base.Command_Event.Command_Event_Type with null record;
  
  pragma Import(C, Evt_Scroll_Top, "wxEVT_SCROLL_TOP");
  pragma Import(C, Evt_Scroll_Line_Up, "wxEVT_SCROLL_LINEUP");
  pragma Import(C, Evt_Scroll_Line_Down, "wxEVT_SCROLL_LINEDOWN");
  pragma Import(C, Evt_Scroll_Page_Up, "wxEVT_SCROLL_PAGEUP");
  pragma Import(C, Evt_Scroll_Page_Down, "wxEVT_SCROLL_PAGEDOWN");
  pragma Import(C, Evt_Scroll_Thumb_Track, "wxEVT_SCROLL_THUMBTRACK");
  pragma Import(C, Evt_Scroll_Thumb_Release, "wxEVT_SCROLL_THUMBRELEASE");
  pragma Import(C, Evt_Scroll_End_Scroll, "wxEVT_SCROLL_ENDSCROLL");
  
end wx.Core.Scroll_Event;
