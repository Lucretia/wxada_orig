-- wx-core-menu.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Menu.C;

use type Interfaces.C.int;
use type Interfaces.C.long;

package body wx.Core.Menu is

  function Menu_Style_To_C_long is new Ada.Unchecked_Conversion(Source => Menu_Style_Type, Target => Interfaces.C.long);
  
  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
--  package Address_To_Window_Access is new System.Address_To_Access_Conversions(Window_Type);
--  use Address_To_Window_Access;
  
    
  procedure New_Menu(
    Self  : in out Menu_Type;
    Title : in String;
    Style : in Menu_Style_Type) is
    
  begin
  
    Set_wxObject(Self,
      wx.Core.Menu.C.ctor(
        System.Null_Address,
        Interfaces.C.Strings.New_String(Title),
        Menu_Style_To_C_long(Style)),
      True);
  
  end New_Menu;


  -- Menu_Factory.
  function Menu_Factory return Root_WX_Class is
  
  begin
  
    return new Menu_Type;
  
  end Menu_Factory;
  
begin

  wx.Factory.Add_Factory("wxMenu", Menu_Factory'Access);
  
end wx.Core.Menu;
