-- wx-single_linked_list.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Deallocation;

package body wx.Single_Linked_List is

  procedure Free is new Ada.Unchecked_Deallocation(Link_Type, Link_Access);
  
  
  function Is_Empty(Self : in Single_Linked_List_Type) return Boolean is
  
  begin
  
    if Self.Head = null then
    
      return True;
      
    end if;
    
    return False;
    
  end Is_Empty;
  
  
  procedure Add_Head(Self : in out Single_Linked_List_Type; Element : in Element_Type) is
  
    New_Link : Link_Access := new Link_Type'(Item => Element, Next => Self.Head);
    
  begin
  
    Self.Head := New_Link;
    
  end Add_Head;
  
  
  procedure Remove_Head(Self : in out Single_Linked_List_Type) is
  
    New_Head : Link_Access := Self.Head.Next;
    
  begin
    
    Free(Self.Head);
    
    Self.Head := New_Head;
    
  end Remove_Head;
  
  
  function Head(Self : in Single_Linked_List_Type) return Link_Access is
  
  begin
  
    return Self.Head;
    
  end Head;
  
  
  function Next(Link : in Link_Access) return Link_Access is
  
  begin
  
    return Link.Next;
    
  end Next;
  
  
  function Element(Link : in Link_Access) return Element_Type is
  
  begin
  
   return Link.Item;
   
  end Element;
  
  
  procedure Finalize(Self : in out Single_Linked_List_Type) is
  
  begin
  
    while not Is_Empty(Self) loop
    
      Remove_Head(Self);
      
    end loop;
    
  end Finalize;
  
end wx.Single_Linked_List;
