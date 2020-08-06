-- wx-core-erase_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;
with wx.Core.DC;

package wx.Core.Erase_Event is

  -- This is the actual type (wxEraseEvent) we are creating here.
  type Erase_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Erase_Event_Access is access all Erase_Event_Type;
--  type Erase_Event_View is access constant Erase_Event_Type;
  type Erase_Event_Class is access all Erase_Event_Type'Class;

  -- Events.
  Evt_Erase_Background : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Erase_Event(Self : in out Erase_Event_Type; Id : in wx.Base.Id.Id_Type; DC : in wx.Core.DC.DC_Class);
  
  function Get_DC(Self : in Erase_Event_Type) return wx.Core.DC.DC_Class;
  
  type Erase_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Erase_Event_Type);
  
private

  type Erase_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Erase_Background, "wxEVT_ERASE_BACKGROUND");
  
end wx.Core.Erase_Event;
