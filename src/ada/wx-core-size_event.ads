-- wx-core-size_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.Size;

package wx.Core.Size_Event is

  -- This is the actual type (wxSizeEvent) we are creating here.
  type Size_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Size_Event_Access is access all Size_Event_Type;
--  type Size_Event_View is access constant Size_Event_Type;
  type Size_Event_Class is access all Size_Event_Type'Class;

  -- Events.
  Evt_Size : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Size_Event(Self : in out Size_Event_Type; Size : in wx.Core.Size.Size_Type; Id : in wx.Base.Id.Id_Type);
  
  function Get_Size(Self : in Size_Event_Type) return wx.Core.Size.Size_Type;
  
  type Size_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Size_Event_Type);
  
private

  type Size_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Size, "wxEVT_SIZE");
  
end wx.Core.Size_Event;
