-- wx-core-window_dc.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;
with wx.Factory;
with wx.Core.Window_DC.C;

--use type Interfaces.C.int;

package body wx.Core.Window_DC is
  
  procedure New_Window_DC(Self : in out Window_DC_Type; Window : in wx.Core.Window.Window_Type'Class) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Window_DC.C.ctor(wx.Core.Window.Get_wxObject(Window)), True);
    
  end New_Window_DC;
  
  
  -- Window_DC_Factory.
  function Window_DC_Factory return Root_WX_Class is
  
  begin
  
    return new Window_DC_Type;
  
  end Window_DC_Factory;
  
begin

  wx.Factory.Add_Factory("wxWindowDC", Window_DC_Factory'Access);
  
end wx.Core.Window_DC;
