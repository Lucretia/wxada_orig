-- wx-base-init-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;

private package wx.Base.Init.C is

  function wxEntry(Argc : in Interfaces.C.int; Argv : in Interfaces.C.Strings.chars_ptr_array) return Interfaces.C.int;
  pragma Import(C, wxEntry, "wxInit_wxEntry");
    
  procedure wxEntryCleanup;
  pragma Import(C, wxEntryCleanup, "wxInit_wxEntryCleanup");

end wx.Base.Init.C;
