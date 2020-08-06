-- wx-core-find_dialog_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;
with wx.Base.Id;

package wx.Core.Find_Dialog_Event is

  -- This is the actual type (wxFindDialogEvent) we are creating here.
  type Find_Dialog_Event_Type is new wx.Base.Command_Event.Command_Event_Type with private;
--  type Find_Dialog_Event_Access is access all Find_Dialog_Event_Type;
--  type Find_Dialog_Event_View is access constant Find_Dialog_Event_Type;
  type Find_Dialog_Event_Class is access all Find_Dialog_Event_Type'Class;

  -- Events.
  Evt_Find             : constant wx.Base.Event.Event_Id_Type;
  Evt_Find_Next        : constant wx.Base.Event.Event_Id_Type;
  Evt_Find_Replace     : constant wx.Base.Event.Event_Id_Type;
  Evt_Find_Replace_All : constant wx.Base.Event.Event_Id_Type;
  Evt_Find_Close       : constant wx.Base.Event.Event_Id_Type;
  
  type Find_Dialog_Flags_Type is mod 2 ** Interfaces.C.int'Size;
  
  Down       : constant Find_Dialog_Flags_Type := 1;
  Whole_Word : constant Find_Dialog_Flags_Type := 2;
  Match_Case : constant Find_Dialog_Flags_Type := 4;
  
  procedure New_Find_Dialog_Event(
    Self       : in out Find_Dialog_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type := wx.Base.Event.Evt_Null;
    Id         : wx.Base.Id.Id_Type := 0);
  
  function Get_Flags(Self : in Find_Dialog_Event_Type) return Find_Dialog_Flags_Type;
  function Get_Find_String(Self : in Find_Dialog_Event_Type) return String;
  function Get_Replace_String(Self : in Find_Dialog_Event_Type) return String;
--  function Get_Dialog(Self : in Find_Dialog_Event_Type) return Find_Replace_Dialog_Class;
  
  type Find_Dialog_Event_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Find_Dialog_Event_Type);
  
private

  type Find_Dialog_Event_Type is new wx.Base.Command_Event.Command_Event_Type with null record;
  
  pragma Import(C, Evt_Find, "wxEVT_COMMAND_FIND");
  pragma Import(C, Evt_Find_Next, "wxEVT_COMMAND_FIND_NEXT");
  pragma Import(C, Evt_Find_Replace, "wxEVT_COMMAND_FIND_REPLACE");
  pragma Import(C, Evt_Find_Replace_All, "wxEVT_COMMAND_FIND_REPLACE_ALL");
  pragma Import(C, Evt_Find_Close, "wxEVT_COMMAND_FIND_CLOSE");
  
end wx.Core.Find_Dialog_Event;
