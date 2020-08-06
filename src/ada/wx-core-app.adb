-- wx-core-app.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System.Address_To_Access_Conversions;
with wx.Debug;
with wx.Base.Init;
with wx.Base.Root_App;
with wx.Core.Brush.Stock;
with wx.Core.Pen.Stock;
with wx.Core.Colour.Stock;
with wx.Core.App.C;

package body wx.Core.App is

  procedure New_App(Self : in out App_Type) is
  
    package Convert is new System.Address_To_Access_Conversions(App_Type'Class);
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.App.New_App]");
    
    Set_wxObject(Self, wx.Core.App.C.ctor(Convert.To_Address(Self'Unchecked_Access)), True);
    
    wx.Base.Root_App.Set_Result(wx.Base.Init.wxEntry);
  
  end New_App;
  
  
  procedure On_Init(Self : in out App_Type) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.App.On_Init]");
    
    wx.Core.Colour.Stock.Initialise_Colours;
    wx.Core.Pen.Stock.Initialise_Pens;
    wx.Core.Brush.Stock.Initialise_Brushes;
    
  end On_Init;
  
  
  procedure On_Exit(Self : in out App_Type) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.App.On_Exit]");
    
  end On_Exit;
  
  
  -- Initialize
--  procedure Initialize(Self : in out App_Type) is
  
--  begin
  
--    wx.Debug.Put_Line("[wx.Core.App.Initialize]");
    
--  end Initialize;
  
  
  -- Finalize
  procedure Finalize(Self : in out App_Type) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.App.Finalize]");
    
    wx.Base.Init.Clean_Up;
    --Inside wxEntryCleanup() "delete wxTheApp;" is called!!
    --wx.Core.App.C.dtor(Self.wxCXX_Object);
    
    wx.Debug.Put_Line("[wx.Core.App.Finalize] 2");
    
    Set_wxObject(Self, System.Null_Address, False);
    
    wx.Debug.Put_Line("[wx.Core.App.Finalize] 3");
    
  end Finalize;

end wx.Core.App;
