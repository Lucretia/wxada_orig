-- wx-core-init_dialog_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Init_Dialog_Event.C is

  function ctor(Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxInitDialogEvent_ctor");

end wx.Core.Init_Dialog_Event.C;
