-- wx-core-colour.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Colour.C;

use type Interfaces.C.int;
use type System.Address;

package body wx.Core.Colour is

  procedure New_Colour(Self : in out Colour_Type; Red, Green, Blue : in Colour_Component_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Colour.C.ctor(Interfaces.C.int(Red), Interfaces.C.int(Green), Interfaces.C.int(Blue)),
      True);
    
  end New_Colour;


  function Red(Self : in Colour_Type) return Colour_Component_Type is
  
  begin
  
    return Colour_Component_Type(wx.Core.Colour.C.Red(Get_wxObject(Self)));
    
  end Red;
  
  
  function Green(Self : in Colour_Type) return Colour_Component_Type is
  
  begin
  
    return Colour_Component_Type(wx.Core.Colour.C.Green(Get_wxObject(Self)));
    
  end Green;
  
  
  function Blue(Self : in Colour_Type) return Colour_Component_Type is
  
  begin
  
    return Colour_Component_Type(wx.Core.Colour.C.Blue(Get_wxObject(Self)));
    
  end Blue;
  
  
--  function Get_Pixel(Self : in Colour_Type) return


  function Is_Ok(Self : in Colour_Type) return Boolean is
  
  begin
  
    if wx.Core.Colour.C.Ok(Get_wxObject(Self)) = 1 then
    
      return True;
      
    end if;
    
    return False;
    
  end Is_Ok;
  
  
  procedure Set(Self : in out Colour_Type; Red, Green, Blue : in Colour_Component_Type) is
  
  begin
  
    wx.Core.Colour.C.Set(Get_wxObject(Self), Interfaces.C.int(Red), Interfaces.C.int(Green), Interfaces.C.int(Blue));
    
  end Set;


  procedure Finalize(Self : in out Colour_Type)  is

  begin
  
    if Get_wxObject(Self) /= System.Null_Address and Is_wxObject_Owner(Self) = True then
    
      wx.Core.Colour.C.dtor(Get_wxObject(Self));
      
      Set_wxObject(Self, System.Null_Address, False);
    
    end if;
    
  end Finalize;
  
  
  -- Colour Factory.
  function Colour_Factory return Root_WX_Class is
  
  begin
  
    return new Colour_Type;
  
  end Colour_Factory;
  
begin

  wx.Factory.Add_Factory("wxColour", Colour_Factory'Access);
  
end wx.Core.Colour;
