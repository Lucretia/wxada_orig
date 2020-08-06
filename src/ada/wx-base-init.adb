-- wx-base-init.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Command_Line;
with Interfaces.C.Strings;
with wx.Debug;
with wx.Base.Init.C;

use type Interfaces.C.size_t;

package body wx.Base.Init is

  function wxEntry return Integer is
  
    Argv      : Interfaces.C.Strings.chars_ptr_array(0 .. Interfaces.C.size_t(Ada.Command_Line.Argument_Count));
    Argv_Last : Integer := Integer(Argv'Last);
    
  begin
    
    wx.Debug.Put_Line("[wx.Base.Init.wxEntry]");
    
    for Argc in 1 .. Ada.Command_Line.Argument_Count loop
    
      Argv(Interfaces.C.size_t(Argc - 1)) := Interfaces.C.Strings.New_String(Ada.Command_Line.Argument(Argc));
      
    end loop;
    
    Argv(Interfaces.C.size_t(Ada.Command_Line.Argument_Count)) := Interfaces.C.Strings.null_ptr;

    if Argv_Last = 0 then
    
      return Integer(wx.Base.Init.C.wxEntry(Interfaces.C.int(Argv'Last), Argv));
      
    end if;
    
    return Integer(wx.Base.Init.C.wxEntry(Interfaces.C.int(Argv'Last - 1), Argv));
    
  end wxEntry;
  
  
  procedure Clean_Up is
  
  begin
  
    wx.Base.Init.C.wxEntryCleanup;
    
  end Clean_Up;

end wx.Base.Init;
