-- wx-core-client_dc.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Client_DC.C;

--use type Interfaces.C.int;

package body wx.Core.Client_DC is
  
  procedure New_Client_DC(Self : in out Client_DC_Type; Window : in wx.Core.Window.Window_Class) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Client_DC.C.ctor(wx.Core.Window.Get_wxObject(Window.all)), True);
    
  end New_Client_DC;
  
  
  -- Client_DC_Factory.
  function Client_DC_Factory return Root_WX_Class is
  
  begin
  
    return new Client_DC_Type;
  
  end Client_DC_Factory;
  
begin

  wx.Factory.Add_Factory("wxClientDC", Client_DC_Factory'Access);
  
end wx.Core.Client_DC;
