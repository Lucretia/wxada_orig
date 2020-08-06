-- wx-core-sizer.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Object;
with wx.Core.Window;
with wx.Core.Root_Sizer;

package wx.Core.Sizer is

  -- This is the actual type (wxSizer) we are creating here.
  --type Sizer_Type is new wx.Base.Object.Object_Type with private;
  type Sizer_Type is new wx.Core.Root_Sizer.Root_Sizer_Type with private;
--  type Sizer_Access is access all Sizer_Type;
--  type Sizer_View is access constant Sizer_Type;
  type Sizer_Class is access all Sizer_Type'Class;
  
  type Sizer_Proportion_Type is new Integer range 0 .. Integer'Last;
  
  type Sizer_Flag_Type is mod 2 ** Interfaces.C.int'Size;
  
  Sizer_Border_Left             : constant Sizer_Flag_Type := 16#0000_0010#;
  Sizer_Border_Right            : constant Sizer_Flag_Type := 16#0000_0020#;
  Sizer_Border_Top              : constant Sizer_Flag_Type := 16#0000_0040#;
  Sizer_Border_Bottom           : constant Sizer_Flag_Type := 16#0000_0080#;
  Sizer_Border_All              : constant Sizer_Flag_Type := Sizer_Border_Left or Sizer_Border_Right or Sizer_Border_Top or Sizer_Border_Bottom;
  Sizer_Expand                  : constant Sizer_Flag_Type := 16#0000_2000#;
  Sizer_Shaped                  : constant Sizer_Flag_Type := 16#0000_4000#;
  Sizer_Fixed_Min_Size          : constant Sizer_Flag_Type := 16#0000_8000#;
  Sizer_Align_Left              : constant Sizer_Flag_Type := 16#0000_0000#;
  Sizer_Align_Right             : constant Sizer_Flag_Type := 16#0000_0200#;
  Sizer_Align_Top               : constant Sizer_Flag_Type := 16#0000_0000#;
  Sizer_Align_Bottom            : constant Sizer_Flag_Type := 16#0000_0400#;
  Sizer_Align_Centre_Vertical   : constant Sizer_Flag_Type := 16#0000_0800#;
  Sizer_Align_Centre_Horizontal : constant Sizer_Flag_Type := 16#0000_0100#;
  Sizer_Align_Centre            : constant Sizer_Flag_Type := Sizer_Align_Centre_Vertical or Sizer_Align_Centre_Horizontal;
  
  procedure New_Sizer(Self : in out Sizer_Type);
  
  procedure Add(
    Self       : in out Sizer_Type;
    Window     : in wx.Core.Window.Window_Type'Class;
    Proportion : in Sizer_Proportion_Type := 0;
    Flags      : in Sizer_Flag_Type := 0;
    Border     : in Integer := 0);

  procedure Add_Spacer(Self : in out Sizer_Type; Size : in Integer);
  procedure Add_Stretch_Spacer(Self : in out Sizer_Type; Proportion : in Integer := 1);
--CalcMin
--Detach
--Fit
--FitInside
--GetItem
--GetSize
--GetPosition
--GetMinSize
--Insert
--InsertSpacer
--InsertStretchSpacer
--Layout
--Prepend
--PrependSpacer
--PrependStretchSpacer
--RecalcSizes
--SetDimension
--SetMinSize
--SetItemMinSize

  procedure Set_Size_Hints(Self : in out Sizer_Type; Window : in wx.Core.Window.Window_Type'Class);
  procedure Set_Virtual_Size_Hints(Self : in out Sizer_Type; Window : in wx.Core.Window.Window_Type'Class);
--  procedure Show(Self : in out Sizer_Type; Window : in Window_Class; Show, Recursive : in Boolean := (True, False));

  -- Set_Sizer should really be in wx.Core.Window, but we get circular dependencies! 
  --procedure Set_Sizer(Self : in Window_Type; Sizer : in Sizer_Class; Delete_Old_Sizer : in Boolean := True);
  
private

  --type Sizer_Type is new wx.Base.Object.Object_Type with null record;
  type Sizer_Type is new wx.Core.Root_Sizer.Root_Sizer_Type with null record;
  
  procedure Initialize(Self : in out Sizer_Type);
  procedure Finalize(Self : in out Sizer_Type);
  
end wx.Core.Sizer;
