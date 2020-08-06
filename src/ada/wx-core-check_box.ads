-- wx-core-check_box.ads
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

package wx.Core.Check_Box is

  -- This is the actual type (wxCheckBox) we are creating here.
  type Check_Box_Type is new wx.Core.Control.Control_Type with private;
--  type Check_Box_Access is access all Check_Box_Type;
--  type Check_Box_View is access constant Check_Box_Type;
  type Check_Box_Class is access all Check_Box_Type'Class;
  
  -- Button styles.
  subtype Check_Box_Styles_Type is wx.Core.Window.Window_Styles_Type;
  
  Check_Box_Two_State                   : constant Check_Box_Styles_Type := 16#0000_0000#;
  Check_Box_Three_State                 : constant Check_Box_Styles_Type := 16#0000_1000#;
  Check_Box_User_Selectable_Third_State : constant Check_Box_Styles_Type := 16#0000_2000#;
  Check_Box_Align_Right                 : constant Check_Box_Styles_Type := 16#0000_0200#;
  
  type Check_Box_State_Type is (Check_Box_Unchecked, Check_Box_Checked, Check_Box_Undetermined);

  -- Events.
  Evt_Check_Box_Clicked : constant wx.Base.Event.Event_Id_Type;
  
  procedure New_Check_Box(
    Self     : in out Check_Box_Type;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Check_Box_Styles_Type    := Check_Box_Two_State);
    
  procedure New_Check_Box(
    Self     : in out Check_Box_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Label    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Check_Box_Styles_Type    := Check_Box_Two_State);

  function Get_Value(Self : in Check_Box_Type) return Boolean;
  function Get_Value(Self : in Check_Box_Type) return Check_Box_State_Type;
  function Is_Third_State_User_Selectable(Self : in Check_Box_Type) return Boolean;
  function Is_Three_State(Self : in Check_Box_Type) return Boolean;
  procedure Set_Value(Self : in Check_Box_Type; State : in Boolean);
  procedure Set_Value(Self : in Check_Box_Type; State : in Check_Box_State_Type);
  
private

  type Check_Box_Type is new wx.Core.Control.Control_Type with null record;
  
  pragma Import(C, Evt_Check_Box_Clicked, "wxEVT_COMMAND_CHECKBOX_CLICKED");
  
end wx.Core.Check_Box;
