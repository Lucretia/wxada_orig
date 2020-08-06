-- wx-core-root_validator.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Event_Handler;

package wx.Core.Root_Validator is

  -- This is a dummy type which allows us to work around the cyclic dependencies in Window.
  -- This should never be created.
  type Root_Validator_Type is abstract new wx.Base.Event_Handler.Event_Handler_Type with private;
  
private

  type Root_Validator_Type is abstract new wx.Base.Event_Handler.Event_Handler_Type with null record;
  
end wx.Core.Root_Validator;
