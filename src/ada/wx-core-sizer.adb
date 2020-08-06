-- wx-core-sizer.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Sizer.C;

package body wx.Core.Sizer is

  procedure New_Sizer(Self : in out Sizer_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Sizer.C.ctor, True);
    
  end New_Sizer;
  
  
  procedure Add(
    Self       : in out Sizer_Type;
    Window     : in wx.Core.Window.Window_Type'Class;
    Proportion : in Sizer_Proportion_Type := 0;
    Flags      : in Sizer_Flag_Type := 0;
    Border     : in Integer := 0) is
  
--    type Window_Class is access constant Window_Type'Class;
    
--    Window_Access : Window_Class := Window'Unchecked_Access;
    
  begin
  
    wx.Core.Sizer.C.Add(
      Get_wxObject(Self),
--      Get_wxObject(Window_Access.all),
      wx.Core.Window.Get_wxObject(Window),
      Interfaces.C.int(Proportion),
      Interfaces.C.int(Flags),
      Interfaces.C.int(Border));
    
  end Add;
  

  procedure Add_Spacer(Self : in out Sizer_Type; Size : in Integer) is
  
  begin
  
    wx.Core.Sizer.C.AddSpacer(Get_wxObject(Self), Interfaces.C.int(Size));
    
  end Add_Spacer;
  
  
  procedure Add_Stretch_Spacer(Self : in out Sizer_Type; Proportion : in Integer := 1) is
  
  begin
  
    wx.Core.Sizer.C.AddStretchSpacer(Get_wxObject(Self), Interfaces.C.int(Proportion));
    
  end Add_Stretch_Spacer;
  
  
  procedure Set_Size_Hints(Self : in out Sizer_Type; Window : in wx.Core.Window.Window_Type'Class) is
  
  begin
  
    wx.Core.Sizer.C.SetSizeHints(Get_wxObject(Self), wx.Core.Window.Get_wxObject(Window));
    
  end Set_Size_Hints;
  
  
  procedure Set_Virtual_Size_Hints(Self : in out Sizer_Type; Window : in wx.Core.Window.Window_Type'Class) is
  
  begin
  
    wx.Core.Sizer.C.SetVirtualSizeHints(Get_wxObject(Self), wx.Core.Window.Get_wxObject(Window));
    
  end Set_Virtual_Size_Hints;

    
  -- Set_Sizer should really be in wx.Core.Window, but we get circular dependencies! 
--  procedure Set_Sizer(Self : in Window_Type; Sizer : in Sizer_Class; Delete_Old_Sizer : in Boolean := True) is
  
--    procedure wxWindow_SetSizer(Self, Sizer : in System.Address; Delete_Old_Sizer : in Interfaces.C.int);
--    pragma Import(C, wxWindow_SetSizer, "wxWindow_SetSizer");
    
--    Delete_Old_Sizer_Converted : Interfaces.C.int := 0;
    
--  begin
  
--    if Delete_Old_Sizer = True then
    
--      Delete_Old_Sizer_Converted := 1;
      
--    end if;
  
--    wxWindow_SetSizer(Get_wxObject(Self), Get_wxObject(Sizer.all), Delete_Old_Sizer_Converted);
    
--  end Set_Sizer;
  
  
  procedure Initialize(Self : in out Sizer_Type) is
  
  begin
  
    null;
    
  end Initialize;
  
  
  procedure Finalize(Self : in out Sizer_Type) is
  
  begin
  
    null;
    
  end Finalize;
  
  
  -- Sizer_Factory.
  function Sizer_Factory return Root_WX_Class is
  
  begin
  
    return new Sizer_Type;
  
  end Sizer_Factory;
  
begin

  wx.Factory.Add_Factory("wxSizer", Sizer_Factory'Access);
  
end wx.Core.Sizer;
