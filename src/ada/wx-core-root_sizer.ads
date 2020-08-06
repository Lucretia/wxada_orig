-- wx-core-root_sizer.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;

package wx.Core.Root_Sizer is

  -- This is a dummy type which allows us to work around the cyclic dependencies in Window.
  -- This should never be created.
  type Root_Sizer_Type is abstract new wx.Base.Object.Object_Type with private;
  
private

  type Root_Sizer_Type is abstract new wx.Base.Object.Object_Type with null record;
  
end wx.Core.Root_Sizer;
