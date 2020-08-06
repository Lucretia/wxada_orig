-- wx-base-root_app.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System.Address_To_Access_Conversions;
with wx.Debug;

package body wx.Base.Root_App is

  procedure Set_Result(Result : in Integer) is
  
  begin
  
    wxEntry_Result := Result;
  
    wx.Debug.Put_Line("[wx.Base.Root_App.Set_Result] wxEntry_Result: " & Integer'Image(wxEntry_Result));
    
  end Set_Result;
  
  
  -- Root_App_Virtual_On_Init
  --
  -- Make a proxy virtual call from the C++ app class to the Ada wx.Base.Root_App derived class-wide type to initialise this application object.
  procedure Root_App_Virtual_On_Init(Self : in out Root_App_Type'Class; Success : out Boolean) is
  
  begin
  
    -- TODO: Need to find out what the return value means!
    if wxEntry_Result /= 0 then
    
      raise App_Initialisation_Error;

    else

      Success := True;
    
    end if;
    
    wx.Debug.Put_Line("[wx.Base.Root_App.Root_App_Virtual_On_Init]");
    
    On_Init(Self);
    
  end Root_App_Virtual_On_Init;
  
  
  -- Root_App_Virtual_On_Exit
  --
  -- Make a proxy virtual call from the C++ app class to the Ada wx.Base.Root_App derived class-wide type to clean up this application object.
  procedure Root_App_Virtual_On_Exit(Self : in out Root_App_Type'Class; Success : out Integer) is
  
  begin
  
    wx.Debug.Put_Line("[wx.Base.Root_App.Root_App_Virtual_On_Exit]");
    
    Success := 1;
    
    On_Exit(Self);
    
  end Root_App_Virtual_On_Exit;
    
end wx.Base.Root_App;
