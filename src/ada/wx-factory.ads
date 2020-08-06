-- wx-factory.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- This factory mechanism is used for creating Ada types from C++ names.
with Ada.Finalization;
with Ada.Strings.Unbounded;
with System;

use type Ada.Strings.Unbounded.Unbounded_String;

private package wx.Factory is

  -- This is factory code, this should only be used from within wxAda itself!
  
  type Factory_Constructor_Type is access function return Root_WX_Class;

  -- A very simple hashed table for storing factory callbacks. If there is a collision, we follow the linked list and add it to the end.
  package Hash_Table is

    Hash_Table_Collision : exception;
    Hash_String_Length   : exception;
    Hash_Table_Size      : constant Integer := 127;
      
    type Hash_Table_Index_Type is range 0 .. Hash_Table_Size;
    type Hash_Table_Type is private;

    function Hash(Item : in String) return Hash_Table_Index_Type;
  
    procedure Insert(Key : in String; Element : in Factory_Constructor_Type);
    function Contains(Key : in String; Index : in Hash_Table_Index_Type) return Boolean;
    function Contains(Key : in String) return Boolean;
    function Find(Key : in String) return Factory_Constructor_Type;
  
  private
  
    type Hash_Table_Element_Type;
    type Hash_Table_Element_Access is access Hash_Table_Element_Type;
    type Hash_Table_Element_Type is
    record
      Key     : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
      Element : Factory_Constructor_Type               := null;
      Next    : Hash_Table_Element_Access              := null;
    end record;
    
    type Hash_Table_Type is array (Hash_Table_Index_Type) of Hash_Table_Element_Access;
    
    Hash_Table : Hash_Table_Type := (others => null);
    
  end Hash_Table;
  

  Factory_Error : exception;
  
  function Create_Ada_Type(
    CPP_Class_Name : in String;
    Internal       : in System.Address;
    Owner          : in Boolean) return Root_WX_Class;
  
  procedure Add_Factory(CPP_Class_Name : in String; Factory : in Factory_Constructor_Type);
  
end wx.Factory;
