-- wx-core-image.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;
with wx.Core.Bitmap;

package wx.Core.Image is

  -- This is the actual type (wxImage) we are creating here.
  type Image_Type is new wx.Base.Object.Object_Type with private;
--  type Image_Access is access all Image_Type;
--  type Image_View is access constant Image_Type;
  type Image_Class is access all Image_Type'Class;
  
  procedure New_Image(Self : in out Image_Type; Source : in Image_Type);
  procedure New_Image(Self : in out Image_Type; Filename : in String; Format : in wx.Core.Bitmap.Bitmap_Format_Type);

  procedure Init_All_Image_Handlers;
 
private
  
  type Image_Type is new wx.Base.Object.Object_Type with null record;
  
  pragma Import(C, Init_All_Image_Handlers, "wxImage_wxInitAllImageHandlers");
    
end wx.Core.Image;
