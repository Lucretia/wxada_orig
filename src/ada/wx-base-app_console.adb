-- wx-base-app_console.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System.Address_To_Access_Conversions;
with wx.Debug;
with wx.Base.App_Console.C;

package body wx.Base.App_Console is

  procedure New_App_Console(Self : in out App_Console_Type) is
  
    package Convert is new System.Address_To_Access_Conversions(App_Console_Type'Class);
    
  begin
  
    wx.Debug.Put_Line("[wx.Base.App.New_App_Console]");
    
    Set_wxObject(Self, wx.Base.App_Console.C.ctor(Convert.To_Address(Self'Unchecked_Access)), True);
    
  end New_App_Console;
  
  
  procedure On_Init(Self : in out App_Console_Type) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.App.On_Console_Init]");
    
  end On_Init;
  
  
  procedure On_Exit(Self : in out App_Console_Type) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Base.App.On_Exit]");
    
  end On_Exit;
  
  
  -- Initialize
--  procedure Initialize(Self : in out App_Console_Type) is
  
--    package Convert is new System.Address_To_Access_Conversions(App_Console_Type'Class);
    
--  begin
  
--    wx.Debug.Put_Line("[wx.Base.App.Initialize]");
    
--    Set_wxObject(Self, wx.Base.App_Console.C.ctor(Convert.To_Address(Self'Unchecked_Access)), True);
    
--  end Initialize;
  
  
  -- Finalize
  procedure Finalize(Self : in out App_Console_Type) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Base.App.Finalize]");
    
    --Inside wxEntryCleanup() "delete wxTheApp;" is called!!
    --wx.Base.App_Console.C.dtor(Self.wxCXX_Object);
    
    wx.Debug.Put_Line("[wx.Base.App.Finalize] 2");
    
    Set_wxObject(Self, System.Null_Address, False);
    
    wx.Debug.Put_Line("[wx.Base.App.Finalize] 3");
    
  end Finalize;

end wx.Base.App_Console;
