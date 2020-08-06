-- wx-core-scroll_bar.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Window;
with wx.Core.Control;
with wx.Core.Scroll_Event;

package wx.Core.Scroll_Bar is

  -- This is the actual type (wxScrollBar) we are creating here.
  type Scroll_Bar_Type is new wx.Core.Control.Control_Type with private;
--  type Scroll_Bar_Access is access all Scroll_Bar_Type;
--  type Scroll_Bar_View is access constant Scroll_Bar_Type;
  type Scroll_Bar_Class is access all Scroll_Bar_Type'Class;
  
  procedure New_Scroll_Bar(
    Self      : in out Scroll_Bar_Type;
    Id        : in wx.Base.Id.Id_Type;
    Position  : in wx.Core.Point.Point_Type                    := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type                      := wx.Core.Size.Default_Size;
    Style     : in wx.Core.Scroll_Event.Scroll_Bar_Styles_Type := wx.Core.Scroll_Event.Scroll_Bar_Horizontal);
    
  procedure New_Scroll_Bar(
    Self      : in out Scroll_Bar_Type;
    Parent    : in wx.Core.Window.Window_Type'Class;
    Id        : in wx.Base.Id.Id_Type;
    Position  : in wx.Core.Point.Point_Type                    := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type                      := wx.Core.Size.Default_Size;
    Style     : in wx.Core.Scroll_Event.Scroll_Bar_Styles_Type := wx.Core.Scroll_Event.Scroll_Bar_Horizontal);

  function Get_Range(Self : in Scroll_Bar_Type) return Integer;
  function Get_Page_Size(Self : in Scroll_Bar_Type) return Integer;
  function Get_Thumb_Position(Self : in Scroll_Bar_Type) return Integer;
  function Get_Thumb_Size(Self : in Scroll_Bar_Type) return Integer;
  procedure Set_Thumb_Position(Self : in Scroll_Bar_Type; View_Start : in Integer);
  procedure Set_Scroll_Bar(Self : in Scroll_Bar_Type; Position, Thumb_Size, Max_Range, Page_Size : in Integer; Refresh : in Boolean := True);
  
private

  type Scroll_Bar_Type is new wx.Core.Control.Control_Type with null record;
  
end wx.Core.Scroll_Bar;
