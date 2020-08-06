-- wx-core-paint_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Paint_Event is

  -- This is the actual type (wxPaintEvent) we are creating here.
  type Paint_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Paint_Event_Access is access all Paint_Event_Type;
--  type Paint_Event_View is access constant Paint_Event_Type;
  type Paint_Event_Class is access all Paint_Event_Type'Class;
 
  -- Events.
  Evt_Paint : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Paint_Event(Self : in out Paint_Event_Type; Id : in wx.Base.Id.Id_Type);

  type Paint_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Paint_Event_Type);
  
private

  type Paint_Event_Type is new wx.Base.Event.Event_Type with null record;

  pragma Import(C, Evt_Paint, "wxEVT_PAINT");
    
end wx.Core.Paint_Event;
