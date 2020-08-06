-- wx-core-bitmap.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Bitmap.C;

use type Interfaces.C.int;

package body wx.Core.Bitmap is
  
  function Bitmap_Format_Type_C_int is new Ada.Unchecked_Conversion(Source => Bitmap_Format_Type, Target => Interfaces.C.int);
  
  procedure New_Bitmap(Self : in out Bitmap_Type; Source : in Bitmap_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Bitmap.C.ctor_From_Bitmap(Get_wxObject(Source)), True);
    
  end New_Bitmap;

    
  procedure New_Bitmap(Self : in out Bitmap_Type; Filename : in String; Format : in Bitmap_Format_Type) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Bitmap.C.ctor_From_Filename(Interfaces.C.Strings.New_String(Filename), Bitmap_Format_Type_C_int(Format)),
      True);
    
  end New_Bitmap;

  
  function Get_Depth(Self : in Bitmap_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Bitmap.C.GetDepth(Get_wxObject(Self)));
    
  end Get_Depth;
  
  
  function Get_Height(Self : in Bitmap_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Bitmap.C.GetHeight(Get_wxObject(Self)));
    
  end Get_Height;
  
  
  function Get_Width(Self : in Bitmap_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Bitmap.C.GetWidth(Get_wxObject(Self)));
    
  end Get_Width;

    
  procedure Init_Standard_Handlers is
  
  begin
  
    wx.Core.Bitmap.C.InitStandardHandlers;
    
  end Init_Standard_Handlers;
  

--  procedure Get_Sub_Bitmap(Self : in Bitmap_Type; Area : in Rect_Type; Sub_Bitmap : out Bitmap_Type) is
  
--  begin
  
--    Set_wxObject(
--      Sub_Bitmap,
--      GetSubBitmap(
--        Get_wxObject(Self),
--        Rect_Type'(x1, y1, x2, y2)),
--      True);
      
--  end Get_Sub_Bitmap;
  
  
  function Is_Ok(Self : in Bitmap_Type) return Boolean is
  
  begin
  
    if wx.Core.Bitmap.C.Ok(Get_wxObject(Self)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Ok;
  
  
  procedure Set_Depth(Self : in Bitmap_Type; Depth : in Integer) is
  
  begin
  
    wx.Core.Bitmap.C.SetDepth(Get_wxObject(Self), Interfaces.C.int(Depth));
    
  end Set_Depth;
  
  
  procedure Set_Height(Self : in Bitmap_Type; Height : in Integer) is
  
  begin
  
    wx.Core.Bitmap.C.SetHeight(Get_wxObject(Self), Interfaces.C.int(Height));
    
  end Set_Height;
  
  
  procedure Set_Width(Self : in Bitmap_Type; Width : in Integer) is
  
  begin
  
    wx.Core.Bitmap.C.SetWidth(Get_wxObject(Self), Interfaces.C.int(Width));
    
  end Set_Width;
  
  
  -- Bitmap_Factory.
  function Bitmap_Factory return Root_WX_Class is
  
  begin
  
    return new Bitmap_Type;
  
  end Bitmap_Factory;
  
begin

  wx.Factory.Add_Factory("wxBitmap", Bitmap_Factory'Access);
  
end wx.Core.Bitmap;
