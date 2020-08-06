with wx.Base.Id;
with wx.Core.Frame;
with wx.Core.Button;
with wx.Core.Check_Box;
with wx.Core.Slider;
with wx.Core.Status_Bar;
with wx.Core.Sizer;
with wx.Core.Box_Sizer;
with wx.Core.Panel;
with wx.Core.Spin;
with wx.Core.Scroll_Bar;
with wx.Core.Static_Box;
with wx.Core.Static_Box_Sizer;
--with wx.Core.Pen;
--with wx.Core.Pen.Stock;
with wx.Core.Brush;
with wx.Core.Brush.Stock;
--with wx.Core.Bitmap;
with wx.Core.Image;
--with wx.Core.Validator;
with Test_Event;

package Minimal_Frame is

  type Minimal_Frame_Type is new wx.Core.Frame.Frame_Type with
    record
      Button     : wx.Core.Button.Button_Type;
      Check_Box  : wx.Core.Check_Box.Check_Box_Type;
      Status_Bar : wx.Core.Status_Bar.Status_Bar_Type;
      Slider     : wx.Core.Slider.Slider_Type;
      My_Test    : Test_Event.Test_Event_Type;
      Panel      : wx.Core.Panel.Panel_Type;
      Box        : wx.Core.Static_Box.Static_Box_Type;
      Sizer      : wx.Core.Static_Box_Sizer.Static_Box_Sizer_Type;
      --Sizer      : aliased Box_Sizer_Type;
      Spin       : wx.Core.Spin.Spin_Type;
      Scroll_Bar : wx.Core.Scroll_Bar.Scroll_Bar_Type;
      --Validator  : wx.Core.Validator.Validator_Type;
    end record;

--  Test_Pen    : Pen_Type;
--  Test_Brush  : Brush_Type;
--  Test_Bitmap : Bitmap_Type;
  
  type Minimal_Frame_Access is access all Minimal_Frame_Type;
  type Minimal_Frame_Class is access all Minimal_Frame_Type'Class;

  procedure New_Minimal_Frame(Self : in out Minimal_Frame_Type);
  
  procedure Initialize(Self : in out Minimal_Frame_Type);
--  procedure Finalize(Self : in out Minimal_Frame_Type);
  
end Minimal_Frame;
