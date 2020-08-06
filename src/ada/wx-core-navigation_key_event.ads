-- wx-core-navigation_key_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Core.Window;

package wx.Core.Navigation_Key_Event is

  -- This is the actual type (wxMenuEvent) we are creating here.
  type Navigation_Key_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Navigation_Key_Event_Access is access all Navigation_Key_Event_Type;
--  type Navigation_Key_Event_View is access constant Navigation_Key_Event_Type;
  type Navigation_Key_Event_Class is access all Navigation_Key_Event_Type'Class;

  type Flags_Type is mod 2 ** 3;
  
  Backward      : constant Flags_Type := 0;
  Forward       : constant Flags_Type := 1;
  Window_Change : constant Flags_Type := 2;
  From_Tab      : constant Flags_Type := 4;
  
  -- Events.
  Evt_Navigation_Key : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Navigation_Key_Event(Self : in out Navigation_Key_Event_Type);
  
  function Is_Forward(Self : in Navigation_Key_Event_Type) return Boolean;
  procedure Set_Forward(Self : in out Navigation_Key_Event_Type; Forward : in Boolean);
  
  function Is_Window_Change(Self : in Navigation_Key_Event_Type) return Boolean;
  procedure Set_Window_Change(Self : in out Navigation_Key_Event_Type; Window_Change : in Boolean);
  
  function Is_From_Tab(Self : in Navigation_Key_Event_Type) return Boolean;
  procedure Set_From_Tab(Self : in Navigation_Key_Event_Type; From_Tab : in Boolean);
  
  function Get_Current_Focus(Self : in Navigation_Key_Event_Type) return wx.Core.Window.Window_Class;
  procedure Set_Current_Focus(Self : in out Navigation_Key_Event_Type; Focus : in wx.Core.Window.Window_Class);
  
  procedure Set_Flags(Self : in out Navigation_Key_Event_Type; Flags : in Flags_Type);
  
  type Navigation_Key_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Navigation_Key_Event_Type);
  
private

  type Navigation_Key_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Navigation_Key, "wxEVT_NAVIGATION_KEY");
  
end wx.Core.Navigation_Key_Event;
