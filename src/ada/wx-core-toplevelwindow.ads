-- wx-core-toplevelwindow.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Window;

package wx.Core.TopLevelWindow is

  -- This is the actual type (wxTopLevelWindow) we are creating here.
  type Top_Level_Window_Type is new wx.Core.Window.Window_Type with private;
--  type Top_Level_Window_Access is access all Top_Level_Window_Type;
--  type Top_Level_Window_View is access constant Top_Level_Window_Type;
  type Top_Level_Window_Class is access all Top_Level_Window_Type'Class;
  
  procedure New_Top_Level_Window(
    Self     : in out Top_Level_Window_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Title    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size);

private

  type Top_Level_Window_Type is new wx.Core.Window.Window_Type with null record;

end wx.Core.TopLevelWindow;
