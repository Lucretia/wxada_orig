-- wx-base-command_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with wx.Factory;
with wx.Base.Command_Event.C;

use type Interfaces.C.int;

package body wx.Base.Command_Event is

  procedure New_Command(
    Self       : in out Command_Event_Type;
    Command_Id : in wx.Base.Event.Event_Id_Type;
    Id         : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Base.Command_Event.C.ctor(Interfaces.C.int(Command_Id), Interfaces.C.int(Id)),
      True);
    
  end New_Command;
  
  
  function Get_Extra_Long(Self : in Command_Event_Type) return Long_Integer is
  
  begin
  
    return Long_Integer(wx.Base.Command_Event.C.GetExtraLong(Get_wxObject(Self)));
    
  end Get_Extra_Long;
  
  
  function Get_Int(Self : in Command_Event_Type) return Integer is
  
  begin
  
    return Integer(wx.Base.Command_Event.C.GetInt(Get_wxObject(Self)));
    
  end Get_Int;
  
  
  function Get_Selection(Self : in Command_Event_Type) return Integer is
  
  begin
  
    return Integer(wx.Base.Command_Event.C.GetSelection(Get_wxObject(Self)));
    
  end Get_Selection;
  
  
  function Get_String(Self : in Command_Event_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Base.Command_Event.C.GetString(Get_wxObject(Self)));
    
  end Get_String;
  
  
  function Is_Checked(Self : in Command_Event_Type) return Boolean is
  
  begin
  
    if wx.Base.Command_Event.C.IsChecked(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Checked;
  
  
  function Is_Selection(Self : in Command_Event_Type) return Boolean is
  
  begin
  
    if wx.Base.Command_Event.C.IsSelection(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Selection;
  
  
  procedure Set(Self : in Command_Event_Type; Value : in Long_Integer) is
  
  begin
  
    wx.Base.Command_Event.C.SetExtraLong(Get_wxObject(Self), Interfaces.C.long(Value));
    
  end Set;
  
  
  procedure Set(Self : in Command_Event_Type; Value : in Integer) is
  
  begin
  
    wx.Base.Command_Event.C.SetInt(Get_wxObject(Self), Interfaces.C.int(Value));
    
  end Set;
  
  
  procedure Set(Self : in Command_Event_Type; Value : in String) is
  
  begin
  
    wx.Base.Command_Event.C.SetString(Get_wxObject(Self), Interfaces.C.Strings.New_String(Value));
    
  end Set;
  

  -- Finalize
--  procedure Finalize(Self : in out Command_Event_Type) is
  
    --procedure dtor(Self : in wxCXX_Object_Access);
    --pragma Import(C, dtor, "dtor");
  
--  begin
  
--    if Get_wxObject(Self) /= System.Null_Address then
    
      --wxEvent_dtor(Self.wxCXX_Object);
      
--      Set_wxObject(Self, System.Null_Address, False);
    
--    end if;
    
--  end Finalize;


  -- Command_Event_Factory.
  function Command_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Command_Event_Type;
  
  end Command_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxCommandEvent", Command_Event_Factory'Access);
  
end wx.Base.Command_Event;
