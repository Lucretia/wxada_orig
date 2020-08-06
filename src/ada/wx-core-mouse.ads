-- wx-core-mouse.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
package wx.Core.Mouse is

  type Mouse_Button_Type is (
    Button_Any,
    Button_None,
    Button_Left,
    Button_Middle,
    Button_Right);

private

  for Mouse_Button_Type use (
    Button_Any    => -1,
    Button_None   => 0,
    Button_Left   => 1,
    Button_Middle => 2,
    Button_Right  => 3);
    
end wx.Core.Mouse;
