with Text_IO;
with wx.Debug;

package body Minimal_App is

  procedure On_Init(Self : in out Minimal_App_Type) is
  
  begin
  
    wx.Debug.On;
  
    Text_IO.Put_Line("[Test.Minimal_App.On_Init]");
    
    wx.Core.App.On_Init(wx.Core.App.App_Type(Self));
    
    Minimal_Frame.New_Minimal_Frame(Self.Frame);
    
    if Minimal_Frame.Show(Self.Frame, True) then
      
      Text_IO.Put_Line("[Test.Minimal_App.On_Init] Success");
    
    end if;
    
  end On_Init;
  
  
  procedure On_Exit(Self : in out Minimal_App_Type) is
  
  begin
  
    Text_IO.Put_Line("[Test.Minimal_App.On_Exit]");
    
    wx.Core.App.On_Exit(wx.Core.App.App_Type(Self));
    
  end On_Exit;
  
end Minimal_App;
