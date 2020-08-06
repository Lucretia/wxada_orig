-- wx-debug.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Text_IO;

package body wx.Debug is

  Debugging_On : Boolean := True;
  

  procedure On is
  
  begin
  
    Debugging_On := True;
  
  end On;
  
  
  procedure Off is
  
  begin
  
    Debugging_On := False;
  
  end Off;
  
  
  procedure Put_Line(Text : in String) is
  
  begin
  
    if Debugging_On = True then
    
      Text_IO.Put_Line(Text);
      
    end if;
    
  end Put_Line;
  
  
  procedure Put(Text : in String) is
  
  begin
  
    if Debugging_On = True then
    
      Text_IO.Put(Text);
      
    end if;
    
  end Put;
  
end wx.Debug;
