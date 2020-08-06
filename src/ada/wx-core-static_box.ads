-- wx-core-static_box.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Size;
with wx.Core.Point;
with wx.Core.Control;
with wx.Core.Window;

package wx.Core.Static_Box is

  -- This is the actual type (wxStaticBox) we are creating here.
  type Static_Box_Type is new wx.Core.Control.Control_Type with private;
--  type Static_Box_Access is access all Static_Box_Type;
--  type Static_Box_View is access constant Static_Box_Type;
  type Static_Box_Class is access all Static_Box_Type'Class;
  
  -- Window styles.
  subtype Static_Box_Styles_Type is wx.Core.Window.Window_Styles_Type;

  procedure New_Static_Box(
    Self     : in out Static_Box_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Static_Box_Styles_Type   := 0);
  
private

  type Static_Box_Type is new wx.Core.Control.Control_Type with null record;
  
end wx.Core.Static_Box;
