-- wx-core-colour-stock.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
package wx.Core.Colour.Stock is

  pragma Elaborate_Body(wx.Core.Colour.Stock);
  
--  Null_Colour       : Colour_Type;
--  Black_Colour      : Colour_Type;
--  White_Colour      : Colour_Type;
--  Red_Colour        : Colour_Type;
--  Blue_Colour       : Colour_Type;
--  Green_Colour      : Colour_Type;
--  Cyan_Colour       : Colour_Type;
--  Light_Grey_Colour : Colour_Type;

  procedure Initialise_Colours;
    
private
  
--  wxNull_Colour       : System.Address;
--  wxBlack_Colour      : System.Address;
--  wxWhite_Colour      : System.Address;
--  wxRed_Colour        : System.Address;
--  wxBlue_Colour       : System.Address;
--  wxGreen_Colour      : System.Address;
--  wxCyan_Colour       : System.Address;
--  wxLight_Grey_Colour : System.Address;

--  pragma Import(C, wxNull_Colour, "");
--  pragma Import(C, wxBlack_Colour, "wxBLACK");
--  pragma Import(C, wxWhite_Colour, "wxWHITE");
--  pragma Import(C, wxRed_Colour, "wxRED");
--  pragma Import(C, wxBlue_Colour, "wxBLUE");
--  pragma Import(C, wxGreen_Colour, "wxGREEN");
--  pragma Import(C, wxCyan_Colour, "wxCYAN");
--  pragma Import(C, wxLight_Grey_Colour, "wxLIGHT_GREY");
  
end wx.Core.Colour.Stock;
