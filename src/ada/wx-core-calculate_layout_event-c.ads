-- wx-core-calculate_layout_event-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;
with Interfaces.C;

private package wx.Core.Calculate_Layout_Event.C is

  function ctor(Window_Id : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxCalculateLayoutEvent_ctor");
	
  procedure GetRect(Self, X, Y, Width, Height : in System.Address);
  pragma Import(C, GetRect, "wxCalculateLayoutEvent_GetRect");
    
  procedure SetRect(Self : in System.Address; X, Y, Width, Height : in Interfaces.C.int);
  pragma Import(C, SetRect, "wxCalculateLayoutEvent_SetRect");
    
end wx.Core.Calculate_Layout_Event.C;

