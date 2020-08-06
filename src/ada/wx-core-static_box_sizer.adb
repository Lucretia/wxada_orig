-- wx-core-static_box_sizer.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Instance_Store;
with wx.Core.Static_Box_Sizer.C;

package body wx.Core.Static_Box_Sizer is

  procedure New_Static_Box_Sizer(
    Self        : in out Static_Box_Sizer_Type;
    Box         : in wx.Core.Static_Box.Static_Box_Type'Class;
    Orientation : in wx.Core.Box_Sizer.Box_Sizer_Orientation_Type) is
  
    type Static_Box_Constant_Class is access constant wx.Core.Static_Box.Static_Box_Type'Class;
    
    function To_Non_Constant is new Ada.Unchecked_Conversion(
      Source => Static_Box_Constant_Class,
      Target => wx.Core.Static_Box.Static_Box_Class);
      
    CPP_Instance : System.Address := System.Null_Address;
    
  begin
  
    CPP_Instance := wx.Core.Static_Box_Sizer.C.ctor(wx.Core.Static_Box.Get_wxObject(Box), Interfaces.C.int(Orientation));
    
    -- Make sure we don't set this to be the owner otherwise when the application shuts down, it'll try to delete the object
    -- and that object will already have been deleted by wxWidgets!
    Set_wxObject(Self, CPP_Instance, False);--True);
    
    Self.Box := To_Non_Constant(Box'Unchecked_Access);
    
    wx.Instance_Store.Add(CPP_Instance, Self'Unchecked_Access);
    
  end New_Static_Box_Sizer;
  
  
  function Get_Static_Box(Self : in Static_Box_Sizer_Type) return wx.Core.Static_Box.Static_Box_Class is
  
--    package Address_To_Object is new System.Address_To_Access_Conversions(Static_Box_Type);
--    use Address_To_Object;
    
  begin

    --if Self.Box /= null then
    
    --  return Self.Box;
    
    --end if;
        
--    declare
    
--      Proxy_Sizer : Static_Box_Class := Static_Box_Class(Create_Ada_Type(Get_CPP_Class_Name(Get_wxObject(Self))));
    
--    begin
    
--      Set_wxObject(Proxy_Sizer.all, GetStaticBox(Get_wxObject(Self)), False);
      
--      return Proxy_Sizer;
    
--    end;

    return wx.Core.Static_Box.Static_Box_Class(
      wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Self), wx.Core.Static_Box_Sizer.C.GetStaticBox(Get_wxObject(Self)), False));
    
  end Get_Static_Box;

    
  -- Static_Box_Sizer_Factory.
  function Static_Box_Sizer_Factory return Root_WX_Class is
  
  begin
  
    return new Static_Box_Sizer_Type;
  
  end Static_Box_Sizer_Factory;
  
begin

  wx.Factory.Add_Factory("wxStaticBoxSizer", Static_Box_Sizer_Factory'Access);
  
end wx.Core.Static_Box_Sizer;
