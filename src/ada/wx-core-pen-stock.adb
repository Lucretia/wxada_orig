-- wx-core-pen.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Debug;

package body wx.Core.Pen.Stock is
  
  procedure Initialise_Pens is

  begin

    wx.Debug.Put("[wx.Core.Pen.Stock.Initialise_Pens] Initialising stock pens...");
  
    -- Initialise the global stock objects. The C++ pointers will be done at run time by the init code.
    -- We don't own these pointers because wxWidgets will delete these on the end of the application!
--    Set_wxObject(Red_Pen, wxRed_Pen, False);--True);
--    Set_wxObject(Cyan_Pen, wxCyan_Pen, False);--True);
--    Set_wxObject(Green_Pen, wxGreen_Pen, False);--True);
--    Set_wxObject(Black_Pen, wxBlack_Pen, False);--True);
--    Set_wxObject(White_Pen, wxWhite_Pen, False);--True);
--    Set_wxObject(Transparent_Pen, wxTransparent_Pen, False);--True);
--    Set_wxObject(Black_Dashed_Pen, wxBlack_Dashed_Pen, False);--True);
--    Set_wxObject(Grey_Pen, wxGrey_Pen, False);--True);
--    Set_wxObject(Medium_Grey_Pen, wxMedium_Grey_Pen, False);--True);
--    Set_wxObject(Light_Grey_Pen, wxLight_Grey_Pen, False);--True);

    wx.Debug.Put_Line("Done!");
  
  end Initialise_Pens;
  
end wx.Core.Pen.Stock;
