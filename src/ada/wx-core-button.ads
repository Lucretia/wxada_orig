-- wx-core-button.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Base.Event;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Control;
with wx.Core.Window;

package wx.Core.Button is

  -- This is the actual type (wxButton) we are creating here.
  type Button_Type is new wx.Core.Control.Control_Type with private;
--  type Button_Access is access all Button_Type;
--  type Button_View is access constant Button_Type;
  type Button_Class is access all Button_Type'Class;
  
  -- Button styles.
  subtype Button_Styles_Type is wx.Core.Window.Window_Styles_Type;
  
  Button_Justify_Left  : constant Button_Styles_Type := 16#0000_0040#;
  Button_Justify_Right : constant Button_Styles_Type := 16#0000_0100#;
  Button_Align_Top     : constant Button_Styles_Type := 16#0000_0080#;
  Button_Align_Bottom  : constant Button_Styles_Type := 16#0000_0200#;
  Button_Exact_Fit     : constant Button_Styles_Type := 16#0000_0001#;
  
  -- Events.
  Evt_Button_Clicked : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Button(
    Self     : in out Button_Type;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Button_Styles_Type := 0);
    
  procedure New_Button(
    Self     : in out Button_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Button_Styles_Type := 0);

  function Get_Label(Self : in Button_Type) return String;
  function Get_Default_Size(Self : in Button_Type) return wx.Core.Size.Size_Type;
  procedure Set_Default(Self : in Button_Type);
  procedure Set_Label(Self : in Button_Type; Label : in String);
  
private

  type Button_Type is new wx.Core.Control.Control_Type with null record;
  
  pragma Import(C, Evt_Button_Clicked, "wxEVT_COMMAND_BUTTON_CLICKED");
  
end wx.Core.Button;
