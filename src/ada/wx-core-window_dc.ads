-- wx-core-window_dc.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.DC;
with wx.Core.Window;

package wx.Core.Window_DC is

  -- This is the actual type (wxWindowDC) we are creating here.
  type Window_DC_Type is new wx.Core.DC.DC_Type with private;
--  type Window_DC_Access is access all Window_DC_Type;
--  type Window_DC_View is access constant Window_DC_Type;
  type Window_DC_Class is access all Window_DC_Type'Class;
  
  procedure New_Window_DC(Self : in out Window_DC_Type; Window : in wx.Core.Window.Window_Type'Class);
  
private
  
  type Window_DC_Type is new wx.Core.DC.DC_Type with null record;
  
end wx.Core.Window_DC;
