-- wx-core-slider.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Window;
with wx.Core.Control;
with wx.Base.Event;

package wx.Core.Slider is

  -- This is the actual type (wxSlider) we are creating here.
  type Slider_Type is new wx.Core.Control.Control_Type with private;
--  type Slider_Access is access all Slider_Type;
--  type Slider_View is access constant Slider_Type;
  type Slider_Class is access all Slider_Type'Class;
  
  -- Slider styles.
  subtype Slider_Styles_Type is wx.Core.Window.Window_Styles_Type;
  
  Slider_Horizontal : constant Slider_Styles_Type := 16#0000_0004#;
  Slider_Vertical   : constant Slider_Styles_Type := 16#0000_0008#;
  Slider_Auto_Ticks : constant Slider_Styles_Type := 16#0000_0010#;
  Slider_Labels     : constant Slider_Styles_Type := 16#0000_0020#;
  Slider_Left       : constant Slider_Styles_Type := 16#0000_0040#;
  Slider_Right      : constant Slider_Styles_Type := 16#0000_0100#;
  Slider_Top        : constant Slider_Styles_Type := 16#0000_0080#;
  Slider_Sel_Range  : constant Slider_Styles_Type := 16#0000_0800#;
  Slider_Inverse    : constant Slider_Styles_Type := 16#0000_1000#;
  
  -- Events.
  Evt_Slider : constant wx.Base.Event.Event_Id_Type;

  procedure New_Slider(
    Self      : in out Slider_Type;
    Id        : in wx.Base.Id.Id_Type;
    Value,
    Min_Value,
    Max_Value : in Integer;
    Position  : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style     : in Slider_Styles_Type       := Slider_Horizontal);
    
  procedure New_Slider(
    Self      : in out Slider_Type;
    Parent    : in wx.Core.Window.Window_Type'Class;
    Id        : in wx.Base.Id.Id_Type;
    Value,
    Min_Value,
    Max_Value : in Integer;
    Position  : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style     : in Slider_Styles_Type       := Slider_Horizontal);

  
  procedure Clear_Selection(Self : in Slider_Type);
  procedure Clear_Ticks(Self : in Slider_Type);
  function Get_Line_Size(Self : in Slider_Type) return Integer;
  function Get_Max(Self : in Slider_Type) return Integer;
  function Get_Min(Self : in Slider_Type) return Integer;
  function Get_Page_Size(Self : in Slider_Type) return Integer;
  function Get_Sel_End(Self : in Slider_Type) return Integer;
  function Get_Sel_Start(Self : in Slider_Type) return Integer;
  function Get_Thumb_Length(Self : in Slider_Type) return Integer;
  function Get_Tick_Frequency(Self : in Slider_Type) return Integer;
  function Get_Value(Self : in Slider_Type) return Integer;
  procedure Set_Range(Self : in Slider_Type; Min_Value, Max_Value : in Integer);
  procedure Set_Tick_Frequency(Self : in Slider_Type; Frequency, Position : in Integer);
  procedure Set_Line_Size(Self : in Slider_Type; Line_Size : in Integer);
  procedure Set_Page_Size(Self : in Slider_Type; Page_Size : in Integer);
  procedure Set_Selection(Self : in Slider_Type; Start_Position, End_Position : in Integer);
  procedure Set_Thumb_Length(Self : in Slider_Type; Length : in Integer);
  procedure Set_Tick_Position(Self : in Slider_Type; Tick_Position : in Integer);
  procedure Set_Value(Self : in Slider_Type; Value : in Integer);
  
private

  type Slider_Type is new wx.Core.Control.Control_Type with null record;

  pragma Import(C, Evt_Slider, "wxEVT_COMMAND_SLIDER_UPDATED");
  
end wx.Core.Slider;
