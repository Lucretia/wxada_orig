-- wx-core-slider.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--with System.Address_To_Access_Conversions;
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Slider.C;

use type Interfaces.C.int;

package body wx.Core.Slider is
  
  procedure New_Slider(
    Self      : in out Slider_Type;
    Id        : in wx.Base.Id.Id_Type;
    Value,
    Min_Value,
    Max_Value : in Integer;
    Position  : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style     : in Slider_Styles_Type       := Slider_Horizontal) is
  
--    Self_Access : Slider_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Slider.C.ctor(
        System.Null_Address,
        Interfaces.C.int(Id),
        Interfaces.C.int(Value),
        Interfaces.C.int(Min_Value),
        Interfaces.C.int(Max_Value),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
    
  end New_Slider;
  
  
  procedure New_Slider(
    Self      : in out Slider_Type;
    Parent    : in wx.Core.Window.Window_Type'Class;
    Id        : in wx.Base.Id.Id_Type;
    Value,
    Min_Value,
    Max_Value : in Integer;
    Position  : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style     : in Slider_Styles_Type       := Slider_Horizontal) is
  
--    Self_Access : Slider_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Slider.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.int(Value),
        Interfaces.C.int(Min_Value),
        Interfaces.C.int(Max_Value),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
    
  end New_Slider;


  procedure Clear_Selection(Self : in Slider_Type) is
  
  begin
  
    wx.Core.Slider.C.ClearSel(Get_wxObject(Self));
    
  end Clear_Selection;
  

  procedure Clear_Ticks(Self : in Slider_Type) is
  
  begin
  
    wx.Core.Slider.C.ClearTicks(Get_wxObject(Self));
    
  end Clear_Ticks;


  function Get_Line_Size(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetLineSize(Get_wxObject(Self)));
    
  end Get_Line_Size;
  

  function Get_Max(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetMax(Get_wxObject(Self)));
    
  end Get_Max;
  

  function Get_Min(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetMin(Get_wxObject(Self)));
    
  end Get_Min;
  

  function Get_Page_Size(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetPageSize(Get_wxObject(Self)));
    
  end Get_Page_Size;
  

  function Get_Sel_End(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetSelEnd(Get_wxObject(Self)));
    
  end Get_Sel_End;
  

  function Get_Sel_Start(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetSelStart(Get_wxObject(Self)));
    
  end Get_Sel_Start;
  

  function Get_Thumb_Length(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetThumbLength(Get_wxObject(Self)));
    
  end Get_Thumb_Length;
  

  function Get_Tick_Frequency(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetTickFreq(Get_wxObject(Self)));
    
  end Get_Tick_Frequency;
  

  function Get_Value(Self : in Slider_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Slider.C.GetValue(Get_wxObject(Self)));
    
  end Get_Value;
  

  procedure Set_Range(Self : in Slider_Type; Min_Value, Max_Value : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetRange(Get_wxObject(Self), Interfaces.C.int(Min_Value), Interfaces.C.int(Max_Value));
    
  end Set_Range;
  

  procedure Set_Tick_Frequency(Self : in Slider_Type; Frequency, Position : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetTickFreq(Get_wxObject(Self), Interfaces.C.int(Frequency), Interfaces.C.int(Position));
    
  end Set_Tick_Frequency;
  

  procedure Set_Line_Size(Self : in Slider_Type; Line_Size : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetLineSize(Get_wxObject(Self), Interfaces.C.int(Line_Size));
    
  end Set_Line_Size;
  

  procedure Set_Page_Size(Self : in Slider_Type; Page_Size : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetPageSize(Get_wxObject(Self), Interfaces.C.int(Page_Size));
    
  end Set_Page_Size;
  

  procedure Set_Selection(Self : in Slider_Type; Start_Position, End_Position : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetSelection(Get_wxObject(Self), Interfaces.C.int(Start_Position), Interfaces.C.int(End_Position));
    
  end Set_Selection;
  

  procedure Set_Thumb_Length(Self : in Slider_Type; Length : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetThumbLength(Get_wxObject(Self), Interfaces.C.int(Length));
    
  end Set_Thumb_Length;
  

  procedure Set_Tick_Position(Self : in Slider_Type; Tick_Position : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetTick(Get_wxObject(Self), Interfaces.C.int(Tick_Position));
    
  end Set_Tick_Position;
  

  procedure Set_Value(Self : in Slider_Type; Value : in Integer) is
  
  begin
  
    wx.Core.Slider.C.SetValue(Get_wxObject(Self), Interfaces.C.int(Value));
    
  end Set_Value;
  

  -- Slider_Factory.
  function Slider_Factory return Root_WX_Class is
  
  begin
  
    return new Slider_Type;
  
  end Slider_Factory;
  
begin

  wx.Factory.Add_Factory("wxSlider", Slider_Factory'Access);
  
end wx.Core.Slider;
