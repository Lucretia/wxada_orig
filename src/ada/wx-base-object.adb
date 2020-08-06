-- wx-base-object.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--with Ada.Strings.Hash;
--with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Tags;
--with System.Address_To_Access_Conversions;
with wx.Debug;
with wx.Instance_Store;
with wx.Factory;
with wx.Base.Object.C;

package body wx.Base.Object is

  use type System.Address;

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
  --package Address_To_Object is new System.Address_To_Access_Conversions(Object_Type);
  --use Address_To_Object;
  
  procedure New_Object(Self : in out Object_Type) is
  
    CPP_Instance : System.Address := wx.Base.Object.C.ctor;
    
  begin
  
    Set_wxObject(Self, CPP_Instance, True);
    
    wx.Instance_Store.Add(CPP_Instance, Self'Unchecked_Access);
    
  end New_Object;


  -- Initialize.
  -- 
  -- This is defined so that an exception isn't raised in the base type's Initialize subprogram.
  procedure Initialize(Self : in out Object_Type) is
  
  begin
  
    null;
  
  end Initialize;
  
  
  -- Finalize.
  procedure Finalize(Self : in out Object_Type) is
  
    Self_Class : Object_Class := Self'Unchecked_Access;
    
  begin
  
    wx.Debug.Put_Line("[wx.Base.Object.Finalize] Tag: " & Ada.Tags.Expanded_Name(Self_Class'Tag));
    
    if Is_wxObject_Owner(Self) = True then
    
--      Put_Line("[wx.Base.Object.Finalize] Enter for object of type " & Get_CPP_Class_Name(Self.wxObject));
      wx.Debug.Put_Line("[wx.Base.Object.Finalize] Enter for object of type " & Get_CPP_Class_Name(Get_wxObject(Self)));
    
      wx.Debug.Put_Line("[wx.Base.Object.Finalize] Non-null object!");
      
      wx.Base.Object.C.dtor(Get_wxObject(Self));
    
      Set_wxObject(Self, System.Null_Address, False);
      
      wx.Debug.Put_Line("[wx.Base.Object.Finalize] Not crashed then!");
    
    end if;
    
    wx.Debug.Put_Line("[wx.Base.Object.Finalize] Exit");
  
  end Finalize;


  -- Object_Factory.
  function Object_Factory return Root_WX_Class is
  
  begin
  
    return new Object_Type;
  
  end Object_Factory;

begin

  wx.Factory.Add_Factory("wxObject", Object_Factory'Access);

end wx.Base.Object;
