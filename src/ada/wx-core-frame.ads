-- wx-core-frame.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Window;
with wx.Core.TopLevelWindow;
with wx.Core.Status_Bar;

package wx.Core.Frame is

  -- This is the actual type (wxFrame) we are creating here.
  type Frame_Type is new wx.Core.TopLevelWindow.Top_Level_Window_Type with private;
--  type Frame_Access is access all Frame_Type;
--  type Frame_View is access constant Frame_Type;
  type Frame_Class is access all Frame_Type'Class;
  
  procedure New_Frame(
    Self     : in out Frame_Type;
    Id       : in wx.Base.Id.Id_Type;
    Title    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size);
    
  procedure New_Frame(
    Self     : in out Frame_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Title    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size);
  
  procedure Set_Status_Bar(Self : in Frame_Type; Status_Bar : in wx.Core.Status_Bar.Status_Bar_Type'Class);

  procedure Dump(Self : in Frame_Type);
  
  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.
  -- Primitives inherited from wxWindow.
  --function Destroy(Self : access Frame_Type'Class) return Boolean;
  -- END
  
private

  type Frame_Type is new wx.Core.TopLevelWindow.Top_Level_Window_Type with null record;
  
  -- START - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  --function Ada_Frame_Destroy(Self : in System.Address) return Interfaces.C.int;
  --pragma Export(C, Ada_Frame_Destroy, "Ada_Frame_Destroy");
  -- END

end wx.Core.Frame;
