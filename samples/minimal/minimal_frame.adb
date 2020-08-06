with Text_IO;
with System.Address_Image;
with System.Address_To_Access_Conversions;
with wx.Base.Id;
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Event_Handler;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Size_Event;
with wx.Core.Scroll_Event;
with wx.Core.Paint_Event;
--with wx.Core.Control; use wx.Core.Control;
with wx.Core.Window;
with wx.Core.DC;
with wx.Core.Paint_DC;
--with wx.Core.Client_DC; use wx.Core.Client_DC;
with wx.Core.Colour;
--with wx.Core.Colour.Stock;
with wx.Core.Sizer;
with wx.Core.Spin;

--use type wx.Base.EvtHandler.Event_Handler_Type;

--use type wx.Base.Id.Id_Type;
use type wx.Base.Id.Id_User_Range_Upper;
use type wx.Core.Sizer.Sizer_Flag_Type;
use type wx.Core.Spin.Spin_Styles_Type;

package body Minimal_Frame is

  package wxEvtHandler renames wx.Base.Event_Handler;
  
  Frame : wx.Core.Frame.Frame_Type;
    
  procedure On_Quit(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out wx.Base.Command_Event.Command_Event_Type) is
  
  begin
  
    Text_IO.Put_Line("On_Quit");
    --Add_Pending_Event(Self.all, Event_Type(Minimal_Frame_Type(Self.all).My_Test));
    
    wx.Core.Frame.New_Frame(Frame, wx.Base.Id.Id_Any, "Test");
    
    if wx.Core.Frame.Show(Frame, True) = True then
    
      null;
    
    end if;
      
    --wx.Base.Event_Handler.Add_Pending_Event(Self.all, wx.Base.Event.Event_Type(Minimal_Frame_Type(Self.all).My_Test));
    if wx.Base.Event_Handler.Process_Event(Self.all, wx.Base.Event.Event_Type(Minimal_Frame_Type(Self.all).My_Test)) = True then

      Text_IO.Put_Line("On_Quit Processed Event");
      
    end if;
    
    Text_IO.Put_Line("On_Quit Exit");
    
  end On_Quit;
  
  
  type On_My_Test_Function is access procedure(
    Self  : access wx.Base.Event_Handler.Event_Handler_Type'Class;
    Event : in out Test_Event.Test_Event_Type);
  
  procedure On_My_Test(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out Test_Event.Test_Event_Type) is
  
  begin
  
    Text_IO.Put_Line("On_My_Test: Blah = " & Integer'Image(Event.Blah));
    
  end On_My_Test;
  
  
  procedure On_Scroll_Top(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out wx.Core.Scroll_Event.Scroll_Event_Type) is
  
  begin
  
    Text_IO.Put_Line("On_Scroll_Top");
  
  end On_Scroll_Top;
  
  
  procedure On_About(Event : in out wx.Base.Command_Event.Command_Event_Type) is
  
  begin
  
    Text_IO.Put_Line("On_About");
    
  end On_About;


  procedure On_Size(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out wx.Core.Size_Event.Size_Event_Type) is
  
    Size : wx.Core.Size.Size_Type := wx.Core.Size_Event.Get_Size(Event);
    
  begin
  
    Text_IO.Put_Line("On_Size: (" & wx.Core.Point.Coord_Type'Image(Size.Width) & ", " & wx.Core.Point.Coord_Type'Image(Size.Height) & ")");
    wx.Core.Size_Event.Skip(Event, True);
    
  end On_Size;
  
    
  procedure On_Paint(Self : access wx.Base.Event_Handler.Event_Handler_Type'Class; Event : in out wx.Core.Paint_Event.Paint_Event_Type) is
  
    DC     : wx.Core.Paint_DC.Paint_DC_Type;
    Colour : wx.Core.Colour.Colour_Type;
    
  begin
  
    Text_IO.Put_Line("On_Paint");
    
    wx.Core.Paint_DC.New_Paint_DC(DC, wx.Core.Window.Window_Type(Self.all));
    wx.Core.Colour.New_Colour(Colour, 255, 0, 0);
    
    wx.Core.Paint_DC.Begin_Drawing(DC);
--    wx.Core.Paint_DC.Set_Background(DC, wx.Core.Brush.Stock.Cyan_Brush);
    
--    Clear(DC);
    
--    if Flood_Fill(DC, Point_Type'(5, 50), Colour, Surface) = True then
    
--      Text_IO.Put_Line("Flood fill worked!");
      
--    end if;
    
--    Set_Pen(DC, Test_Pen);
--    Draw_Line(DC, Point_Type'(20, 80), Point_Type'(200, 80));
--    Set_Text_Foreground(DC, White_Colour);
--    Set_Text_Background(DC, Black_Colour);
--    Draw_Bitmap(DC, Test_Bitmap, Point_Type'(100, 100), True);
  
    wx.Core.Paint_DC.End_Drawing(DC);
    
  end On_Paint;
  
  
  Id_Test_Button : wx.Base.Id.Id_User_Range_Upper := wx.Base.Id.Id_User_Range_Upper'First + 1;
  Id_Test_Slider : wx.Base.Id.Id_User_Range_Upper := wx.Base.Id.Id_User_Range_Upper'First + 2;

    
  procedure New_Minimal_Frame(Self : in out Minimal_Frame_Type) is
  
    procedure Button_Connect is new wxEvtHandler.Connect(wx.Base.Command_Event.Command_Event_Function);
    procedure Check_Box_Connect is new wxEvtHandler.Connect(wx.Base.Command_Event.Command_Event_Function);
    procedure My_Test_Connect is new wxEvtHandler.Connect(On_My_Test_Function);
    procedure Slider_Connect is new wxEvtHandler.Connect(wx.Core.Scroll_Event.Scroll_Event_Function);
    procedure Size_Connect is new wxEvtHandler.Connect(wx.Core.Size_Event.Size_Event_Function);
    procedure Paint_Connect is new wxEvtHandler.Connect(wx.Core.Paint_Event.Paint_Event_Function);
    
    Field_Widths : wx.Core.Status_Bar.Field_Widths_Array(0 .. 1) := (-3, -1);
    
    package Address_To_Object is new System.Address_To_Access_Conversions(Minimal_Frame_Type);
    use Address_To_Object;

    X : wx.Core.Point.Coord_Type := 101;
    Y : wx.Core.Point.Coord_Type := 234;
    
  begin
  
    wx.Core.Frame.New_Frame(wx.Core.Frame.Frame_Type(Self), wx.Base.Id.Id_Any, "Minimal wxAda App", wx.Core.Point.Point_Type'(400, 300));
    Text_IO.Put_Line("Self'Access : " & System.Address_Image(To_Address(Self'Access)));
    
    Client_To_Screen(Self, X, Y);
    
--    New_Pen(Test_Pen, Colour => Green_Colour, Width => 2, style => Dot_Dash);
    
--    if Is_Ok(Test_Pen) = True then
    
--      Text_IO.Put_Line("Test_Pen is ok!");
    
--    else
    
--      Text_IO.Put_Line("Test_Pen is not ok!");
    
--    end if;
    
--    New_Brush(Test_Brush, Colour => "Blue", style => Cross_Diagonal_Hatch);
    
--    if Is_Ok(Test_Brush) = True then
    
--      Text_IO.Put_Line("Test_Brush is ok!");
    
--    else
    
--      Text_IO.Put_Line("Test_Brush is not ok!");
    
--    end if;
    
--    New_Bitmap(Test_Bitmap, "test.jpg", Bmp);
    
--    if Is_Ok(Test_Bitmap) = True then
    
--      Text_IO.Put_Line("Test_Bitmap is ok!");
    
--    else
    
--      Text_IO.Put_Line("Test_Bitmap is not ok!");
    
--    end if;
    
    wx.Core.Panel.New_Panel(Self.Panel, Self, wx.Base.Id.Id_Any);
    
    --wx.Core.Validator.New_Validator(Self.Validator);
    
    wx.Core.Button.New_Button(
      Self.Button,
      Self.Panel,
      wx.Base.Id.Id_Type(Id_Test_Button),
      "Test &Button",
      wx.Core.Point.Default_Position,
      wx.Core.Size.Default_Size,
      0);
      
    --wx.Core.Button.Set_Validator(Self.Button, Self.Validator);
    
    wx.Core.Check_Box.New_Check_Box(
      Self.Check_Box,
      Self.Panel,
      wx.Base.Id.Id_Any,
      "Test &Check Box",
      Style => wx.Core.Check_Box.Check_Box_Align_Right);
      
    wx.Core.Slider.New_Slider(
      Self.Slider,
      Self.Panel,
      wx.Base.Id.Id_Any,
      50,
      0,
      100,
      Style => wx.Core.Slider.Slider_Horizontal or wx.Core.Slider.Slider_Labels);
      
    wx.Core.Spin.New_Spin(
      Self.Spin,
      Self.Panel,
      wx.Base.Id.Id_Any,
      "0",
      Style => wx.Core.Spin.Spin_Wrap or wx.Core.Spin.Spin_Arrow_Keys);
      
    wx.Core.Scroll_Bar.New_Scroll_Bar(Self.Scroll_Bar, Self.Panel, wx.Base.Id.Id_Type(Id_Test_Slider));
    wx.Core.Scroll_Bar.Set_Scroll_Bar(Self.Scroll_Bar, 20, 10, 100, 1000);
    
    wx.Core.Static_Box.New_Static_Box(Self.Box, Self.Panel, wx.Base.Id.Id_Any, "Testing...");
    wx.Core.Static_Box_Sizer.New_Static_Box_Sizer(Self.Sizer, Self.Box, wx.Core.Box_Sizer.Box_Sizer_Orientation_Vertical);
    --New_Box_Sizer(Self.Sizer, Box_Sizer_Orientation_Vertical);
    
    wx.Core.Static_Box_Sizer.Add(
      Self.Sizer,
      Self.Button,
      1,
      wx.Core.Sizer.Sizer_Expand or wx.Core.Sizer.Sizer_Border_All,
      5);
      
    wx.Core.Static_Box_Sizer.Add(
      Self.Sizer,
      Self.Check_Box,
      1,
      wx.Core.Sizer.Sizer_Expand or wx.Core.Sizer.Sizer_Border_All,
      5);
      
    wx.Core.Static_Box_Sizer.Add(
      Self.Sizer,
      Self.Slider,
      1,
      wx.Core.Sizer.Sizer_Expand or wx.Core.Sizer.Sizer_Border_All,
      5);
      
    wx.Core.Static_Box_Sizer.Add(
      Self.Sizer,
      Self.Spin,
      1,
      wx.Core.Sizer.Sizer_Expand or wx.Core.Sizer.Sizer_Border_All,
      5);
      
    wx.Core.Static_Box_Sizer.Add(
      Self.Sizer,
      Self.Scroll_Bar,
      1,
      wx.Core.Sizer.Sizer_Expand or wx.Core.Sizer.Sizer_Border_All,
      5);
    
    wx.Core.Status_Bar.New_Status_Bar(Self.Status_Bar, Self, wx.Base.Id.Id_Any);
    wx.Core.Status_Bar.Set_Fields_Count(Self.Status_Bar, Field_Widths);
    Set_Status_Bar(Self, Self.Status_Bar);
    wx.Core.Status_Bar.Set_Status_Text(Self.Status_Bar, "Welcome to wxAda!");
--    Set_Status_Widths(Test_Status_Bar, Field_Widths'Length, Field_Widths);

    wx.Core.Static_Box_Sizer.Set_Size_Hints(Self.Sizer, Self.Panel);
--    Set_Sizer(Window_Type(Self.Panel), Self.Sizer'Unchecked_Access);
    wx.Core.Panel.Set_Sizer(Self.Panel, Self.Sizer);
--    Set_Sizer(Self.Panel, Sizer_Type(Self.Sizer));

    Test_Event.New_Test_Event(Self.My_Test);
    
    --Button_Connect(Self, Id_Type(ID_TEST_BUTTON), Id_Any, wx.Base.Event.Command.Button_Clicked, On_Quit'Access);
    Button_Connect(Self, wx.Base.Id.Id_Type(Id_Test_Button), wx.Base.Id.Id_Any, wx.Core.Button.Evt_Button_Clicked, On_Quit'Access);
    --Check_Box_Connect(Self, Id_Type(ID_TEST_BUTTON), Id_Any, wx.Base.Event.Command.Check_Box_Clicked, On_Quit'Access);
    Slider_Connect(Self, wx.Base.Id.Id_Type(Id_Test_Slider), wx.Base.Id.Id_Any, wx.Core.Scroll_Event.Evt_Scroll_Thumb_Track, On_Scroll_Top'Access);
    Size_Connect(Self, wx.Base.Id.Id_Any, wx.Base.Id.Id_Any, wx.Core.Size_Event.Evt_Size, On_Size'Access);
    --Paint_Connect(Self.Panel, Id_Any, Id_Any, Evt_Paint, On_Paint'Access);
    Dump(Self);
    My_Test_Connect(Self, wx.Base.Id.Id_Any, wx.Base.Id.Id_Any, Test_Event.My_Test_Event, On_My_Test'Access);
    
  end New_Minimal_Frame;

  procedure Initialize(Self : in out Minimal_Frame_Type) is
  
  begin
  
    Text_IO.Put_Line("[Minimal_Frame.Initialize]");
--    Init_Standard_Handlers;
    wx.Core.Image.Init_All_Image_Handlers;
    
  end Initialize;

    
--  procedure Finalize(Self : in out Minimal_Frame_Type) is
  
--  begin
  
--    Text_IO.Put_Line("[Minimal_Frame.Finalize]");
--    Finalize(Frame_Type(Self));
    
--  end Finalize;
  
end Minimal_Frame;
