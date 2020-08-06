-- wx-core-image.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Image.C;

use type Interfaces.C.int;

package body wx.Core.Image is
  
  function Bitmap_Format_Type_C_int is new Ada.Unchecked_Conversion(
    Source => wx.Core.Bitmap.Bitmap_Format_Type,
    Target => Interfaces.C.int);
  
  procedure New_Image(Self : in out Image_Type; Source : in Image_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Image.C.ctor_From_Image(Get_wxObject(Source)), True);
    
  end New_Image;

    
  procedure New_Image(Self : in out Image_Type; Filename : in String; Format : in wx.Core.Bitmap.Bitmap_Format_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Image.C.ctor_From_Filename(Interfaces.C.Strings.New_String(Filename), Bitmap_Format_Type_C_int(Format)),
      True);
    
  end New_Image;

  
  -- Image_Factory.
  function Image_Factory return Root_WX_Class is
  
  begin
  
    return new Image_Type;
  
  end Image_Factory;
  
begin

  wx.Factory.Add_Factory("wxImage", Image_Factory'Access);
  
end wx.Core.Image;
