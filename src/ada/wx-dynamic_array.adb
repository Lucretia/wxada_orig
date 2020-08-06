-- wx-dynamic_array.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Deallocation;

package body wx.Dynamic_Array is

  procedure Free is new Ada.Unchecked_Deallocation(Element_Array_Type, Element_Array_Access);
  
  
  procedure Set(Self : in out Dynamic_Array_Type; Index : in Index_Type; Element : in Element_Type) is
  
  begin
  
    if Index not in Self.Elements'Range then
    
      raise Constraint_Error;
    
    end if;
    
    Self.Elements(Index) := Element;
    
  end Set;
  
  
  function Get(Self : in Dynamic_Array_Type; Index : in Index_Type) return Element_Type is
  
  begin
  
    if Index not in Self.Elements'Range then
    
      raise Constraint_Error;
    
    end if;
    
    return Self.Elements(Index);
    
  end Get;
  
  
  function Is_In(Self : in Dynamic_Array_Type; Element : in Element_Type) return Boolean is
  
  begin
  
    for Index in Self.Elements'Range loop
    
      if Self.Elements(Index) = Element then
      
        return True;
        
      end if;
        
    end loop;
    
    return False;
    
  end Is_In;
  
  
  procedure Grow(Self : in out Dynamic_Array_Type; Delta_Size : in Index_Type := Array_Delta) is
  
    New_Size     : constant Index_Type  := Self.Elements'Last + Delta_Size;  -- Get the new array size.
    New_Elements : Element_Array_Access := new Element_Array_Type(Index_Type'First .. New_Size);
    
  begin
  
    New_Elements(Self.Elements'Range) := Self.Elements(Self.Elements'Range);  -- Copy the array over to the new one.
    Free(Self.Elements);
    
    Self.Elements := New_Elements;
    Self.Elements := null;
    
  end Grow;
  

  procedure Initialize(Self : in out Dynamic_Array_Type) is
  
  begin
  
    Self.Elements := new Element_Array_Type(Index_Type'First .. Initial_Array_Size);
    
  end Initialize;
  
  
  procedure Finalize(Self : in out Dynamic_Array_Type) is
  
  begin
  
    Free(Self.Elements);
    
    Self.Elements := null;  -- Just to make sure!
    
  end Finalize;
  
end wx.Dynamic_Array;
