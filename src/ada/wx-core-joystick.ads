-- wx-core-joystick.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
package wx.Core.Joystick is

  type Joystick_Type is (
    Joystick_1,
    Joystick_2);
    
  type Joystick_Button_Type is (
    Button_Any,
    Button_1,
    Button_2,
    Button_3,
    Button_4);

private
    
  for Joystick_Type use (
    Joystick_1 => 0,
    Joystick_2 => 1);
    
  for Joystick_Button_Type use (
    Button_Any => -1,
    Button_1   => 1,
    Button_2   => 2,
    Button_3   => 4,
    Button_4   => 8);
    
end wx.Core.Joystick;
