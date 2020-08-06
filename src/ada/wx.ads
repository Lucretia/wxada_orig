-- wx.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Finalization;
with Ada.Unchecked_Conversion;
with System;
with Interfaces.C;

package wx is
  
--  pragma Preelaborate;
  
  type VoidPtr is private;
  
  type Root_WX_Type is new Ada.Finalization.Limited_Controlled with private;
  type Root_WX_Class is access all Root_WX_Type'Class;
  
  Root_WX_Error : exception;
  
  procedure Set_wxObject(Self : in out Root_WX_Type; Internal : in System.Address; Owner : in Boolean);
  pragma Inline(Set_wxObject);
  
  function Get_wxObject(Self : in Root_WX_Type) return System.Address;
  pragma Inline(Get_wxObject);
  
  function Is_wxObject_Owner(Self : in Root_WX_Type) return Boolean;
  pragma Inline(Is_wxObject_Owner);

  function Get_CPP_Class_Name(Self : in System.Address) return String;
  pragma Inline(Get_CPP_Class_Name);

  function Get_CPP_Class_Name(Self : in Root_WX_Type) return String;
  pragma Inline(Get_CPP_Class_Name);

private
  
  type VoidPtr is access all Interfaces.C.unsigned_char;
  
  type Root_WX_Type is new Ada.Finalization.Limited_Controlled with
    record
      wxObject : System.Address  := System.Null_Address;
      Owner    : Boolean         := False;
    end record;
  
  procedure Initialize(Self : in out Root_WX_Type);
  procedure Finalize(Self : in out Root_WX_Type);

end wx;
