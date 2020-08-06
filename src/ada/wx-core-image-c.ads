-- wx-core-image-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Image.C is

  function ctor_From_Image(Image : in System.Address) return System.Address;
  pragma Import(C, ctor_From_Image, "wxImage_ctor_From_Image");

  function ctor_From_Filename(
    Filename   : in Interfaces.C.Strings.chars_ptr;
    BitmapType : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor_From_Filename, "wxImage_ctor_From_Filename");

end wx.Core.Image.C;
