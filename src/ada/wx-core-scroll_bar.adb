-- wx-core-scroll_bar.adb
-- 
-- Copyright © 2005 Luke A. Guest
--with System.Address_To_Access_Conversions;
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;
with wx.Factory;
with wx.Core.Scroll_Bar.C;

use type Interfaces.C.int;

package body wx.Core.Scroll_Bar is

  procedure New_Scroll_Bar(
    Self      : in out Scroll_Bar_Type;
    Id        : in wx.Base.Id.Id_Type;
    Position  : in wx.Core.Point.Point_Type                    := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type                      := wx.Core.Size.Default_Size;
    Style     : in wx.Core.Scroll_Event.Scroll_Bar_Styles_Type := wx.Core.Scroll_Event.Scroll_Bar_Horizontal) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Scroll_Bar.C.ctor(
        System.Null_Address,
        Interfaces.C.int(Id),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
      
  end New_Scroll_Bar;
  
    
  procedure New_Scroll_Bar(
    Self      : in out Scroll_Bar_Type;
    Parent    : in wx.Core.Window.Window_Type'Class;
    Id        : in wx.Base.Id.Id_Type;
    Position  : in wx.Core.Point.Point_Type                    := wx.Core.Point.Default_Position;
    Size      : in wx.Core.Size.Size_Type                      := wx.Core.Size.Default_Size;
    Style     : in wx.Core.Scroll_Event.Scroll_Bar_Styles_Type := wx.Core.Scroll_Event.Scroll_Bar_Horizontal) is
  
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Scroll_Bar.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height),
        Interfaces.C.long(Style)),
      True);
      
  end New_Scroll_Bar;
  

  function Get_Range(Self : in Scroll_Bar_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Scroll_Bar.C.GetRange(Get_wxObject(Self)));
    
  end Get_Range;
  
  
  function Get_Page_Size(Self : in Scroll_Bar_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Scroll_Bar.C.GetPageSize(Get_wxObject(Self)));
    
  end Get_Page_Size;
  
  
  function Get_Thumb_Position(Self : in Scroll_Bar_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Scroll_Bar.C.GetThumbPosition(Get_wxObject(Self)));
    
  end Get_Thumb_Position;
  
  
  function Get_Thumb_Size(Self : in Scroll_Bar_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Scroll_Bar.C.GetThumbSize(Get_wxObject(Self)));
    
  end Get_Thumb_Size;
  
  
  procedure Set_Thumb_Position(Self : in Scroll_Bar_Type; View_Start : in Integer) is
  
  begin
  
    wx.Core.Scroll_Bar.C.SetThumbPosition(Get_wxObject(Self), Interfaces.C.int(View_Start));
    
  end Set_Thumb_Position;
  
  
  procedure Set_Scroll_Bar(Self : in Scroll_Bar_Type; Position, Thumb_Size, Max_Range, Page_Size : in Integer; Refresh : in Boolean := True) is
  
	Refresh_Converted : Interfaces.C.int := 1;
	
  begin
  
    if Refresh = False then
    
      Refresh_Converted := 0;
      
    end if;
  
    wx.Core.Scroll_Bar.C.SetScrollbar(
      Get_wxObject(Self),
      Interfaces.C.int(Position),
      Interfaces.C.int(Thumb_Size),
      Interfaces.C.int(Max_Range),
      Interfaces.C.int(Page_Size),
      Refresh_Converted);
    
  end Set_Scroll_Bar;
  
  
  -- Scroll_Bar_Factory.
  function Scroll_Bar_Factory return Root_WX_Class is
  
  begin
  
    return new Scroll_Bar_Type;
  
  end Scroll_Bar_Factory;
  
begin

  wx.Factory.Add_Factory("wxScrollBar", Scroll_Bar_Factory'Access);
  
end wx.Core.Scroll_Bar;
