-- wx-core-menu.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event_Handler;

package wx.Core.Menu is

  -- This is the actual type (wxMenu) we are creating here.
  type Menu_Type is new wx.Base.Event_Handler.Event_Handler_Type with private;
--  type Menu_Access is access all Menu_Type;
--  type Menu_View is access constant Menu_Type;
  type Menu_Class is access all Menu_Type'Class;
  
  type Menu_Style_Type is (Tear_Off);
  for Menu_Style_Type use (Tear_Off => 16#0000_0001#);
  
  procedure New_Menu(
    Self  : in out Menu_Type;
    Title : in String;
    Style : in Menu_Style_Type);
    
private

  type Menu_Type is new wx.Base.Event_Handler.Event_Handler_Type with null record;
  
end wx.Core.Menu;
