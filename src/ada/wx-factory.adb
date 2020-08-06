-- wx-factory.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- This factory mechanism is used for creating Ada types from C++ names.
with Interfaces;
with wx.Debug;

package body wx.Factory is

  package body Hash_Table is

    use type Interfaces.Unsigned_32;
    
    function Hash(Item : in String) return Hash_Table_Index_Type is

      Hash_Value : Interfaces.Unsigned_32;
    
    begin
  
      Hash_Value := Character'Pos(Item(Item'First));
    
      for Index in Item'First + 1 .. Item'Last loop
    
        Hash_Value := Interfaces.Shift_Left(Hash_Value, 4) + Character'Pos(Item(Index));
      
      end loop;
      
      return Hash_Table_Index_Type(Hash_Value mod Interfaces.Unsigned_32(Hash_Table_Size));
    
    end Hash;
  
  
    procedure Insert(Key : in String; Element : in Factory_Constructor_Type) is
    
      Index         : Hash_Table_Index_Type     := Hash(Key);
      Table_Element : Hash_Table_Element_Access := null;
      
    begin
  
      --wx.Debug.Put_Line("Index: " & Hash_Table_Index_Type'Image(Index));
      
      if Key'Length = 0 then
    
        raise Hash_String_Length;
    
      end if;
    
      if Contains(Key, Index) = True then
    
        -- There is a collision, i.e. an entry already exists, so we need to tag this entry onto the end of the list.
        Table_Element := Hash_Table(Index);
      
        while Table_Element.Next /= null loop
      
         Table_Element := Table_Element.Next;
       
        end loop;
    
        Table_Element.Next := new Hash_Table_Element_Type'(
          Key     => Ada.Strings.Unbounded.To_Unbounded_String(Key),
          Element => Element,
          Next    => null);
          
        return;
        
      end if;

      -- This is the first entry in this table entry's list.
      Hash_Table(Index) := new Hash_Table_Element_Type'(
        Key     => Ada.Strings.Unbounded.To_Unbounded_String(Key),
        Element => Element,
        Next    => null);
    
    end Insert;
  
  
    function Contains(Key : in String; Index : in Hash_Table_Index_Type) return Boolean is
    
      Table_Element : Hash_Table_Element_Access              := null;
      Unbounded_Key : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String(Key);
      
    begin
  
      wx.Debug.Put_Line("[wx.Factory.Hash_Table.Contains] Index: " & Hash_Table_Index_Type'Image(Index));
      
      if Key'Length = 0 then
    
        raise Hash_String_Length;
    
      end if;

      -- Does the key exist in this table entry's list?
      Table_Element := Hash_Table(Index);
      
      while Table_Element /= null loop
      
       if Table_Element.Key = Unbounded_Key then
       
         return True;
       
       end if;
       
       Table_Element := Table_Element.Next;
       
      end loop;
      
      return False;
    
    end Contains;
  
  
    function Contains(Key : in String) return Boolean is
    
    begin
    
      return Contains(Key, Hash(Key));
      
    end Contains;
    
    
    function Find(Key : in String) return Factory_Constructor_Type is
  
      Index         : Hash_Table_Index_Type                  := Hash(Key);
      Table_Element : Hash_Table_Element_Access              := null;
      Unbounded_Key : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String(Key);
      
    begin
  
      if Key'Length = 0 then
    
        raise Hash_String_Length;
    
      end if;
    
      -- Find the key in this table entry's list.
      Table_Element := Hash_Table(Index);
      
      while Table_Element /= null loop
      
       if Table_Element.Key = Unbounded_Key then
       
         return Table_Element.Element;
       
       end if;
       
       Table_Element := Table_Element.Next;
       
      end loop;
      
      return null;
    
    end Find;
  
  end Hash_Table;

  -- This is factory code, this should only be used from within wxAda itself!
  
  function Create_Ada_Type(
    CPP_Class_Name : in String;
    Internal       : in System.Address;
    Owner          : in Boolean) return Root_WX_Class is
  
    Factory : Factory_Constructor_Type := null;
    
  begin
  
    -- Find the factory sub-program.
    if Hash_Table.Contains(CPP_Class_Name) = False then -- Ada 2005
    
      raise Factory_Error;

    else

      Factory := Hash_Table.Find(CPP_Class_Name);
      
    end if;

    -- Now call it and create the object and return it.
    declare
    
      Object : Root_WX_Class := Factory.all;
      
    begin

      Set_wxObject(Object.all, Internal, Owner);
      
      return Object;
    
    end;
	    
  end Create_Ada_Type;
  
  
  procedure Add_Factory(CPP_Class_Name : in String; Factory : in Factory_Constructor_Type) is
  
  begin
  
    if Hash_Table.Contains(CPP_Class_Name) = True then
    
      raise Factory_Error;
    
    else

      wx.Debug.Put_Line("[wx.Factory.Add_Factory] " & CPP_Class_Name & " Added...");
      
      Hash_Table.Insert(CPP_Class_Name, Factory);
      
    end if;
    
  end Add_Factory;

end wx.Factory;
