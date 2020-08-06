-- wx-dynamic_array.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- A simple dynamic array implementation for wxAda. Higher level management should be implemented outside
-- this package.
-- Should the ADT's have iterators or similar? If so, how should these be implemented? As class-wide types?
-- TODO: Move this package into a new child: wx.Utilities.
with Ada.Finalization;

generic

  type Element_Type is (<>);

  Initial_Array_Size : Natural := 10;  -- The starting size of the array.
  Array_Delta        : Natural := 20;  -- When we run out of space, this is how many elements to increase the array by.

package wx.Dynamic_Array is

  Array_Size_Error : exception;  -- Raised when the array cannot grow anymore.
  
  subtype Index_Type is Natural range Natural'First .. Natural'Last;  -- This is the actual allowed range for the array indices.
  type Dynamic_Array_Type is new Ada.Finalization.Controlled with private;
  
  procedure Set(Self : in out Dynamic_Array_Type; Index : in Index_Type; Element : in Element_Type);
  function Get(Self : in Dynamic_Array_Type; Index : in Index_Type) return Element_Type;
  function Is_In(Self : in Dynamic_Array_Type; Element : in Element_Type) return Boolean;
  procedure Grow(Self : in out Dynamic_Array_Type; Delta_Size : in Index_Type := Array_Delta);

  procedure Initialize(Self : in out Dynamic_Array_Type);
  procedure Finalize(Self : in out Dynamic_Array_Type);
  
private

  type Element_Array_Type is array (Index_Type range <>) of Element_Type;
  type Element_Array_Access is access Element_Array_Type;
  
  type Dynamic_Array_Type is new Ada.Finalization.Controlled with
    record
      Elements : Element_Array_Access;
    end record;

end wx.Dynamic_Array;
