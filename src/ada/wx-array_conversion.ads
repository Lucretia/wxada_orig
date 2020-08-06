-- wx-array_conversion.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
generic

  type From_Type is private;
  type From_Array_Type is array (Integer range <>) of From_Type;
  type To_Type is private;
  
package wx.Array_Conversion is

  type To_Array_Type is array(Integer range <>) of aliased To_Type;
  
  function Convert_Array(From : in From_Array_Type) return To_Array_Type;
  
end wx.Array_Conversion;
