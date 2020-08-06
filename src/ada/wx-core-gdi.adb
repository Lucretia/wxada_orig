-- wx-core-gdi.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Factory;
with wx.Core.GDI.C;

package body wx.Core.GDI is
  
  procedure New_GDI(Self : in out GDI_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.GDI.C.ctor, True);
    
  end New_GDI;

    
  -- GDI_Factory.
  function GDI_Factory return Root_WX_Class is
  
  begin
  
    return new GDI_Type;
  
  end GDI_Factory;
  
begin

  wx.Factory.Add_Factory("wxGDIObject", GDI_Factory'Access);
  
end wx.Core.GDI;
