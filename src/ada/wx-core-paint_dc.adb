-- wx-core-paint_dc.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Paint_DC.C;

use type Interfaces.C.int;

package body wx.Core.Paint_DC is
  
  procedure New_Paint_DC(Self : in out Paint_DC_Type; Window : in wx.Core.Window.Window_Type'Class) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Paint_DC.C.ctor(wx.Core.Window.Get_wxObject(Window)), True);
    
  end New_Paint_DC;
  
  
  -- Paint_DC_Factory.
  function Paint_DC_Factory return Root_WX_Class is
  
  begin
  
    return new Paint_DC_Type;
  
  end Paint_DC_Factory;
  
begin

  wx.Factory.Add_Factory("wxPaintDC", Paint_DC_Factory'Access);
  
end wx.Core.Paint_DC;
