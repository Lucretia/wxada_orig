-- wx-core-find_dialog_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Find_Dialog_Event.C;

use type Interfaces.C.int;

package body wx.Core.Find_Dialog_Event is

--  package Address_To_Object is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Object;
  
  procedure New_Find_Dialog_Event(
    Self       : in out Find_Dialog_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type := wx.Base.Event.Evt_Null;
    Id         : wx.Base.Id.Id_Type := 0) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Find_Dialog_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id)),
      True);
    
  end New_Find_Dialog_Event;
  
  
  function Get_Flags(Self : in Find_Dialog_Event_Type) return Find_Dialog_Flags_Type is
  
  begin
  
    return Find_Dialog_Flags_Type(wx.Core.Find_Dialog_Event.C.GetFlags(Get_wxObject(Self)));
    
  end Get_Flags;
  
  
  function Get_Find_String(Self : in Find_Dialog_Event_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Core.Find_Dialog_Event.C.GetFindString(Get_wxObject(Self)));
    
  end Get_Find_String;
  
  
  function Get_Replace_String(Self : in Find_Dialog_Event_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Core.Find_Dialog_Event.C.GetReplaceString(Get_wxObject(Self)));
    
  end Get_Replace_String;
  
  
  -- Find_Dialog_Event_Factory.
  function Find_Dialog_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Find_Dialog_Event_Type;
  
  end Find_Dialog_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxFindDialogEvent", Find_Dialog_Event_Factory'Access);
  
end wx.Core.Find_Dialog_Event;
