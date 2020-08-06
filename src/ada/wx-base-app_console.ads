-- wx-base-app_console.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event_Handler;
with wx.Base.Root_App;

package wx.Base.App_Console is

  -- This is the actual type (wxAppConsole) we are creating here.
  type App_Console_Type is new wx.Base.Root_App.Root_App_Type with private;

  procedure New_App_Console(Self : in out App_Console_Type);
  
  procedure On_Init(Self : in out App_Console_Type);
  procedure On_Exit(Self : in out App_Console_Type);
  
private

  type App_Console_Type is new wx.Base.Root_App.Root_App_Type with null record;
  
--  procedure Initialize(Self : in out App_Console_Type);
  procedure Finalize(Self : in out App_Console_Type);
  
end wx.Base.App_Console;
