-- wx-core-client_dc.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.DC;
with wx.Core.Window;

package wx.Core.Client_DC is

  -- This is the actual type (wxClientDC) we are creating here.
  type Client_DC_Type is new wx.Core.DC.DC_Type with private;
--  type Client_DC_Access is access all Client_DC_Type;
--  type Client_DC_View is access constant Client_DC_Type;
  type Client_DC_Class is access all Client_DC_Type'Class;
  
  procedure New_Client_DC(Self : in out Client_DC_Type; Window : in wx.Core.Window.Window_Class);
  
private
  
  type Client_DC_Type is new wx.Core.DC.DC_Type with null record;
  
end wx.Core.Client_DC;
