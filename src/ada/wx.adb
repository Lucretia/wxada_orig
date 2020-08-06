-- wx.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with System;
with Interfaces.C.Strings;

package body wx is

  procedure Set_wxObject(Self : in out Root_WX_Type; Internal : in System.Address; Owner : in Boolean) is
  
  begin
  
    Self.wxObject := Internal;
    Self.Owner    := Owner;
    
  end Set_wxObject;
  
  
  function Get_wxObject(Self : in Root_WX_Type) return System.Address is
  
  begin
  
    return Self.wxObject;
    
  end Get_wxObject;
  
  
  function Is_wxObject_Owner(Self : in Root_WX_Type) return Boolean is
  
  begin
  
    return Self.Owner;
    
  end Is_wxObject_Owner;
  
  
  function wxSupport_GetClassName(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, wxSupport_GetClassName, "wxSupport_GetClassName");

  function Get_CPP_Class_Name(Self : in System.Address) return String is
  
  begin
 
    return Interfaces.C.Strings.Value(wxSupport_GetClassName(Self));
    
  end Get_CPP_Class_Name;
  

  function Get_CPP_Class_Name(Self : in Root_WX_Type) return String is
  
  begin
 
    return Interfaces.C.Strings.Value(wxSupport_GetClassName(Get_wxObject(Self)));
    
  end Get_CPP_Class_Name;
  

  -- We can't make this an abstract type, as it needs to be derived from Limited_Controlled, so we raise an exception
  -- within these two sub-programs.
  procedure Initialize(Self : in out Root_WX_Type) is
  
  begin
  
    raise Root_WX_Error;
    
  end Initialize;
  
  
  procedure Finalize(Self : in out Root_WX_Type) is
  
  begin
  
    raise Root_WX_Error;
    
  end Finalize;
  
end wx;
