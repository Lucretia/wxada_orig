-- wx-core-colour.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;

package wx.Core.Colour is

  -- This is the actual type (wxColour) we are creating here.
  type Colour_Type is new wx.Base.Object.Object_Type with private;
--  type Colour_Access is access all Colour_Type;
--  type Colour_View is access constant Colour_Type;
  type Colour_Class is access constant Colour_Type;
  
  type Colour_Component_Type is range 0 .. 255;
  
  -- TODO:
  -- This is an Object, don't know what the default values are:
  --   wxNullColour
  -- 
  -- The following are pointers, and are initialised in wxInitializeStockObjects() and destroyed in wxDeleteStockObjects(). If
  -- the application can be decoupled from the wx app init/exit process and controlled through Ada, so can this, i.e. in elaboration code.
  --   wxBLACK, wxWHITE, wxRED, wxBLUE, wxGREEN, wxCYAN, wxLIGHT_GREY

  procedure New_Colour(Self : in out Colour_Type; Red, Green, Blue : in Colour_Component_Type);
  
  function Red(Self : in Colour_Type) return Colour_Component_Type;
  function Green(Self : in Colour_Type) return Colour_Component_Type;
  function Blue(Self : in Colour_Type) return Colour_Component_Type;
--  function Get_Pixel(Self : in Colour_Type) return
  function Is_Ok(Self : in Colour_Type) return Boolean;
  procedure Set(Self : in out Colour_Type; Red, Green, Blue : in Colour_Component_Type);
  
private
  
  type Colour_Type is new wx.Base.Object.Object_Type with null record;
  
  -- TODO: Add Adjust!
  procedure Finalize(Self : in out Colour_Type);
  
  -- TODO: Add Factory!
  
end wx.Core.Colour;
