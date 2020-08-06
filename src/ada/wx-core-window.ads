-- wx-core-window.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with wx.Base.Id;
with wx.Base.Event;
with wx.Base.Event_Handler;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Rect;
with wx.Core.Colour;
with wx.Core.Root_Sizer;
with wx.Core.Root_Validator;
--with wx.Core.Sizer; use wx.Core.Sizer;
--limited with
--  wx.Core.Sizer,
--  wx.Core.Validator;

package wx.Core.Window is
  
  -- This is the actual type (wxWindow) we are creating here.
  type Window_Type is new wx.Base.Event_Handler.Event_Handler_Type with private;
--  type Window_Access is access all Window_Type;
--  type Window_View is access constant Window_Type;
  type Window_Class is access all Window_Type'Class;

  -- Window styles.
  type Window_Styles_Type is mod 2 ** Interfaces.C.long'Size;
  
  Simple_Border             : constant Window_Styles_Type := 16#0200_0000#;
  Double_Border             : constant Window_Styles_Type := 16#1000_0000#;
  Sunken_Border             : constant Window_Styles_Type := 16#0800_0000#;
  Raised_Border             : constant Window_Styles_Type := 16#0400_0000#;
  Static_Border             : constant Window_Styles_Type := 16#0100_0000#;
  No_Border                 : constant Window_Styles_Type := 16#0020_0000#;
  Transparent_Window        : constant Window_Styles_Type := 16#0010_0000#;
  Tab_Traversal             : constant Window_Styles_Type := 16#0008_0000#;
  Wants_Chars               : constant Window_Styles_Type := 16#0004_0000#;
  No_Full_Repaint_On_Resize : constant Window_Styles_Type := 16#0000_0000#;
  Vertical_Scrollbar        : constant Window_Styles_Type := 16#8000_0000#;
  Horizontal_Scrollbar      : constant Window_Styles_Type := 16#4000_0000#;
  Always_Show_Scrollbar     : constant Window_Styles_Type := 16#0080_0000#;
  Clip_Children             : constant Window_Styles_Type := 16#0040_0000#;
  Full_Repaint_On_Resize    : constant Window_Styles_Type := 16#0001_0000#;

  -- Extra window styles.
  --type Extra_Window_Styles_Type is mod 2 ** Interfaces.Interfaces.C.long'Size;
  
  
  type Direction_Type is (Horizontal, Vertical, Both);
  for Direction_Type use (Horizontal => 16#0000_0004#, Vertical => 16#0000_0008#, Both => 16#0000_000C#);
  
  type Window_Variant_Type is (Normal, Small, Mini, Large);
  for Window_Variant_Type use (Normal => 0, Small => 1, Mini => 2, Large => 3);
  
  type Size_Flags_Type is (
    Use_Existing,
    Auto_Width,
    Auto_Height,
    Auto,
    Allow_Minus_One,
    No_Adjustments);
    
  for Size_Flags_Type use (
    Use_Existing    => 16#0000_0000#,
    Auto_Width      => 16#0000_0001#,
    Auto_Height     => 16#0000_0002#,
    Auto            => 16#0000_0003#,  -- Auto_Width or Auto_Height
    Allow_Minus_One => 16#0000_0004#,
    No_Adjustments  => 16#0000_0008#);
  
  type Move_Kind_Type is (Move_Before, Move_After);
  
  procedure New_Window(
    Self     : in out Window_Type;
    Parent   : in Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size);
  
  procedure Cache_Best_Size(Self : in Window_Type; Size : in wx.Core.Size.Size_Type);
  procedure Centre(Self : in Window_Type; Direction : in Direction_Type);
  procedure Centre_On_Parent(Self : in Window_Type; Direction : in Direction_Type);
-- Now only TopLevelWindow
--  procedure Centre_On_Screen(Self : in Window_Type; Direction : in Direction_Type);
  procedure Clear_Background(Self : in Window_Type);
  procedure Client_To_Screen(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type);
  
  procedure Client_To_Screen(Self : in Window_Type; Coordinates : in out wx.Core.Point.Point_Type);
  pragma Inline(Client_To_Screen);
  
  function Close(Self : in Window_Type; Force : in Boolean) return Boolean;
  function Convert_Dialog_To_Pixels(Self : in Window_Type; Point : in wx.Core.Point.Point_Type) return wx.Core.Point.Point_Type;
  function Convert_Dialog_To_Pixels(Self : in Window_Type; Size : in wx.Core.Size.Size_Type) return wx.Core.Size.Size_Type;
  function Convert_Pixels_To_Dialog(Self : in Window_Type; Point : in wx.Core.Point.Point_Type) return wx.Core.Point.Point_Type;
  function Convert_Pixels_To_Dialog(Self : in Window_Type; Size : in wx.Core.Size.Size_Type) return wx.Core.Size.Size_Type;
  procedure Destroy_Children(Self : in out Window_Type);
  function Find_Window(Self : in Window_Type; Id : in wx.Base.Id.Id_Type) return Window_Class;
  function Find_Window(Self : in Window_Type; Name : in String) return Window_Class;
-- Deprecated	
--  function Get_Adjusted_Best_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  procedure Get_Background_Colour(Self : in Window_Type; Colour : out wx.Core.Colour.Colour_Type);
-- Deprecated	
--  function Get_Best_Fitting_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Get_Best_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Get_Client_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  procedure Get_Foreground_Colour(Self : in Window_Type; Colour : out wx.Core.Colour.Colour_Type);
  function Get_Grand_Parent(Self : in Window_Type) return Window_Class;
  function Get_Id(Self : in Window_Type) return wx.Base.Id.Id_Type;
  function Get_Parent(Self : in Window_Type) return Window_Class;
  procedure Get_Position(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type);
  function Get_Position(Self : in Window_Type) return wx.Core.Point.Point_Type;
  function Get_Rect(Self : in Window_Type) return wx.Core.Rect.Rect_Type;
  function Get_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Get_Virtual_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Get_Window_Variant(Self : in Window_Type) return Window_Variant_Type;
  function Has_Scroll_Bar(Self : in Window_Type; Orientation : in Direction_Type) return Boolean;
  procedure Invalidate_Best_Size(Self : in Window_Type);

  function Is_Exposed(Self : in Window_Type; X, Y : in wx.Core.Point.Coord_Type) return Boolean;
  function Is_Exposed(Self : in Window_Type; Coord : in wx.Core.Point.Point_Type) return Boolean;
  pragma Inline(Is_Exposed);
  
  function Is_Exposed(Self : in Window_Type; X, Y, Width, Height : in wx.Core.Point.Coord_Type) return Boolean;
  function Is_Exposed(Self : in Window_Type; Region : in wx.Core.Rect.Rect_Type) return Boolean;
  pragma Inline(Is_Exposed);
  
  procedure Move(Self : in Window_Type; X, Y : in wx.Core.Point.Coord_Type; Flags : in Size_Flags_Type := Use_Existing);
  pragma Inline(Move);
  
  procedure Move(Self : in Window_Type; Coord : in wx.Core.Point.Point_Type; Flags : in Size_Flags_Type := Use_Existing);
  pragma Inline(Move);
  
  -- TODO: Put this back in when the MoveKind enumeration is publicly available!
  --procedure Move_After_In_Tab_Order(Self, Window : in Window_Type);
  --pragma Inline(Move_After_In_Tab_Order);
  --
  --procedure Move_Before_In_Tab_Order(Self, Window : in Window_Type);
  --pragma Inline(Move_Before_In_Tab_Order);
  
  function Show(Self : in Window_Type; Show : in Boolean) return Boolean;
  
  --procedure Set_Sizer;       This is in wx.Core.Sizer due to cyclic dependencies!
  --procedure Set_Sizer(Self : in Window_Type; Sizer : access wx.Core.Sizer.Sizer_Type; Delete_Old_Sizer : in Boolean := True);
  procedure Set_Sizer(Self : in Window_Type; Sizer : in wx.Core.Root_Sizer.Root_Sizer_Type'Class; Delete_Old_Sizer : in Boolean := True);
  
  --procedure Set_Validator;   This is in wx.Core.Validator due to cyclic dependencies!
  --procedure Set_Validator(Self : in Window_Type; Validator : access wx.Core.Validator.Validator_Type'Class);
  procedure Set_Validator(Self : in Window_Type; Validator : in wx.Core.Root_Validator.Root_Validator_Type'Class);
  
  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.
  -- Primitives "inherited" from wxEvtHandler.
  function Process_Event(Self : in Window_Type; Event : in wx.Base.Event.Event_Type) return Boolean;
  procedure Capture_Mouse(Self : in Window_Type);
  function Destroy(Self : access Window_Type'Class) return Boolean;
  procedure Do_Client_To_Screen(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type);
  function Do_Get_Best_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Do_Get_Client_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  procedure Do_Get_Position(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type);
  function Do_Get_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Do_Get_Virtual_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  -- TODO: Put this back in when the MoveKind enumeration is publicly available!
  --procedure Do_Move_In_Tab_Order(Self, Window : in Window_Type; Move : in Move_Kind_Type);
  procedure Do_Move_Window(Self : in Window_Type; X, Y, Width, Height : in wx.Core.Point.Coord_Type);
  procedure Do_Set_Client_Size(Self : in Window_Type; Width, Height : in wx.Core.Point.Coord_Type);
  procedure Do_Set_Size(Self : in Window_Type; X, Y, Width, Height : in wx.Core.Point.Coord_Type; Flags : in Size_Flags_Type);
  procedure Do_Update_Window_UI(Self : in Window_Type; Event : in wx.Base.Event.Event_Type);
  procedure Enable(Self : in out Window_Type; Enable_Window : in Boolean := True);
  procedure Fit(Self : in Window_Type);
  procedure Fit_Inside(Self : in Window_Type);
  procedure Freeze(Self : in Window_Type);
  function Get_Char_Height(Self : in Window_Type) return Integer;
  function Get_Char_Width(Self : in Window_Type) return Integer;
  function Get_Label(Self : in Window_Type) return String;
  function Get_Max_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Get_Min_Size(Self : in Window_Type) return wx.Core.Size.Size_Type;
  function Get_Name(Self : in Window_Type) return String;
  function Get_Scroll_Position(Self : in Window_Type; Orientation : in Direction_Type) return Integer;
  function Get_Scroll_Thumb(Self : in Window_Type; Orientation : in Direction_Type) return Integer;
  function Get_Scroll_Range(Self : in Window_Type; Orientation : in Direction_Type) return Integer;
--  function Get_Title(Self : in Window_Type) return String;
  function Get_Window_Style_Flag(Self : in Window_Type) return Window_Styles_Type;
  function Has_Capture(Self : in Window_Type) return Boolean;
  function Has_Transparent_Background(Self : in Window_Type) return Boolean;
  procedure Inherit_Attributes(Self : in Window_Type);
  procedure Init_Dialog(Self : in Window_Type);
  function Is_Enabled(Self : in Window_Type) return Boolean;
  function Is_Retained(Self : in Window_Type) return Boolean;
  function Is_Shown(Self : in Window_Type) return Boolean;
  function Layout(Self : in Window_Type) return Boolean;
  function Is_Top_Level(Self : in Window_Type) return Boolean;
  procedure Lower(Self : in Window_Type);
  procedure Make_Modal(Self : in Window_Type; Flag : in Boolean);
  -- END
  
  function Create_Ada_Window(Window : in System.Address) return Window_Class;
  
private

  type Window_Type is new wx.Base.Event_Handler.Event_Handler_Type with null record;
  
  procedure Finalize(Self : in out Window_Type);
  
  -- START - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  function Ada_Window_Process_Event(Self, Event : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Process_Event, "Ada_Window_Process_Event");

  procedure Ada_Window_Capture_Mouse(Self : in System.Address);
  pragma Export(C, Ada_Window_Capture_Mouse, "Ada_Window_Capture_Mouse");

  procedure Ada_Window_Do_Client_To_Screen(Self, X, Y : in System.Address);
  pragma Export(C, Ada_Window_Do_Client_To_Screen, "Ada_Window_Do_Client_To_Screen");

  function Ada_Window_Destroy(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Destroy, "Ada_Window_Destroy");

  procedure Ada_Window_Do_Get_Best_Size(Self, Width, Height : in System.Address);
  pragma Export(C, Ada_Window_Do_Get_Best_Size, "Ada_Window_Do_Get_Best_Size");

  procedure Ada_Window_Do_Get_Client_Size(Self, Width, Height : in System.Address);
  pragma Export(C, Ada_Window_Do_Get_Client_Size, "Ada_Window_Do_Get_Client_Size");
  
  procedure Ada_Window_Do_Get_Position(Self, X, Y : in System.Address);
  pragma Export(C, Ada_Window_Do_Get_Position, "Ada_Window_Do_Get_Position");

  procedure Ada_Window_Do_Get_Size(Self, Width, Height : in System.Address);
  pragma Export(C, Ada_Window_Do_Get_Size, "Ada_Window_Do_Get_Size");
  
  procedure Ada_Window_Do_Get_Virtual_Size(Self, Width, Height : in System.Address);
  pragma Export(C, Ada_Window_Do_Get_Virtual_Size, "Ada_Window_Do_Get_Virtual_Size");
  
  -- TODO: Put this back in when the MoveKind enumeration is publicly available!
  --procedure Ada_Window_Do_Move_In_Tab_Order(Self, Window : in System.Address; Move : in Interfaces.C.int);
  --pragma Export(C, Ada_Window_Do_Move_In_Tab_Order, "Ada_Window_Do_Move_In_Tab_Order");
  
  procedure Ada_Window_Do_Move_Window(Self : in System.Address; X, Y, Width, Height : in Interfaces.C.int);
  pragma Export(C, Ada_Window_Do_Move_Window, "Ada_Window_Do_Move_Window");
  
  procedure Ada_Window_Do_Set_Client_Size(Self : in System.Address; Width, Height : in Interfaces.C.int);
  pragma Export(C, Ada_Window_Do_Set_Client_Size, "Ada_Window_Do_Set_Client_Size");
  
  procedure Ada_Window_Do_Set_Size(Self : in System.Address; X, Y, Width, Height, Flags : in Interfaces.C.int);
  pragma Export(C, Ada_Window_Do_Set_Size, "Ada_Window_Do_Set_Size");
  
  procedure Ada_Window_Do_Update_Window_UI(Self, Event : in System.Address);
  pragma Export(C, Ada_Window_Do_Update_Window_UI, "Ada_Window_Do_Update_Window_UI");

  procedure Ada_Window_Enable(Self : in System.Address; Enable_Window : in Interfaces.C.int);
  pragma Export(C, Ada_Window_Enable, "Ada_Window_Enable");

  procedure Ada_Window_Fit(Self : in System.Address);
  pragma Export(C, Ada_Window_Fit, "Ada_Window_Fit");

  procedure Ada_Window_Fit_Inside(Self : in System.Address);
  pragma Export(C, Ada_Window_Fit_Inside, "Ada_Window_Fit_Inside");

  procedure Ada_Window_Freeze(Self : in System.Address);
  pragma Export(C, Ada_Window_Freeze, "Ada_Window_Freeze");

  function Ada_Window_Get_Char_Height(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Get_Char_Height, "Ada_Window_Get_Char_Height");

  function Ada_Window_Get_Char_Width(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Get_Char_Width, "Ada_Window_Get_Char_Width");

  function Ada_Window_Get_Label(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Export(C, Ada_Window_Get_Label, "Ada_Window_Get_Label");
  
  procedure Ada_Window_Get_Max_Size(Self, Width, Height : in System.Address);
  pragma Export(C, Ada_Window_Get_Max_Size, "Ada_Window_Get_Max_Size");
  
  procedure Ada_Window_Get_Min_Size(Self, Width, Height : in System.Address);
  pragma Export(C, Ada_Window_Get_Min_Size, "Ada_Window_Get_Min_Size");

  function Ada_Window_Get_Name(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Export(C, Ada_Window_Get_Name, "Ada_Window_Get_Name");

  function Ada_Window_Get_Scroll_Position(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Get_Scroll_Position, "Ada_Window_Get_Scroll_Position");

  function Ada_Window_Get_Scroll_Thumb(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Get_Scroll_Thumb, "Ada_Window_Get_Scroll_Thumb");

  function Ada_Window_Get_Scroll_Range(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Get_Scroll_Range, "Ada_Window_Get_Scroll_Range");
  
--  function Ada_Window_Get_Title(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
--  pragma Export(C, Ada_Window_Get_Title, "Ada_Window_Get_Title");
  
  function Ada_Window_Get_Window_Style_Flag(Self : in System.Address) return Interfaces.C.long;
  pragma Export(C, Ada_Window_Get_Window_Style_Flag, "Ada_Window_Get_Window_Style_Flag");

  function Ada_Window_Has_Capture(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Has_Capture, "Ada_Window_Has_Capture");
  
  function Ada_Window_Has_Transparent_Background(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Has_Transparent_Background, "Ada_Window_Has_Transparent_Background");
  
  procedure Ada_Window_Inherit_Attributes(Self : in System.Address);
  pragma Export(C, Ada_Window_Inherit_Attributes, "Ada_Window_Inherit_Attributes");
  
  procedure Ada_Window_Init_Dialog(Self : in System.Address);
  pragma Export(C, Ada_Window_Init_Dialog, "Ada_Window_Init_Dialog");
  
  function Ada_Window_Is_Enabled(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Is_Enabled, "Ada_Window_Is_Enabled");
  
  function Ada_Window_Is_Retained(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Is_Retained, "Ada_Window_Is_Retained");
  
  function Ada_Window_Is_Shown(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Is_Shown, "Ada_Window_Is_Shown");
  
  function Ada_Window_Is_Top_Level(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Is_Top_Level, "Ada_Window_Is_Top_Level");
  
  function Ada_Window_Layout(Self : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Window_Layout, "Ada_Window_Layout");
  
  procedure Ada_Window_Lower(Self : in System.Address);
  pragma Export(C, Ada_Window_Lower, "Ada_Window_Lower");
  
  procedure Ada_Window_Make_Modal(Self : in System.Address; Flag : in Interfaces.C.int);
  pragma Export(C, Ada_Window_Make_Modal, "Ada_Window_Make_Modal");
  -- END
  
end wx.Core.Window;
