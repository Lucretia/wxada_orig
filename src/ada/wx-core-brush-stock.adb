-- wx-core-brush-stock.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Debug;

package body wx.Core.Brush.Stock is
  
  procedure Initialise_Brushes is

  begin

    wx.Debug.Put("[wx.Core.Brush.Stock] Initialising stock brushes...");
  
    -- Initialise the global stock objects. The C++ pointers will be done at run time by the init code.
    -- We don't own these pointers because wxWidgets will delete these on the end of the application!
--    Set_wxObject(Blue_Brush, wxBlue_Brush, False);--True);
--    Set_wxObject(Green_Brush, wxGreen_Brush, False);--True);
--    Set_wxObject(White_Brush, wxWhite_Brush, False);--True);
--    Set_wxObject(Black_Brush, wxBlack_Brush, False);--True);
--    Set_wxObject(Grey_Brush, wxGrey_Brush, False);--True);
--    Set_wxObject(Medium_Grey_Brush, wxMedium_Grey_Brush, False);--True);
--    Set_wxObject(Light_Grey_Brush, wxLight_Grey_Brush, False);--True);
--    Set_wxObject(Transparent_Brush, wxTransparent_Brush, False);--True);
--    Set_wxObject(Cyan_Brush, wxCyan_Brush, False);--True);
--    Set_wxObject(Red_Brush, wxRed_Brush, False);--True);

    wx.Debug.Put_Line("Done!");
  
  end Initialise_Brushes;
  
end wx.Core.Brush.Stock;
