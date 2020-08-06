-- wx-core-status_bar.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System.Address_To_Access_Conversions;
with wx.Array_Conversion;
with wx.Factory;
with wx.Core.Point;
with wx.Core.Status_Bar.C;

use type Interfaces.C.int;

package body wx.Core.Status_Bar is

  package Field_Widths_Array_To_C_int_Array is new wx.Array_Conversion(Integer, Field_Widths_Array, Interfaces.C.int);
  package Field_Styles_Array_To_C_int_Array is new wx.Array_Conversion(Integer, Field_Styles_Array, Interfaces.C.int);
  
  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
--  package Address_To_Object is new System.Address_To_Access_Conversions(wx.Core.Window.Window_Type);
--  use Address_To_Object;
  
  package Address_To_Int_Access is new System.Address_To_Access_Conversions(Interfaces.C.int);
--  use Address_To_Int_Access;
  
  -- These two are always required by every Ada proxy type. These enable the  wxAda tagged types to associate themselves with
  -- the C++ object (wxObject) and vice-versa.
--  procedure wxAdaStatusBar_SetAdaProxyObject(Self : in wxObject_Access; Proxy : in System.Address);
--  function wxAdaStatusBar_GetAdaProxyObject(Self : in wxObject_Access) return System.Address;

  -- Import the C functions necessary for the wxObject class.
--  pragma Import(C, wxAdaStatusBar_SetAdaProxyObject, "wxAdaStatusBar_SetAdaProxyObject");
--  pragma Import(C, wxAdaStatusBar_GetAdaProxyObject, "wxAdaStatusBar_GetAdaProxyObject");
  
  procedure New_Status_Bar(
    Self     : in out Status_Bar_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Style    : in Status_Bar_Styles_Type := Size_Grip) is
  
--    Self_Access : Status_Bar_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(
      Self,
      wx.Core.Status_Bar.C.ctor(wx.Core.Window.Get_wxObject(Parent), Interfaces.C.int(Id), Interfaces.C.long(Style)),
      True);
      
--    wxAdaStatusBar_SetAdaProxyObject(Get_wxObject(Self), To_Address(Object_Pointer(Self_Access)));
  
  end New_Status_Bar;
  

  procedure Get_Field_Rect(Self : in Status_Bar_Type; Field : in Integer; Dimensions : out wx.Core.Rect.Rect_Type) is
	
	Result, X, Y, W, H : Interfaces.C.int;
	
  begin
  
    wx.Core.Status_Bar.C.GetFieldRect(
      Get_wxObject(Self),
      Interfaces.C.int(Field),
      X,
      Y,
      W,
      H,
      Result);
    
    if Result = 1 then
    
      wx.Core.Rect.New_Rect(
        Dimensions,
        wx.Core.Point.Coord_Type(X),
        wx.Core.Point.Coord_Type(Y),
        wx.Core.Point.Coord_Type(W),
        wx.Core.Point.Coord_Type(H));
    
    else
    
      null;  -- Raise an exception here?
      
    end if;
    
  end Get_Field_Rect;
  
  
  function Get_Fields_Count(Self : in Status_Bar_Type) return Integer is
  
  begin
  
    return Integer(wx.Core.Status_Bar.C.GetFieldsCount(Get_wxObject(Self)));
    
  end Get_Fields_Count;
  
  
  function Get_Status_Text(Self : in Status_Bar_Type; Field : in Integer := 0) return String is
  
  begin
  
    return Interfaces.C.To_Ada(Interfaces.C.Strings.Value(wx.Core.Status_Bar.C.GetStatusText(Get_wxObject(Self), Interfaces.C.int(Field))));
    
  end Get_Status_Text;
  
  
  procedure Pop_Status_Text(Self : in Status_Bar_Type; Field : in Integer := 0) is
  
  begin
  
    wx.Core.Status_Bar.C.PopStatusText(Get_wxObject(Self), Interfaces.C.int(Field));
    
  end Pop_Status_Text;
  
  
  procedure Push_Status_Text(Self : in Status_Bar_Type; Text : in String; Field : in Integer := 0) is
  
  begin
  
    wx.Core.Status_Bar.C.PushStatusText(Get_wxObject(Self), Interfaces.C.Strings.New_String(Text), Interfaces.C.int(Field));
    
  end Push_Status_Text;
  
  
  procedure Set_Fields_Count(Self : in Status_Bar_Type; Total : in Integer := 1) is
  
  begin
    
    wx.Core.Status_Bar.C.SetFieldsCount(Get_wxObject(Self), Interfaces.C.int(Total));
    
  end Set_Fields_Count;
  
  
  procedure Set_Fields_Count(Self : in Status_Bar_Type; Widths : in Field_Widths_Array) is
  
    C_Array : Field_Widths_Array_To_C_int_Array.To_Array_Type(Widths'Range) := Field_Widths_Array_To_C_int_Array.Convert_Array(Widths);
    
  begin
  
    wx.Core.Status_Bar.C.SetFieldsCount(
      Get_wxObject(Self),
      Interfaces.C.int(C_Array'Length),
      Address_To_Int_Access.To_Address(C_Array(C_Array'First)'Unchecked_Access));
    
  end Set_Fields_Count;
  
  
  procedure Set_Min_Height(Self : in Status_Bar_Type; Height : in Integer) is
  
  begin
  
    wx.Core.Status_Bar.C.SetMinHeight(Get_wxObject(Self), Interfaces.C.int(Height));
    
  end Set_Min_Height;
  
  
  procedure Set_Status_Text(Self : in Status_Bar_Type; Text : in String; Field : in Integer := 0) is
  
  begin
  
    wx.Core.Status_Bar.C.SetStatusText(Get_wxObject(Self), Interfaces.C.Strings.New_String(Text), Interfaces.C.int(Field));
    
  end Set_Status_Text;
  
  
  procedure Set_Status_Widths(Self : in Status_Bar_Type; Widths : in Field_Widths_Array) is
  
    C_Array : Field_Widths_Array_To_C_int_Array.To_Array_Type(Widths'Range) := Field_Widths_Array_To_C_int_Array.Convert_Array(Widths);
    
  begin
  
    wx.Core.Status_Bar.C.SetStatusWidths(
      Get_wxObject(Self),
      Interfaces.C.int(C_Array'Length),
      Address_To_Int_Access.To_Address(C_Array(C_Array'First)'Unchecked_Access));
    
  end Set_Status_Widths;
  
  
  procedure Set_Status_Styles(Self : in Status_Bar_Type; Styles : in Field_Styles_Array) is
  
    C_Array : Field_Styles_Array_To_C_int_Array.To_Array_Type(Styles'Range) := Field_Styles_Array_To_C_int_Array.Convert_Array(Styles);
    
  begin
  
    wx.Core.Status_Bar.C.SetStatusStyles(
      Get_wxObject(Self),
      Interfaces.C.int(C_Array'Length),
      Address_To_Int_Access.To_Address(C_Array(C_Array'First)'Unchecked_Access));
    
  end Set_Status_Styles;
  

  -- Status_Bar_Factory.
  function Status_Bar_Factory return Root_WX_Class is
  
  begin
  
    return new Status_Bar_Type;
  
  end Status_Bar_Factory;
  
begin

  wx.Factory.Add_Factory("wxStatusBar", Status_Bar_Factory'Access);
  
end wx.Core.Status_Bar;
