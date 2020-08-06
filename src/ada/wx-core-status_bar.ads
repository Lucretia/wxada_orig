-- wx-core-status_bar.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Rect;
with wx.Core.Window;

package wx.Core.Status_Bar is

  -- This is the actual type (wxStatusBar) we are creating here.
  type Status_Bar_Type is new wx.Core.Window.Window_Type with private;
--  type Status_Bar_Access is access all Status_Bar_Type;
--  type Status_Bar_View is access constant Status_Bar_Type;
  type Status_Bar_Class is access all Status_Bar_Type'Class;
  
  type Status_Bar_Styles_Type is new wx.Core.Window.Window_Styles_Type;
  
  Size_Grip : constant Status_Bar_Styles_Type := 16#0000_0010#;
  
  type Field_Widths_Array is array(Integer range <>) of Integer;
  type Field_Styles_Array is array(Integer range <>) of Integer;
  
  procedure New_Status_Bar(
    Self     : in out Status_Bar_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Style    : in Status_Bar_Styles_Type := Size_Grip);
  
  procedure Get_Field_Rect(Self : in Status_Bar_Type; Field : in Integer; Dimensions : out wx.Core.Rect.Rect_Type);
  function Get_Fields_Count(Self : in Status_Bar_Type) return Integer;
  function Get_Status_Text(Self : in Status_Bar_Type; Field : in Integer := 0) return String;
  procedure Pop_Status_Text(Self : in Status_Bar_Type; Field : in Integer := 0);
  procedure Push_Status_Text(Self : in Status_Bar_Type; Text : in String; Field : in Integer := 0);
  procedure Set_Fields_Count(Self : in Status_Bar_Type; Total : in Integer := 1);
  procedure Set_Fields_Count(Self : in Status_Bar_Type; Widths : in Field_Widths_Array);
  procedure Set_Min_Height(Self : in Status_Bar_Type; Height : in Integer);
  procedure Set_Status_Text(Self : in Status_Bar_Type; Text : in String; Field : in Integer := 0);
  procedure Set_Status_Widths(Self : in Status_Bar_Type; Widths : in Field_Widths_Array);
  procedure Set_Status_Styles(Self : in Status_Bar_Type; Styles : in Field_Styles_Array);

private

  type Status_Bar_Type is new wx.Core.Window.Window_Type with null record;
  
end wx.Core.Status_Bar;
