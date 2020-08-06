-- wx-single_linked_list.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- A simple Single linked list implementation for wxAda. Higher level management should be implemented outside
-- this package.
-- TODO: Move this package into a new child: wx.Utilities.
with Ada.Finalization;

generic

  type Element_Type is private;

package wx.Single_Linked_List is

  type Link_Type is limited private;
  type Link_Access is access Link_Type;
  type Single_Linked_List_Type is new Ada.Finalization.Controlled with private;

  function Is_Empty(Self : in Single_Linked_List_Type) return Boolean;
  procedure Add_Head(Self : in out Single_Linked_List_Type; Element : in Element_Type);
  procedure Remove_Head(Self : in out Single_Linked_List_Type);
  function Head(Self : in Single_Linked_List_Type) return Link_Access;
  function Next(Link : in Link_Access) return Link_Access;
  function Element(Link : in Link_Access) return Element_Type;
  
  procedure Finalize(Self : in out Single_Linked_List_Type);

private

  type Link_Type is
    record
      Item : Element_Type;
      Next : Link_Access := null;
    end record;
    
  type Single_Linked_List_Type is new Ada.Finalization.Controlled with
    record
      Head : Link_Access := null;  -- Initialise the list here, rather than calling a subprogram.
    end record;
    
end wx.Single_Linked_List;
