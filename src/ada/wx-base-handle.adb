-- wx-base-handle.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Unchecked_Deallocation;

package body wx.Base.Handle is

  -- New_Object.
  --
  -- Create a handle type with an access type.
  function New_Handle return Handle_Type is
  
    Local : Referenced_Handle_Access;
    
  begin
  
--    Text_IO.Put_Line("New_Object: Enter");
    
    Local := new Referenced_Handle_Type;
    
    Local.Ref_Count := 1;
  
--    Text_IO.Put_Line("New_Object: Exit");
    
    return (Ada.Finalization.Controlled with Local);
    
  end New_Handle;
  

  -- Ref.
  --
  -- Return the access type of the handle, so we can manipulate it.
  function Ref(Self : in Handle_Type) return Data_Access is
  
  begin
  
--    Text_IO.Put_Line("Ref: Enter");
    
    return Self.Handle_Data.Data'Access;
    
  end Ref;

  
  -- Value
  --
  -- Return a copy of the object.
  function Value(Self : in Handle_Type) return Data_Type is
  
  begin
  
    return Self.Handle_Data.Data;
    
  end Value;
  
  
  -- Adjust
  procedure Adjust(Self : in out Handle_Type) is
  
  begin

--    Text_IO.Put_Line("Adjust: Enter");
    
    Self.Handle_Data.Ref_Count := Self.Handle_Data.Ref_Count + 1;

--    Text_IO.Put_Line("Adjust: Self.Handle_Data.Ref_Count = " & Natural'Image(Self.Handle_Data.Ref_Count));
      
--    Text_IO.Put_Line("Adjust: Exit");
    
  end Adjust;
  
  
  -- Finalize
  procedure Finalize(Self : in out Handle_Type) is
  
    procedure Free_Handle is new Unchecked_Deallocation(Referenced_Handle_Type, Referenced_Handle_Access);
  
  begin

--    Text_IO.Put_Line("Finalize: Enter");
    
    if Self.Handle_Data /= null then
    
      Self.Handle_Data.Ref_Count := Self.Handle_Data.Ref_Count - 1;
    
--      Text_IO.Put_Line("Finalize: Self.Handle_Data.Ref_Count = " & Natural'Image(Self.Handle_Data.Ref_Count));
      
      if Self.Handle_Data.Ref_Count = 0 then
    
        Free_Handle(Self.Handle_Data);
          
        Self.Handle_Data := null;
      
--        Text_IO.Put_Line("Finalize: Deallocated memory");
      
      end if;
      
    end if;
    
--    Text_IO.Put_Line("Finalize: Exit");
    
  end Finalize;
  
end wx.Base.Handle;
