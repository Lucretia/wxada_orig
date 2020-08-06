-- wx-core-bitmap.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Core.GDI;

package wx.Core.Bitmap is

  -- This is the actual type (wxBitmap) we are creating here.
  type Bitmap_Type is new wx.Core.GDI.GDI_Type with private;
--  type Bitmap_Access is access all Bitmap_Type;
--  type Bitmap_View is access constant Bitmap_Type;
  type Bitmap_Class is access all Bitmap_Type'Class;
  
  type Bitmap_Format_Type is (
    Invalid,
    Bmp,
    Bmp_Resource,
    Ico,
    Ico_Resource,
    Cur,
    Cur_Resource,
    Xbm,
    Xbm_Resource,
    Xpm,
    Xpm_Resource,
    Tif,
    Tif_Resource,
    Gif,
    Gif_Resource,
    Png,
    Png_Resource,
    Jpeg,
    Jpeg_Resource,
    Pnm,
    Pnm_Resource,
    Pcx,
    Pcx_Resource,
    Pict,
    Pict_Resource,
    Icon,
    Icon_Resource,
    Ani,
    Iff,
    Mac_Cursor,
    Mac_Cursor_Resource,
    Any);
  for Bitmap_Format_Type use (
    Invalid => 0,
    Bmp => 1,
    Bmp_Resource => 2,
    Ico => 3,
    Ico_Resource => 4,
    Cur => 5,
    Cur_Resource => 6,
    Xbm => 7,
    Xbm_Resource => 8,
    Xpm => 9,
    Xpm_Resource => 10,
    Tif => 11,
    Tif_Resource => 12,
    Gif => 13,
    Gif_Resource => 14,
    Png => 15,
    Png_Resource => 16,
    Jpeg => 17,
    Jpeg_Resource => 18,
    Pnm => 19,
    Pnm_Resource => 20,
    Pcx => 21,
    Pcx_Resource => 22,
    Pict => 23,
    Pict_Resource => 24,
    Icon => 25,
    Icon_Resource => 26,
    Ani => 27,
    Iff => 28,
    Mac_Cursor => 29,
    Mac_Cursor_Resource => 30,
    Any => 50);
    
--  procedure New_Bitmap(Self : in out Bitmap_Type);
  procedure New_Bitmap(Self : in out Bitmap_Type; Source : in Bitmap_Type);
--  procedure New_Bitmap(Self : in out Bitmap_Type; Bits : in ; Width, Height : in Natural);
--  procedure New_Bitmap(Self : in out Bitmap_Type; Bits : in ;);
  procedure New_Bitmap(Self : in out Bitmap_Type; Filename : in String; Format : in Bitmap_Format_Type);
--  procedure New_Bitmap(Self : in out Bitmap_Type; Image : in Image_Type);

--  function Convert_To_Image(Self : in Bitmap_Type) return Image_Class;
--  function Copy_From_Icon(Self : in Bitmap_Type; Icon : in Icon_Type) return Boolean;
  function Get_Depth(Self : in Bitmap_Type) return Integer;
  function Get_Height(Self : in Bitmap_Type) return Integer;
--  function Get_Palette(Self : in Bitmap_Type) return Palette_Class;
--  function Get_Mask(Self : in Bitmap_Type) return Mask_Class;
  function Get_Width(Self : in Bitmap_Type) return Integer;
  procedure Init_Standard_Handlers;
  --procedure Get_Sub_Bitmap(Self : in Bitmap_Type; Area : in Rect_Type; Sub_Bitmap : out Bitmap_Type);
  function Is_Ok(Self : in Bitmap_Type) return Boolean;
  procedure Set_Depth(Self : in Bitmap_Type; Depth : in Integer);
  procedure Set_Height(Self : in Bitmap_Type; Height : in Integer);
--  procedure Set_Mask(Self : in Bitmap_Type; Mask : in Mask_Type);
--  procedure Set_Palette(Self : in Bitmap_Type; Palette : in Palette_Type);
  procedure Set_Width(Self : in Bitmap_Type; Width : in Integer);
 
private
  
  type Bitmap_Type is new wx.Core.GDI.GDI_Type with null record;
  
end wx.Core.Bitmap;
