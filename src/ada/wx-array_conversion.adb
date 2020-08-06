-- wx-array_conversion.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;

package body wx.Array_Conversion is

  function Convert_Array(From : in From_Array_Type) return To_Array_Type is
  
    function Convert_Element is new Ada.Unchecked_Conversion(Source => From_Type, Target => To_Type);
    
    Result : To_Array_Type(From'Range);
    
  begin
  
    for Index in From'Range loop
    
      Result(Index) := Convert_Element(From(Index));
      
    end loop;
  
    return Result;
    
  end Convert_Array;
  
end wx.Array_Conversion;
