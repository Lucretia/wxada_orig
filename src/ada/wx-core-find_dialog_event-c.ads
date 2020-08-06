-- wx-core-find_dialog_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Find_Dialog_Event.C is

  function ctor(Command_Id, Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxFindDialogEvent_ctor");

  function GetFlags(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetFlags, "wxFindDialogEvent_GetFlags");

  function GetFindString(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetFindString, "wxFindDialogEvent_GetFindString");

  function GetReplaceString(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetReplaceString, "wxFindDialogEvent_GetReplaceString");

end wx.Core.Find_Dialog_Event.C;
