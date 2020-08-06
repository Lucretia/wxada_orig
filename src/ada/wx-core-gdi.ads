-- wx-core-gdi.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;

package wx.Core.GDI is

  -- This is the actual type (wxGDIObject) we are creating here.
  type GDI_Type is new wx.Base.Object.Object_Type with private;
--  type GDI_Access is access all GDI_Type;
--  type GDI_View is access constant GDI_Type;
  type GDI_Class is access all GDI_Type'Class;
  
  procedure New_GDI(Self : in out GDI_Type);
  
private
  
  type GDI_Type is new wx.Base.Object.Object_Type with null record;
  
end wx.Core.GDI;
