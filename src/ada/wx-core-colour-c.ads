-- wx-core-colour-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;

private package wx.Core.Colour.C is

  function ctor(Red, Green, Blue : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxColour_ctor");
    
  procedure dtor(Self : in System.Address);
  pragma Import(C, dtor, "wxColour_dtor");
    
  function Red(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Red, "wxColour_Red");
    
  function Green(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Green, "wxColour_Green");
    
  function Blue(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Blue, "wxColour_Blue");
    
  function Ok(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Ok, "wxColour_Ok");
    
  procedure Set(Self : in System.Address; Red, Green, Blue : in Interfaces.C.int);
  pragma Import(C, Set, "wxColour_Set");
    
end wx.Core.Colour.C;
