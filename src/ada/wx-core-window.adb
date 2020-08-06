-- wx-core-window.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Tags;
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;
with System.Address_To_Access_Conversions;
with wx.Debug;
with wx.Instance_Store;
with wx.Factory;
--with wx.Core.Sizer; use wx.Core.Sizer;
--with wx.Core.Validator; use wx.Core.Validator;
with wx.Core.Window.C;

use type System.Address;
use type Interfaces.C.int;

package body wx.Core.Window is

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
--  package Address_To_Object is new System.Address_To_Access_Conversions(Window_Type);
--  use Address_To_Object;
  package Address_To_Event_Handler_Class is new System.Address_To_Access_Conversions(wx.Base.Event_Handler.Event_Handler_Type'Class);
  package Address_To_Window_Class is new System.Address_To_Access_Conversions(Window_Type'Class);
  package Address_To_C_int_Access is new System.Address_To_Access_Conversions(Interfaces.C.int);
  package Address_To_Coord_Access is new System.Address_To_Access_Conversions(wx.Core.Point.Coord_Type);
  package Address_To_Event_Class is new System.Address_To_Access_Conversions(wx.Base.Event.Event_Type'Class);

    
  function Direction_To_C_int is new Ada.Unchecked_Conversion(Source => Direction_Type, Target => Interfaces.C.int);
  function C_int_To_Direction is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Direction_Type);
  function Id_Type_To_C_long is new Ada.Unchecked_Conversion(Source => wx.Base.Id.Id_Type, Target => Interfaces.C.long);
  function C_int_To_Window_Variant_Type is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Window_Variant_Type);
  function Size_Flags_To_C_int is new Ada.Unchecked_Conversion(Source => Size_Flags_Type, Target => Interfaces.C.int);
  function C_int_To_Size_Flags is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Size_Flags_Type);
  function Move_Kind_To_C_int is new Ada.Unchecked_Conversion(Source => Move_Kind_Type, Target => Interfaces.C.int);
  function C_int_To_Move_Kind is new Ada.Unchecked_Conversion(Source => Interfaces.C.int, Target => Move_Kind_Type);


  procedure New_Window(
    Self     : in out Window_Type;
    Parent   : in Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size) is
  
    --procedure SetAdaObject(Self, AdaObject : in System.Address);
    --pragma Import(C, SetAdaObject, "SetAdaObject");
	
    --Self_Class   : Address_To_Window_Class.Object_Pointer := Self'Unchecked_Access;
    CPP_Instance : System.Address                         := System.Null_Address;
    
  begin
  
    CPP_Instance := wx.Core.Window.C.ctor(
       Get_wxObject(Parent),
       Interfaces.C.int(Id),
       Interfaces.C.int(Position.X),
       Interfaces.C.int(Position.Y),
       Interfaces.C.int(Size.Width),
       Interfaces.C.int(Size.Height));
        
    Set_wxObject(Self, CPP_Instance, True);
      
    --SetAdaObject(Get_wxObject(Self), Address_To_Window_Class.To_Address(Self_Class));
    wx.Instance_Store.Add(CPP_Instance, Self'Unchecked_Access);
    
  end New_Window;
  
  
  procedure Cache_Best_Size(Self : in Window_Type; Size : in wx.Core.Size.Size_Type) is
  
  begin
  
    wx.Core.Window.C.CacheBestSize(Get_wxObject(Self), Interfaces.C.int(Size.Width), Interfaces.C.int(Size.Height));
    
  end Cache_Best_Size;
  
  
  procedure Centre(Self : in Window_Type; Direction : in Direction_Type) is
  
  begin
  
    wx.Core.Window.C.Centre(Get_wxObject(Self), Direction_To_C_int(Direction));
    
  end Centre;

  
  procedure Centre_On_Parent(Self : in Window_Type; Direction : in Direction_Type) is
  
  begin
  
    wx.Core.Window.C.CentreOnParent(Get_wxObject(Self), Direction_To_C_int(Direction));
    
  end Centre_On_Parent;
  
  
-- Now only TopLevelWindow
--  procedure Centre_On_Screen(Self : in Window_Type; Direction : in Direction_Type) is
  
--  begin
  
--    wx.Core.Window.C.CentreOnScreen(Get_wxObject(Self), Direction_To_C_int(Direction));
    
--  end Centre_On_Screen;
  
  
  procedure Clear_Background(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.ClearBackground(Get_wxObject(Self));
    
  end Clear_Background;
  
  
  procedure Client_To_Screen(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type) is
  
    In_X : aliased wx.Core.Point.Coord_Type := X;
    In_Y : aliased wx.Core.Point.Coord_Type := Y;
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.Window.Client_To_Screen] Input (" & wx.Core.Point.Coord_Type'Image(X) & ", " & wx.Core.Point.Coord_Type'Image(Y) & ") - " & Get_CPP_Class_Name(Self));
  
    wx.Core.Window.C.ClientToScreen(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(In_X'Unchecked_Access),
      Address_To_Coord_Access.To_Address(In_Y'Unchecked_Access));
    
    X := In_X;
    Y := In_Y;
    
    wx.Debug.Put_Line("[wx.Core.Window.Client_To_Screen] Output (" & wx.Core.Point.Coord_Type'Image(X) & ", " & wx.Core.Point.Coord_Type'Image(Y) & ")");
  
  end Client_To_Screen;
  
  
  procedure Client_To_Screen(Self : in Window_Type; Coordinates : in out wx.Core.Point.Point_Type) is
  
  begin
  
    Client_To_Screen(Self, Coordinates.X, Coordinates.Y);
    
  end Client_To_Screen;
  
  
  function Close(Self : in Window_Type; Force : in Boolean) return Boolean is
  
    Force_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Force = True then
    
      Force_Converted := 1;
      
    end if;
  
    if wx.Core.Window.C.Close(Get_wxObject(Self), Force_Converted) = 1 then
    
      return True;
      
    end if;
    
    return False;
    
  end Close;
  
  
  function Convert_Dialog_To_Pixels(Self : in Window_Type; Point : in wx.Core.Point.Point_Type) return wx.Core.Point.Point_Type is
  
    X, Y : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.ConvertDialogToPixels_For_Point(
      Get_wxObject(Self),
      Interfaces.C.int(Point.X),
      Interfaces.C.int(Point.Y),
      Address_To_Coord_Access.To_Address(X'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Y'Unchecked_Access));
    
    return wx.Core.Point.Point_Type'(X, Y);
    
  end Convert_Dialog_To_Pixels;
  
  
  function Convert_Dialog_To_Pixels(Self : in Window_Type; Size : in wx.Core.Size.Size_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.ConvertDialogToPixels_For_Size(
      Get_wxObject(Self),
      Interfaces.C.int(Size.Width),
      Interfaces.C.int(Size.Height),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Convert_Dialog_To_Pixels;
  
  
  function Convert_Pixels_To_Dialog(Self : in Window_Type; Point : in wx.Core.Point.Point_Type) return wx.Core.Point.Point_Type is
  
    X, Y : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.ConvertPixelsToDialog_For_Point(
      Get_wxObject(Self),
      Interfaces.C.int(Point.X),
      Interfaces.C.int(Point.Y),
      Address_To_Coord_Access.To_Address(X'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Y'Unchecked_Access));
    
    return wx.Core.Point.Point_Type'(X, Y);
    
  end Convert_Pixels_To_Dialog;
  
  
  function Convert_Pixels_To_Dialog(Self : in Window_Type; Size : in wx.Core.Size.Size_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.ConvertPixelsToDialog_For_Size(
      Get_wxObject(Self),
      Interfaces.C.int(Size.Width),
      Interfaces.C.int(Size.Height),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Convert_Pixels_To_Dialog;
  
  
  procedure Destroy_Children(Self : in out Window_Type) is
  
  begin

    wx.Core.Window.C.DestroyChildren(Get_wxObject(Self));
      
  end Destroy_Children;
  
  
  function Find_Window(Self : in Window_Type; Id : in wx.Base.Id.Id_Type) return Window_Class is
  
    Window : System.Address := wx.Core.Window.C.FindWindow(Get_wxObject(Self), Id_Type_To_C_long(Id));
    
  begin
  
    return Create_Ada_Window(Window);
    
  end Find_Window;
  
  
  function Find_Window(Self : in Window_Type; Name : in String) return Window_Class is
  
    Window : System.Address := wx.Core.Window.C.FindWindow_By_Name(Get_wxObject(Self), Interfaces.C.Strings.New_String(Name));
    
  begin
  
    return Create_Ada_Window(Window);
    
  end Find_Window;
  
  
--Deprecated	
--  function Get_Adjusted_Best_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
--    Width, Height : aliased wx.Core.Point.Coord_Type;
    
--  begin
  
--    wx.Core.Window.C.GetAdjustedBestSize(
--      Get_wxObject(Self),
--      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
--      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
--    return wx.Core.Size.Size_Type'(Width, Height);
    
--  end Get_Adjusted_Best_Size;
  
  
  procedure Get_Background_Colour(Self : in Window_Type; Colour : out wx.Core.Colour.Colour_Type) is
  
    Red, Green, Blue : aliased Interfaces.C.int;
    
  begin
  
    wx.Core.Window.C.GetBackgroundColour(
      Get_wxObject(Self),
      Address_To_C_int_Access.To_Address(Red'Unchecked_Access),
      Address_To_C_int_Access.To_Address(Green'Unchecked_Access),
      Address_To_C_int_Access.To_Address(Blue'Unchecked_Access));
    
    wx.Core.Colour.New_Colour(
      Colour,
      wx.Core.Colour.Colour_Component_Type(Red),
      wx.Core.Colour.Colour_Component_Type(Green),
      wx.Core.Colour.Colour_Component_Type(Blue));
    
  end Get_Background_Colour;

  
-- Deprecated	
--  function Get_Best_Fitting_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
--    Width, Height : aliased wx.Core.Point.Coord_Type;
    
--  begin
  
--    wx.Core.Window.C.GetBestFittingSize(
--      Get_wxObject(Self),
--      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
--      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
--    return wx.Core.Size.Size_Type'(Width, Height);
    
--  end Get_Best_Fitting_Size;
  
  
  function Get_Best_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.GetBestSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Get_Best_Size;
  
  
  function Get_Client_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.GetClientSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Get_Client_Size;
  
  
  procedure Get_Foreground_Colour(Self : in Window_Type; Colour : out wx.Core.Colour.Colour_Type) is
  
    Red, Green, Blue : aliased Interfaces.C.int;
    
  begin
  
    wx.Core.Window.C.GetForegroundColour(
      Get_wxObject(Self),
      Address_To_C_int_Access.To_Address(Red'Unchecked_Access),
      Address_To_C_int_Access.To_Address(Green'Unchecked_Access),
      Address_To_C_int_Access.To_Address(Blue'Unchecked_Access));
    
    wx.Core.Colour.New_Colour(
      Colour,
      wx.Core.Colour.Colour_Component_Type(Red),
      wx.Core.Colour.Colour_Component_Type(Green),
      wx.Core.Colour.Colour_Component_Type(Blue));
    
  end Get_Foreground_Colour;

  
  function Get_Grand_Parent(Self : in Window_Type) return Window_Class is
  
    Window : System.Address := wx.Core.Window.C.GetGrandParent(Get_wxObject(Self));

  begin
  
    if Window = System.Null_Address then
    
      return null;
    
    end if;
    
    return Create_Ada_Window(Window);
    
  end Get_Grand_Parent;
  
  
  function Get_Id(Self : in Window_Type) return wx.Base.Id.Id_Type is
  
  begin
  
    return wx.Base.Id.Id_Type(wx.Core.Window.C.GetId(Get_wxObject(Self)));
    
  end Get_Id;
  
  
  function Get_Parent(Self : in Window_Type) return Window_Class is
  
    Window : System.Address := wx.Core.Window.C.GetParent(Get_wxObject(Self));

  begin
  
    if Window = System.Null_Address then
    
      return null;
    
    end if;
    
    return Create_Ada_Window(Window);
    
  end Get_Parent;
  
  
  procedure Get_Position(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type) is
  
    In_X : aliased wx.Core.Point.Coord_Type := X;
    In_Y : aliased wx.Core.Point.Coord_Type := Y;
    
  begin
  
    wx.Core.Window.C.GetPosition(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(In_X'Unchecked_Access),
      Address_To_Coord_Access.To_Address(In_Y'Unchecked_Access));
    
    X := In_X;
    Y := In_Y;
    
  end Get_Position;

  
  function Get_Position(Self : in Window_Type) return wx.Core.Point.Point_Type is
  
    X, Y : wx.Core.Point.Coord_Type := wx.Core.Point.Default_Coord;
    
  begin
  
    Get_Position(Self, X, Y);
    
    return wx.Core.Point.Point_Type'(X, Y);
    
  end Get_Position;
  
  
  function Get_Rect(Self : in Window_Type) return wx.Core.Rect.Rect_Type is
  
    Result   : wx.Core.Rect.Rect_Type;
    Position : wx.Core.Point.Point_Type := Get_Position(Self);
    Size     : wx.Core.Size.Size_Type   := Get_Size(Self);
    
  begin
  
    wx.Core.Rect.New_Rect(Result, Position, Size);
    
    return Result;
    
  end Get_Rect;
  
  
  function Get_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width  : aliased wx.Core.Point.Coord_Type;
    Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.GetSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));

    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Get_Size;
  
  
  function Get_Virtual_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width  : aliased wx.Core.Point.Coord_Type;
    Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.GetVirtualSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));

    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Get_Virtual_Size;
  
  
  function Get_Window_Variant(Self : in Window_Type) return Window_Variant_Type is
  
  begin
  
    return C_int_To_Window_Variant_Type(wx.Core.Window.C.GetWindowVariant(Get_wxObject(Self)));
    
  end Get_Window_Variant;
  
  
  function Has_Scroll_Bar(Self : in Window_Type; Orientation : in Direction_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.HasScrollbar(Get_wxObject(Self), Direction_To_C_int(Orientation)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Has_Scroll_Bar;
  
  
  procedure Invalidate_Best_Size(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.InvalidateBestSize(Get_wxObject(Self));
    
  end Invalidate_Best_Size;
  
  
  function Is_Exposed(Self : in Window_Type; X, Y : in wx.Core.Point.Coord_Type) return Boolean is
  
  begin
  
    if wx.Core.Window.C.IsExposed_For_Point(Get_wxObject(Self), Interfaces.C.int(X), Interfaces.C.int(Y)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Exposed;
  
  
  function Is_Exposed(Self : in Window_Type; Coord : in wx.Core.Point.Point_Type) return Boolean is
  
  begin
  
    return Is_Exposed(Self, Coord.X, Coord.Y);
    
  end Is_Exposed;
  
  
  function Is_Exposed(Self : in Window_Type; X, Y, Width, Height : in wx.Core.Point.Coord_Type) return Boolean is
  
  begin
  
    if wx.Core.Window.C.IsExposed_For_Rect(Get_wxObject(Self), Interfaces.C.int(X), Interfaces.C.int(Y), Interfaces.C.int(Width), Interfaces.C.int(Height)) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Is_Exposed;
  
  
  function Is_Exposed(Self : in Window_Type; Region : in wx.Core.Rect.Rect_Type) return Boolean is
  
  begin
  
    return Is_Exposed(Self, wx.Core.Rect.Left(Region), wx.Core.Rect.Top(Region), wx.Core.Rect.Width(Region), wx.Core.Rect.Height(Region));
    
  end Is_Exposed;
  
  
  procedure Move(Self : in Window_Type; X, Y : in wx.Core.Point.Coord_Type; Flags : in Size_Flags_Type := Use_Existing) is
  
  begin
  
    Do_Set_Size(Self, X, Y, wx.Core.Point.Default_Coord, wx.Core.Point.Default_Coord, Flags);
    
  end Move;
  
  
  procedure Move(Self : in Window_Type; Coord : in wx.Core.Point.Point_Type; Flags : in Size_Flags_Type := Use_Existing) is
  
  begin
  
    Move(Self, Coord.X, Coord.Y, Flags);
    
  end Move;
  
  
  -- TODO: Put this back in when the MoveKind enumeration is publicly available!
  --procedure Move_After_In_Tab_Order(Self, Window : in Window_Type) is
  --
  --begin
  --
  --  Do_Move_In_Tab_Order(Self, Window, Move_After);
  --
  --end Move_After_In_Tab_Order;
  --
  --
  --procedure Move_Before_In_Tab_Order(Self, Window : in Window_Type);
  --
  --begin
  --
  --  Do_Move_In_Tab_Order(Self, Window, Move_Before);
  --
  --end Move_Before_In_Tab_Order;

    
  function Show(Self : in Window_Type; Show : in Boolean) return Boolean is
  
    Converted_Show : Interfaces.C.int := 0;
    
  begin
  
    if Show = True then
    
      Converted_Show := 1;
    
    end if;
    
    if wx.Core.Window.C.Show(Get_wxObject(Self), Converted_Show) = 1 then
    
      return True;
    
    end if;
    
    return False;
    
  end Show;
  
  
--  procedure Set_Sizer(Self : in Window_Type; Sizer : access wx.Core.Sizer.Sizer_Type; Delete_Old_Sizer : in Boolean := True) is
  
--    procedure SetSizer(Self, Sizer : in System.Address; Delete_Old_Sizer : in Interfaces.C.int);
--    pragma Import(C, SetSizer, "SetSizer");
    
--    Delete_Old_Sizer_Converted : Interfaces.C.int := 0;
    
--  begin
  
--    if Delete_Old_Sizer = True then
    
--      Delete_Old_Sizer_Converted := 1;
      
--    end if;
  
--    SetSizer(Get_wxObject(Self), Get_wxObject(Sizer.all), Delete_Old_Sizer_Converted);
    
--  end Set_Sizer;

  procedure Set_Sizer(Self : in Window_Type; Sizer : in wx.Core.Root_Sizer.Root_Sizer_Type'Class; Delete_Old_Sizer : in Boolean := True) is
  
    Delete_Old_Sizer_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Delete_Old_Sizer = True then
    
      Delete_Old_Sizer_Converted := 1;
      
    end if;
  
    wx.Core.Window.C.SetSizer(Get_wxObject(Self), wx.Core.Root_Sizer.Get_wxObject(Sizer), Delete_Old_Sizer_Converted);
    
  end Set_Sizer;
  
  
--  procedure Set_Validator(Self : in Window_Type; Validator : access wx.Core.Validator.Validator_Type'Class) is
  
--    procedure SetValidator(Self, Validator : in System.Address);
--    pragma Import(C, SetValidator, "SetValidator");
    
--  begin
  
--    SetValidator(
--      Get_wxObject(Self),
--      Get_wxObject(Validator.all));
    
--  end Set_Validator;

  procedure Set_Validator(Self : in Window_Type; Validator : in wx.Core.Root_Validator.Root_Validator_Type'Class) is
  
  begin
  
    wx.Core.Window.C.SetValidator(
      Get_wxObject(Self),
      wx.Core.Root_Validator.Get_wxObject(Validator));
    
  end Set_Validator;

  
  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.
  
  
  -- Primitives "inherited" from wxEvtHandler.
  function Process_Event(Self : in Window_Type; Event : in wx.Base.Event.Event_Type) return Boolean is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.Window.Process_Event]");
    
    if wx.Core.Window.C.ProcessEvent(Get_wxObject(Self), wx.Base.Event.Get_wxObject(Event)) = 0 then
    
      return False;
    
    end if;
    
    return True;
    
  end Process_Event;
  
  
  -- Primitives for wxWindow.
  procedure Capture_Mouse(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.CaptureMouse(Get_wxObject(Self));
    
  end Capture_Mouse;
  
  
  function Destroy(Self : access Window_Type'Class) return Boolean is
  
  begin

--    if Get_wxObject(Self) /= System.Null_Address then
    
      if wx.Core.Window.C.Destroy(Get_wxObject(Self.all)) = 1 then
      
        wx.Debug.Put_Line("[wx.Core.Window.Destroy]");
        
        Set_wxObject(Self.all, System.Null_Address, False);
        
        return True;

      end if;
    
--    end if;

    return False;
      
  end Destroy;
  
  
  procedure Do_Client_To_Screen(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type) is
  
    In_X : aliased wx.Core.Point.Coord_Type := X;
    In_Y : aliased wx.Core.Point.Coord_Type := Y;
    
  begin
  
    wx.Debug.put_Line("[wx.Core.Window.Do_Client_To_Screen] Input (" & wx.Core.Point.Coord_Type'Image(X) & ", " & wx.Core.Point.Coord_Type'Image(Y) & ")");
  
    wx.Core.Window.C.DoClientToScreen(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(In_X'Unchecked_Access),
      Address_To_Coord_Access.To_Address(In_Y'Unchecked_Access));
    
    X := In_X;
    Y := In_Y;
    
    wx.Debug.put_Line("[wx.Core.Window.Do_Client_To_Screen] Output (" & wx.Core.Point.Coord_Type'Image(X) & ", " & wx.Core.Point.Coord_Type'Image(Y) & ")");
  
  end Do_Client_To_Screen;
  
  
  function Do_Get_Best_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width  : aliased wx.Core.Point.Coord_Type;
    Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.DoGetBestSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Do_Get_Best_Size;
  
  
  function Do_Get_Client_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width  : aliased wx.Core.Point.Coord_Type;
    Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.DoGetClientSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Do_Get_Client_Size;
  
  
  procedure Do_Get_Position(Self : in Window_Type; X, Y : in out wx.Core.Point.Coord_Type) is
  
    In_X : aliased wx.Core.Point.Coord_Type := X;
    In_Y : aliased wx.Core.Point.Coord_Type := Y;
    
  begin
  
    wx.Core.Window.C.DoGetPosition(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(In_X'Unchecked_Access),
      Address_To_Coord_Access.To_Address(In_Y'Unchecked_Access));
    
    X := In_X;
    Y := In_Y;
    
  end Do_Get_Position;
  
  
  function Do_Get_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.DoGetSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Do_Get_Size;
  
  
  function Do_Get_Virtual_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width, Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.DoGetVirtualSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Do_Get_Virtual_Size;
  
  
  -- TODO: Put this back in when the MoveKind enumeration is publicly available!
  --procedure Do_Move_In_Tab_Order(Self, Window : in Window_Type; Move : in Move_Kind_Type) is
  --
  --  procedure DoMoveInTabOrder(Self, Window : in System.Address; Move : in Interfaces.C.int);
  --  pragma Import(C, DoMoveInTabOrder, "DoMoveInTabOrder");
  --
  --begin
  --
  --  DoMoveInTabOrder(
  --    Get_wxObject(Self),
  --    Get_wxObject(Window),
  --    Move_Kind_To_C_int(Move));
  --  
  --end Do_Move_In_Tab_Order;
  
  
  procedure Do_Move_Window(Self : in Window_Type; X, Y, Width, Height : in wx.Core.Point.Coord_Type) is
  
  begin
  
    wx.Core.Window.C.DoMoveWindow(
      Get_wxObject(Self),
      Interfaces.C.int(X),
      Interfaces.C.int(Y),
      Interfaces.C.int(Width),
      Interfaces.C.int(Height));
    
  end Do_Move_Window;
  
  
  procedure Do_Set_Client_Size(Self : in Window_Type; Width, Height : in wx.Core.Point.Coord_Type) is
  
  begin
  
    wx.Core.Window.C.DoSetClientSize(
      Get_wxObject(Self),
      Interfaces.C.int(Width),
      Interfaces.C.int(Height));
    
  end Do_Set_Client_Size;
  
  
  procedure Do_Set_Size(Self : in Window_Type; X, Y, Width, Height : in wx.Core.Point.Coord_Type; Flags : in Size_Flags_Type) is
  
  begin
  
    wx.Core.Window.C.DoSetSize(
      Get_wxObject(Self),
      Interfaces.C.int(X),
      Interfaces.C.int(Y),
      Interfaces.C.int(Width),
      Interfaces.C.int(Height),
      Size_Flags_To_C_int(Flags));
    
  end Do_Set_Size;
  
  
  procedure Do_Update_Window_UI(Self : in Window_Type; Event : in wx.Base.Event.Event_Type) is
  
  begin
  
    wx.Core.Window.C.DoUpdateWindowUI(Get_wxObject(Self), wx.Base.Event.Get_wxObject(Event));
    
  end Do_Update_Window_UI;
  
  
  procedure Enable(Self : in out Window_Type; Enable_Window : in Boolean := True) is
  
    Enable_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Enable_Window = True then
    
      Enable_Converted := 1;
    
    end if;
  
    wx.Core.Window.C.Enable(Get_wxObject(Self), Enable_Converted);
    
  end Enable;
  
  
  procedure Fit(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.Fit(Get_wxObject(Self));
    
  end Fit;
  
  
  procedure Fit_Inside(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.FitInside(Get_wxObject(Self));
    
  end Fit_Inside;
  
  
  procedure Freeze(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.Freeze(Get_wxObject(Self));
    
  end Freeze;
  
  
  function Get_Char_Height(Self : in Window_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Window.C.GetCharHeight(Get_wxObject(Self)));
    
  end Get_Char_Height;
  
  
  function Get_Char_Width(Self : in Window_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Window.C.GetCharWidth(Get_wxObject(Self)));
    
  end Get_Char_Width;
  
  
  function Get_Label(Self : in Window_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Core.Window.C.GetLabel(Get_wxObject(Self)));
    
  end Get_Label;
  
  
  function Get_Max_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width  : aliased wx.Core.Point.Coord_Type;
    Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.GetMaxSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Get_Max_Size;
  
  
  function Get_Min_Size(Self : in Window_Type) return wx.Core.Size.Size_Type is
  
    Width  : aliased wx.Core.Point.Coord_Type;
    Height : aliased wx.Core.Point.Coord_Type;
    
  begin
  
    wx.Core.Window.C.GetMinSize(
      Get_wxObject(Self),
      Address_To_Coord_Access.To_Address(Width'Unchecked_Access),
      Address_To_Coord_Access.To_Address(Height'Unchecked_Access));
    
    return wx.Core.Size.Size_Type'(Width, Height);
    
  end Get_Min_Size;
  
  
  function Get_Name(Self : in Window_Type) return String is
  
  begin
  
    return Interfaces.C.Strings.Value(wx.Core.Window.C.GetName(Get_wxObject(Self)));
    
  end Get_Name;
  
  
  function Get_Scroll_Position(Self : in Window_Type; Orientation : in Direction_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Window.C.GetScrollPos(Get_wxObject(Self), Direction_To_C_int(Orientation)));
      
  end Get_Scroll_Position;
  
  
  function Get_Scroll_Thumb(Self : in Window_Type; Orientation : in Direction_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Window.C.GetScrollThumb(Get_wxObject(Self), Direction_To_C_int(Orientation)));
      
  end Get_Scroll_Thumb;
  
  
  function Get_Scroll_Range(Self : in Window_Type; Orientation : in Direction_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Window.C.GetScrollRange(Get_wxObject(Self), Direction_To_C_int(Orientation)));
      
  end Get_Scroll_Range;
  
  
--  function Get_Title(Self : in Window_Type) return String is
  
--  begin
  
--    return Interfaces.C.Strings.Value(wx.Core.Window.C.GetTitle(Get_wxObject(Self)));
    
--  end Get_Title;
  
  
  function Get_Window_Style_Flag(Self : in Window_Type) return Window_Styles_Type is
  
  begin
  
    return Window_Styles_Type(wx.Core.Window.C.GetWindowStyleFlag(Get_wxObject(Self)));
    
  end Get_Window_Style_Flag;
  
  
  function Has_Capture(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.HasCapture(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Has_Capture;
  
  
  function Has_Transparent_Background(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.HasTransparentBackground(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Has_Transparent_Background;
  
  
  procedure Inherit_Attributes(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.InheritAttributes(Get_wxObject(Self));
    
  end Inherit_Attributes;
  
  
  procedure Init_Dialog(Self : in Window_Type) is
  
  begin
  
    wx.Core.Window.C.InitDialog(Get_wxObject(Self));
    
  end Init_Dialog;
  
  
  function Is_Enabled(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.IsEnabled(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Is_Enabled;
  
  
  function Is_Retained(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.IsRetained(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Is_Retained;
  
  
  function Is_Shown(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.IsShown(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Is_Shown;
  
  
  function Is_Top_Level(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.IsTopLevel(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Is_Top_Level;
  
  
  function Layout(Self : in Window_Type) return Boolean is
  
  begin
  
   if wx.Core.Window.C.Layout(Get_wxObject(Self)) = 1 then
   
     return True;
   
   end if;
   
   return False;
   
  end Layout;
  
  
  procedure Lower(Self : in Window_Type) is
  
  begin
  
   wx.Core.Window.C.Lower(Get_wxObject(Self));
   
  end Lower;

  
  procedure Make_Modal(Self : in Window_Type; Flag : in Boolean) is
  
    Flag_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Flag = True then
    
      Flag_Converted := 1;
    
    end if;
  
    wx.Core.Window.C.MakeModal(Get_wxObject(Self), Flag_Converted);
   
  end Make_Modal;
  
  
  -- END
  
  
  -- Private
  
  
  function Create_Ada_Window(Window : in System.Address) return Window_Class is
  
    Class_Name : String          := Get_CPP_Class_Name(Window);
    Prefix     : constant String := "wxAda";
    
  begin
  
    -- Is this instance an Ada derived window?
    if Class_Name(Prefix'Range) = Prefix then
    
      --return Window_Class(Address_To_Window_Class.To_Pointer(GetAdaObject(Window)));
      --return Window_Class(CPP_To_Ada_Map.Find(Window));
      return Window_Class(wx.Instance_Store.Find(Window));
    
    end if;
    
    return Window_Class(wx.Factory.Create_Ada_Type(Class_Name, Window, False));
    
  end Create_Ada_Window;
  
  
  -- Finalize
  procedure Finalize(Self : in out Window_Type) is
  
    Self_Class : Window_Class := Self'Unchecked_Access;
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.Window.Finalize] Tag: " & Ada.Tags.Expanded_Name(Self_Class'Tag));
    
    --wx.Debug.Put_Line("[wx.Core.Window.Finalize]");
      
    -- TODO: Put this back in when I get exiting working!
    if Is_wxObject_Owner(Self) = True then

      -- TODO: We cannot destroy here as the application's Finalize is called before the windows, thus causing a crash because
      --       the application has shut down wxWidgets!    
      -- TODO: We cannot use Destroy as the window is Destroyed later on when the application shuts down, which in turn calls
      --       the virtual Destroy in wxAdaWindow which in turn calls the Destroy in the wxAda Window which in turn calls the
      --       the instance store to retrieve the Ada type, but at this time the instance store has been finalized.
      --if Destroy(Self_Class) = True then
      --  wx.Debug.Put_Line("[wx.Core.Window.Finalize] Destroyed the window!");
      --end if;
    
      null;
      
    end if;
    
    Set_wxObject(Self, System.Null_Address, False);
    
  end Finalize;
  

  -- START - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  
  
  function Ada_Window_Process_Event(Self, Event : in System.Address) return Interfaces.C.int is
  
    Ada_Event_Handler : wx.Base.Event_Handler.Event_Handler_Class := wx.Base.Event_Handler.Event_Handler_Class(Address_To_Event_Handler_Class.To_Pointer(Self));
    Ada_Event         : wx.Base.Event.Event_Class                 := wx.Base.Event_Handler.Create_Ada_Event(Event, Get_CPP_Class_Name(Event));
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.Window.Ada_Window_Process_Event]");
    
    if wx.Base.Event_Handler.Process_Event(Ada_Event_Handler.all, wx.Base.Event.Event_Type(Ada_Event.all)) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Process_Event;
  
  
  procedure Ada_Window_Capture_Mouse(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.Window.Ada_Window_Capture_Mouse]");
    
    Capture_Mouse(Ada_Window.all);
    
  end Ada_Window_Capture_Mouse;
  
  
  procedure Ada_Window_Do_Client_To_Screen(Self, X, Y : in System.Address) is
  
    Ada_Window : Window_Class                           := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    X_Access   : Address_To_Coord_Access.Object_Pointer := Address_To_Coord_Access.To_Pointer(X);
    Y_Access   : Address_To_Coord_Access.Object_Pointer := Address_To_Coord_Access.To_Pointer(Y);
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.Window.Ada_Window_Do_Client_To_Screen] Input (" & wx.Core.Point.Coord_Type'Image(X_Access.all) & ", " & wx.Core.Point.Coord_Type'Image(Y_Access.all) & ")");
  
    Do_Client_To_Screen(Ada_Window.all, X_Access.all, Y_Access.all);
    
    wx.Debug.Put_Line("[wx.Core.Window.Ada_Window_Do_Client_To_Screen] Output (" & wx.Core.Point.Coord_Type'Image(X_Access.all) & ", " & wx.Core.Point.Coord_Type'Image(Y_Access.all) & ")");
  
  end Ada_Window_Do_Client_To_Screen;
  
  
  function Ada_Window_Destroy(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Destroy(Ada_Window) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Destroy;
  
  
  procedure Ada_Window_Do_Get_Best_Size(Self, Width, Height : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Size       : wx.Core.Size.Size_Type;
    
  begin
  
    Size := Do_Get_Best_Size(Ada_Window.all);
    
    Address_To_Coord_Access.To_Pointer(Width).all  := Size.Width;
    Address_To_Coord_Access.To_Pointer(Height).all := Size.Height;
    
  end Ada_Window_Do_Get_Best_Size;
  
  
  procedure Ada_Window_Do_Get_Client_Size(Self, Width, Height : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Size       : wx.Core.Size.Size_Type;
    
  begin
  
    Size := Do_Get_Client_Size(Ada_Window.all);
    
    Address_To_Coord_Access.To_Pointer(Width).all  := Size.Width;
    Address_To_Coord_Access.To_Pointer(Height).all := Size.Height;
    
  end Ada_Window_Do_Get_Client_Size;
  
  
  procedure Ada_Window_Do_Get_Position(Self, X, Y : in System.Address) is
  
    Ada_Window : Window_Class                           := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    X_Access   : Address_To_Coord_Access.Object_Pointer := Address_To_Coord_Access.To_Pointer(X);
    Y_Access   : Address_To_Coord_Access.Object_Pointer := Address_To_Coord_Access.To_Pointer(Y);
    
  begin
  
    Do_Get_Position(Ada_Window.all, X_Access.all, Y_Access.all);
  
  end Ada_Window_Do_Get_Position;
  
  
  procedure Ada_Window_Do_Get_Size(Self, Width, Height : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Size       : wx.Core.Size.Size_Type;
    
  begin
  
    Size := Do_Get_Size(Ada_Window.all);
    
    Address_To_Coord_Access.To_Pointer(Width).all  := Size.Width;
    Address_To_Coord_Access.To_Pointer(Height).all := Size.Height;
    
  end Ada_Window_Do_Get_Size;
  
  
  procedure Ada_Window_Do_Get_Virtual_Size(Self, Width, Height : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Size       : wx.Core.Size.Size_Type;
    
  begin
  
    Size := Do_Get_Virtual_Size(Ada_Window.all);
    
    Address_To_Coord_Access.To_Pointer(Width).all  := Size.Width;
    Address_To_Coord_Access.To_Pointer(Height).all := Size.Height;
    
  end Ada_Window_Do_Get_Virtual_Size;
  
  
  -- TODO: Put this back in when the MoveKind enumeration is publicly available!
  --procedure Ada_Window_Do_Move_In_Tab_Order(Self, Window : in System.Address; Move : in Interfaces.C.int) is
  --
  --  Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
  --
  --begin
  --
  --  Do_Move_In_Tab_Order(Ada_Window.all, Window, C_int_To_Move_Kind(Move));
  --  
  --end Ada_Window_Do_Move_In_Tab_Order;
  
  
  procedure Ada_Window_Do_Move_Window(Self : in System.Address; X, Y, Width, Height : in Interfaces.C.int) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
  
  begin
  
  
    Do_Move_Window(
      Ada_Window.all,
      wx.Core.Point.Coord_Type(X),
      wx.Core.Point.Coord_Type(Y),
      wx.Core.Point.Coord_Type(Width),
      wx.Core.Point.Coord_Type(Height));
    
  end Ada_Window_Do_Move_Window;
  
  
  procedure Ada_Window_Do_Set_Client_Size(Self : in System.Address; Width, Height : in Interfaces.C.int) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
  
  begin
  
  
    Do_Set_Client_Size(
      Ada_Window.all,
      wx.Core.Point.Coord_Type(Width),
      wx.Core.Point.Coord_Type(Height));
    
  end Ada_Window_Do_Set_Client_Size;
  
  
  procedure Ada_Window_Do_Set_Size(Self : in System.Address; X, Y, Width, Height, Flags : in Interfaces.C.int) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
  
  begin
  
  
    Do_Set_Size(
      Ada_Window.all,
      wx.Core.Point.Coord_Type(X),
      wx.Core.Point.Coord_Type(Y),
      wx.Core.Point.Coord_Type(Width),
      wx.Core.Point.Coord_Type(Height),
      C_int_To_Size_Flags(Flags));
    
  end Ada_Window_Do_Set_Size;
  
  
  procedure Ada_Window_Do_Update_Window_UI(Self, Event : in System.Address) is
  
    Ada_Window : Window_Class              := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Ada_Event  : wx.Base.Event.Event_Class := wx.Base.Event.Event_Class(Address_To_Event_Class.To_Pointer(Event));  -- TODO: Change this to wxUpdateUIEvent when it's bound.
    
  begin
  
    Do_Update_Window_UI(Ada_Window.all, wx.Base.Event.Event_Type(Ada_Event.all));
    
  end Ada_Window_Do_Update_Window_UI;
  
  
  procedure Ada_Window_Enable(Self : in System.Address; Enable_Window : in Interfaces.C.int) is
  
    Ada_Window       : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Enable_Converted : Boolean      := False;
    
  begin
  
    if Enable_Window = 1 then
    
      Enable_Converted := True;
    
    end if;
  
    Enable(Ada_Window.all, Enable_Converted);
    
  end Ada_Window_Enable;
  
  
  procedure Ada_Window_Fit(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    Fit(Ada_Window.all);
    
  end Ada_Window_Fit;
  
  
  procedure Ada_Window_Fit_Inside(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    Fit_Inside(Ada_Window.all);
    
  end Ada_Window_Fit_Inside;
  
  
  procedure Ada_Window_Freeze(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    Freeze(Ada_Window.all);
    
  end Ada_Window_Freeze;
  
  
  function Ada_Window_Get_Char_Height(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.int(Get_Char_Height(Ada_Window.all));
    
  end Ada_Window_Get_Char_Height;
  
  
  function Ada_Window_Get_Char_Width(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.int(Get_Char_Width(Ada_Window.all));
    
  end Ada_Window_Get_Char_Width;
  
  
  function Ada_Window_Get_Label(Self : in System.Address) return Interfaces.C.Strings.chars_ptr is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.Strings.New_String(Get_Label(Ada_Window.all));
    
  end Ada_Window_Get_Label;
  
  
  procedure Ada_Window_Get_Max_Size(Self, Width, Height : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Size       : wx.Core.Size.Size_Type;
    
  begin
  
    Size := Get_Max_Size(Ada_Window.all);
    
    Address_To_Coord_Access.To_Pointer(Width).all  := Size.Width;
    Address_To_Coord_Access.To_Pointer(Height).all := Size.Height;
    
  end Ada_Window_Get_Max_Size;
  
  
  procedure Ada_Window_Get_Min_Size(Self, Width, Height : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    Size       : wx.Core.Size.Size_Type;
    
  begin
  
    Size := Get_Min_Size(Ada_Window.all);
    
    Address_To_Coord_Access.To_Pointer(Width).all  := Size.Width;
    Address_To_Coord_Access.To_Pointer(Height).all := Size.Height;
    
  end Ada_Window_Get_Min_Size;
  

  function Ada_Window_Get_Name(Self : in System.Address) return Interfaces.C.Strings.chars_ptr is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.Strings.New_String(Get_Name(Ada_Window.all));
    
  end Ada_Window_Get_Name;
  
  
  function Ada_Window_Get_Scroll_Position(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.int(Get_Scroll_Position(Ada_Window.all, C_int_To_Direction(Orientation)));
  
  end Ada_Window_Get_Scroll_Position;
  
  
  function Ada_Window_Get_Scroll_Thumb(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.int(Get_Scroll_Thumb(Ada_Window.all, C_int_To_Direction(Orientation)));
  
  end Ada_Window_Get_Scroll_Thumb;
  
  
  function Ada_Window_Get_Scroll_Range(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.int(Get_Scroll_Range(Ada_Window.all, C_int_To_Direction(Orientation)));
  
  end Ada_Window_Get_Scroll_Range;
  
  
--  function Ada_Window_Get_Title(Self : in System.Address) return Interfaces.C.Strings.chars_ptr is
  
--    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
--  begin
  
--    return Interfaces.C.Strings.New_String(Get_Title(Ada_Window.all));
    
--  end Ada_Window_Get_Title;
  
  
  function Ada_Window_Get_Window_Style_Flag(Self : in System.Address) return Interfaces.C.long is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    return Interfaces.C.long(Get_Window_Style_Flag(Ada_Window.all));
  
  end Ada_Window_Get_Window_Style_Flag;
  
  
  function Ada_Window_Has_Capture(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Has_Capture(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Has_Capture;
  
  
  function Ada_Window_Has_Transparent_Background(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Has_Transparent_Background(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Has_Transparent_Background;
  
  
  procedure Ada_Window_Inherit_Attributes(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    Inherit_Attributes(Ada_Window.all);
    
  end Ada_Window_Inherit_Attributes;
  
  
  procedure Ada_Window_Init_Dialog(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    Init_Dialog(Ada_Window.all);
    
  end Ada_Window_Init_Dialog;
  
  
  function Ada_Window_Is_Enabled(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Is_Enabled(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Is_Enabled;
  
  
  function Ada_Window_Is_Retained(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Is_Retained(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Is_Retained;
  
  
  function Ada_Window_Is_Shown(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Is_Shown(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Is_Shown;
  
  
  function Ada_Window_Is_Top_Level(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Is_Top_Level(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Is_Top_Level;
  
  
  function Ada_Window_Layout(Self : in System.Address) return Interfaces.C.int is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    if Layout(Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Window_Layout;
  
  
  procedure Ada_Window_Lower(Self : in System.Address) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
  begin
  
    Lower(Ada_Window.all);
    
  end Ada_Window_Lower;
  
  
  procedure Ada_Window_Make_Modal(Self : in System.Address; Flag : in Interfaces.C.int) is
  
    Ada_Window : Window_Class := Window_Class(Address_To_Window_Class.To_Pointer(Self));
    
    Flag_Converted : Boolean := False;
    
  begin
  
    if Flag = 1 then
    
      Flag_Converted := True;
    
    end if;
  
    Make_Modal(Ada_Window.all, Flag_Converted);
    
  end Ada_Window_Make_Modal;
  
  
  -- END
  
  
  -- Window_Factory.
  function Window_Factory return Root_WX_Class is
  
  begin
  
    return new Window_Type;
  
  end Window_Factory;
  
begin

  wx.Factory.Add_Factory("wxWindow", Window_Factory'Access);
  
end wx.Core.Window;
