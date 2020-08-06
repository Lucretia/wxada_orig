-- wx-instance_store.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Unchecked_Conversion;
with System.Address_Image;
with wx.Debug;
with wx.Dynamic_Array;
with wx.Single_Linked_List;

use type System.Address;

package body wx.Instance_Store is
    
  procedure Add(Key : in System.Address; Element : in Root_WX_Class) is
  
    New_Instance : Instance_Type := (Key, Element);
    
  begin
  
    Instance_List.Add_Head(Instances, New_Instance);
    
  end Add;
  
  
  function Find(Key : in System.Address) return Root_WX_Class is
  
    function Contains(Key : in System.Address) return Boolean is
    
      Link    : Instance_List.Link_Access := Instance_List.Head(Instances);
      Success : Boolean                   := False;
      
    begin
    
      loop
      
        if Instance_List.Element(Link).Address = Key then
        
          Success := True;
          
          exit;
          
        end if;
      
        Link := Instance_List.Next(Link);
      
      end loop;
      
      return Success;
      
    end Contains;
    
  
    function Find_Instance(Key : in System.Address) return Root_WX_Class is
    
      Link    : Instance_List.Link_Access := Instance_List.Head(Instances);
      
    begin
    
      while Instance_List.Element(Link).Address /= Key loop
        
        Link := Instance_List.Next(Link);
      
      end loop;
      
      return Instance_List.Element(Link).Object;
      
    end Find_Instance;
    
  
  begin
  
    if Contains(Key) = False then
    
      raise Instance_Store_Error;
    
    else
    
      return Find_Instance(Key);
      
    end if;

  end Find;

end wx.Instance_Store;
