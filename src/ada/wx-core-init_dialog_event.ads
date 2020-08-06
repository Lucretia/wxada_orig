-- wx-core-init_dialog_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Init_Dialog_Event is

  -- This is the actual type (wxInitDialogEvent) we are creating here.
  type Init_Dialog_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Init_Dialog_Event_Access is access all Init_Dialog_Event_Type;
--  type Init_Dialog_Event_View is access constant Init_Dialog_Event_Type;
  type Init_Dialog_Event_Class is access all Init_Dialog_Event_Type'Class;

  -- Events.
  Evt_Init_Dialog : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Init_Dialog_Event(Self : in out Init_Dialog_Event_Type; Id : in wx.Base.Id.Id_Type);
  
  type Init_Dialog_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Init_Dialog_Event_Type);
  
private

  type Init_Dialog_Event_Type is new wx.Base.Event.Event_Type with null record;
  
  pragma Import(C, Evt_Init_Dialog, "wxEVT_INIT_DIALOG");
  
end wx.Core.Init_Dialog_Event;
