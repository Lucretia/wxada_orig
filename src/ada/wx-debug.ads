-- wx-debug.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
package wx.Debug is

  procedure On;
  pragma Inline(On);
  
  procedure Off;
  pragma Inline(Off);
  
  procedure Put_Line(Text : in String);
  pragma Inline(Put_Line);
  
  procedure Put(Text : in String);
  pragma Inline(Put);
  
end wx.Debug;
