-- wx-base-command_event.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Base.Event;
with wx.Base.Event_Handler;

package wx.Base.Command_Event is

  -- This is the actual type (wxCommandEvent) we are creating here.
  type Command_Event_Type is new wx.Base.Event.Event_Type with private;
--  type Command_Event_Access is access all Command_Event_Type;
--  type Command_Event_View is access constant Command_Event_Type;
  type Command_Event_Class is access all Command_Event_Type'Class;

  -- Events.
  -- 

  procedure New_Command(
    Self       : in out Command_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type);

  function Get_Extra_Long(Self : in Command_Event_Type) return Long_Integer;
  function Get_Int(Self : in Command_Event_Type) return Integer;
  function Get_Selection(Self : in Command_Event_Type) return Integer;
  function Get_String(Self : in Command_Event_Type) return String;
  function Is_Checked(Self : in Command_Event_Type) return Boolean;
  function Is_Selection(Self : in Command_Event_Type) return Boolean;
  procedure Set(Self : in Command_Event_Type; Value : in Long_Integer);
  procedure Set(Self : in Command_Event_Type; Value : in Integer);
  procedure Set(Self : in Command_Event_Type; Value : in String);
  
  type Command_Event_Function is access procedure(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out Command_Event_Type);
  
private

  type Command_Event_Type is new wx.Base.Event.Event_Type with null record;
  
--  procedure Finalize(Self : in out Command_Event_Type);
  
end wx.Base.Command_Event;
