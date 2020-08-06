-- wx-base-command_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Base.Command_Event.C is

  function ctor(Command_Id, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxCommandEvent_ctor");
	
  function GetExtraLong(Self : in System.Address) return Interfaces.C.long;
  pragma Import(C, GetExtraLong, "wxCommandEvent_GetExtraLong");
	
  function GetInt(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetInt, "wxCommandEvent_GetInt");
	
  function GetSelection(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetSelection, "wxCommandEvent_GetSelection");
	
  function GetString(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetString, "wxCommandEvent_GetString");
	
  function IsChecked(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsChecked, "wxCommandEvent_IsChecked");
	
  function IsSelection(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsSelection, "wxCommandEvent_IsSelection");
	
  procedure SetExtraLong(Self : in System.Address; Value : in Interfaces.C.long);
  pragma Import(C, SetExtraLong, "wxCommandEvent_SetExtraLong");
	
  procedure SetInt(Self : in System.Address; Value : in Interfaces.C.int);
  pragma Import(C, SetInt, "wxCommandEvent_SetInt");
	
  procedure SetString(Self : in System.Address; Value : in Interfaces.C.Strings.chars_ptr);
  pragma Import(C, SetString, "wxCommandEvent_SetString");
	
end wx.Base.Command_Event.C;
