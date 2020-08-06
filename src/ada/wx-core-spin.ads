-- wx-core-spin.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Control;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Window;

package wx.Core.Spin is

  -- This is the actual type (wxSpinCtrl) we are creating here.
  type Spin_Type is new wx.Core.Control.Control_Type with private;
--  type Spin_Access is access all Spin_Type;
--  type Spin_View is access constant Spin_Type;
  type Spin_Class is access all Spin_Type'Class;
  
  -- Spin styles.
  subtype Spin_Styles_Type is wx.Core.Window.Window_Styles_Type;
  
  Spin_Horizontal : constant Spin_Styles_Type := 16#0000_0004#;
  Spin_Vertical   : constant Spin_Styles_Type := 16#0000_0008#;
  Spin_Arrow_Keys : constant Spin_Styles_Type := 16#0000_1000#;
  Spin_Wrap       : constant Spin_Styles_Type := 16#0000_2000#;
  
  procedure New_Spin(
    Self          : in out Spin_Type;
    Id            : in wx.Base.Id.Id_Type;
    Value         : in String;
    Position      : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size          : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style         : in Spin_Styles_Type         := Spin_Arrow_Keys;
    Min_Value     : in Integer                  := 0;
    Max_Value     : in Integer                  := 100;
    Initial_Value : in Integer                  := 0);
    
  procedure New_Spin(
    Self          : in out Spin_Type;
    Parent        : in wx.Core.Window.Window_Type'Class;
    Id            : in wx.Base.Id.Id_Type;
    Value         : in String;
    Position      : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size          : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style         : in Spin_Styles_Type         := Spin_Arrow_Keys;
    Min_Value     : in Integer                  := 0;
    Max_Value     : in Integer                  := 100;
    Initial_Value : in Integer                  := 0);
    
  procedure Set_Value(Self : in Spin_Type; Value : in Integer);
  function Get_Value(Self : in Spin_Type) return Integer;
  procedure Set_Range(Self : in Spin_Type; Min_Value, Max_Value : in Integer);
  procedure Set_Selection(Self : in Spin_Type; From, To : in Long_Integer);
  function Get_Min(Self : in Spin_Type) return Integer;
  function Get_Max(Self : in Spin_Type) return Integer;
  
private

  type Spin_Type is new wx.Core.Control.Control_Type with null record;
  
end wx.Core.Spin;
