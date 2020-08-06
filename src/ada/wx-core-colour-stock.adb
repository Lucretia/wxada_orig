-- wx-core-colour-stock.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Debug;

package body wx.Core.Colour.Stock is
  
  procedure Initialise_Colours is

  begin

    wx.Debug.Put("[wx.Core.Colour.Stock.Initialise_Colours] Initialising stock colours...");
  
    -- Initialise the global stock objects. The C++ pointers will be done at run time by the init code.
    -- We don't own these pointers because wxWidgets will delete these on the end of the application!
--    Set_wxObject(Black_Colour, wxBlack_Colour, False);
--    Set_wxObject(White_Colour, wxWhite_Colour, False);
--    Set_wxObject(Red_Colour, wxRed_Colour, False);
--    Set_wxObject(Blue_Colour, wxBlue_Colour, False);
--    Set_wxObject(Green_Colour, wxGreen_Colour, False);
--    Set_wxObject(Cyan_Colour, wxCyan_Colour, False);
--    Set_wxObject(Light_Grey_Colour, wxLight_Grey_Colour, False);

    wx.Debug.Put_Line("Done!");
  
  end Initialise_Colours;
  
end wx.Core.Colour.Stock;
