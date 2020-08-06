-- wx-core-app.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.App_Console;

package wx.Core.App is

  -- This is the actual type (wxApp) we are creating here.
  type App_Type is new wx.Base.App_Console.App_Console_Type with private;

  procedure New_App(Self : in out App_Type);
  
  procedure On_Init(Self : in out App_Type);
  procedure On_Exit(Self : in out App_Type);
  
private

  type App_Type is new wx.Base.App_Console.App_Console_Type with null record;
  
--  procedure Initialize(Self : in out App_Type);
  procedure Finalize(Self : in out App_Type);
  
end wx.Core.App;
