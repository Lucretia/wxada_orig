-- wx-core-paint_dc.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.Window_DC;
with wx.Core.Window;

package wx.Core.Paint_DC is

  -- This is the actual type (wxPaintDC) we are creating here.
  type Paint_DC_Type is new wx.Core.Window_DC.Window_DC_Type with private;
--  type Paint_DC_Access is access all Paint_DC_Type;
--  type Paint_DC_View is access constant Paint_DC_Type;
  type Paint_DC_Class is access all Paint_DC_Type'Class;
  
  procedure New_Paint_DC(Self : in out Paint_DC_Type; Window : in wx.Core.Window.Window_Type'Class);
  
private
  
  type Paint_DC_Type is new wx.Core.Window_DC.Window_DC_Type with null record;
  
end wx.Core.Paint_DC;
