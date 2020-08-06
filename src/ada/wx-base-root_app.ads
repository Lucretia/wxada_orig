-- wx-base-root_app.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event_Handler;

package wx.Base.Root_App is

  -- This is the root application type.
  type Root_App_Type is abstract new wx.Base.Event_Handler.Event_Handler_Type with private;
  type Root_App_Class is access all Root_App_Type'Class;
  
  App_Initialisation_Error : exception;

  procedure On_Init(Self : in out Root_App_Type) is abstract;
  procedure On_Exit(Self : in out Root_App_Type) is abstract;
  
  procedure Set_Result(Result : in Integer);
  pragma Inline(Set_Result);
  
private

  wxEntry_Result : Integer := 0;  -- Return value from wxEntry.
  
  type Root_App_Type is abstract new wx.Base.Event_Handler.Event_Handler_Type with null record;
  
  procedure Root_App_Virtual_On_Init(Self : in out Root_App_Type'Class; Success : out Boolean);
  pragma Export(C, Root_App_Virtual_On_Init, "Root_App_Virtual_On_Init");
  
  procedure Root_App_Virtual_On_Exit(Self : in out Root_App_Type'Class; Success : out Integer);
  pragma Export(C, Root_App_Virtual_On_Exit, "Root_App_Virtual_On_Exit");
    
end wx.Base.Root_App;
