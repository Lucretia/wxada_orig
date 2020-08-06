-- wx-core-calculate_layout_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Rect;

package wx.Core.Calculate_Layout_Event is

  -- This is the actual type (wxCalculateLayoutEvent) we are creating here.
  type Calculate_Layout_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Calculate_Layout_Event_Access is access all Calculate_Layout_Event_Type;
--  type Calculate_Layout_Event_View is access constant Calculate_Layout_Event_Type;
  type Calculate_Layout_Event_Class is access all Calculate_Layout_Event_Type'Class;

  -- Events.
  Evt_Calculate_Layout : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Calculate_Layout_Event(Self : in out Calculate_Layout_Event_Type; Window_Id : in wx.Base.Id.Id_Type);
  
  function Get_Rect(Self : in Calculate_Layout_Event_Type) return wx.Core.Rect.Rect_Type;
  procedure Set_Rect(Self : in Calculate_Layout_Event_Type; Area : in wx.Core.Rect.Rect_Type);
  
  type Calculate_Layout_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Calculate_Layout_Event_Type);
  
private

  type Calculate_Layout_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Calculate_Layout, "wxEVT_CALCULATE_LAYOUT");
  
end wx.Core.Calculate_Layout_Event;
