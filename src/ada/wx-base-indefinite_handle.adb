-- wx-base-indefinite_handle.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Unchecked_Deallocation;

package body wx.Base.Indefinite_Handle is

  -- New_Indefinite_Handle.
  --
  -- Create a handle type with an access type.
  function New_Indefinite_Handle(Data : in Data_Access) return Indefinite_Handle_Type is
  
    --Local : Referenced_Handle_Access;
    Local : Indefinite_Handle_Type;
    
  begin
  
--    Text_IO.Put_Line("Indefinite_Handle.New_Object: Enter");
    
    --Local := new Referenced_Handle_Type;
    
    Local.Data      := Data;
    Local.Ref_Count := 1;
  
--    Text_IO.Put_Line("Indefinite_Handle.New_Object: Exit");
    
    --return (Ada.Finalization.Controlled with Local);
    return Local;
    
  end New_Indefinite_Handle;
  

  -- Ref.
  --
  -- Return the access type of the handle, so we can manipulate it.
  function Ref(Self : in Indefinite_Handle_Type) return Data_Access is
  
  begin
  
--    Text_IO.Put_Line("Indefinite_Handle.Ref: Enter");
    
    --return Self.Handle_Data.Data;
    return Self.Data;
    
  end Ref;

  
  -- Value
  --
  -- Return a copy of the object.
  function Value(Self : in Indefinite_Handle_Type) return Data_Type is
  
  begin
  
    --return Self.Handle_Data.Data.all;
    return Self.Data.all;
    
  end Value;
  
  
  -- Adjust
  procedure Adjust(Self : in out Indefinite_Handle_Type) is
  
  begin

--    Text_IO.Put_Line("Indefinite_Handle.Adjust: Enter");
    
    --Self.Handle_Data.Ref_Count := Self.Handle_Data.Ref_Count + 1;
    Self.Ref_Count := Self.Ref_Count + 1;

--    Text_IO.Put_Line("Indefinite_Handle.Adjust: Self.Handle_Data.Ref_Count = " & Natural'Image(Self.Handle_Data.Ref_Count));
      
--    Text_IO.Put_Line("Indefinite_Handle.Adjust: Exit");
    
  end Adjust;
  
  
  -- Finalize
  procedure Finalize(Self : in out Indefinite_Handle_Type) is
  
    procedure Free_Data is new Unchecked_Deallocation(Data_Type, Data_Access);
    --procedure Free_Handle is new Unchecked_Deallocation(Referenced_Handle_Type, Referenced_Handle_Access);
  
  begin

--    Text_IO.Put_Line("Indefinite_Handle.Finalize: Enter");
    
    --if Self.Handle_Data /= null then
    if Self.Data /= null then
    
      --Self.Handle_Data.Ref_Count := Self.Handle_Data.Ref_Count - 1;
      Self.Ref_Count := Self.Ref_Count - 1;
    
--      Text_IO.Put_Line("Indefinite_Handle.Finalize: Self.Handle_Data.Ref_Count = " & Natural'Image(Self.Handle_Data.Ref_Count));
      
      --if Self.Handle_Data.Ref_Count = 0 then
      if Self.Ref_Count = 0 then
    
--        Text_IO.Put_Line("Indefinite_Handle.Finalize: Deallocating Handle_Data.Data...");
    
        --Free_Data(Self.Handle_Data.Data);
        Free_Data(Self.Data);

--        Text_IO.Put_Line("Indefinite_Handle.Finalize: Deallocated Handle_Data.Data");
    
        --if Self.Handle_Data.Data /= null then
        
        --  raise Program_Error;
          
        --end if;
        
        --Free_Handle(Self.Handle_Data);

--        Text_IO.Put_Line("Indefinite_Handle.Finalize: Deallocated Handle_Data");
    
        --if Self.Handle_Data /= null then
        
        --  raise Program_Error;
          
        --end if;
        
--        Self.Handle_Data := null;
        Self.Data := null;
      
--        Text_IO.Put_Line("Indefinite_Handle.Finalize: Deallocated memory");
      
      end if;
      
    end if;
    
--    Text_IO.Put_Line("Indefinite_Handle.Finalize: Exit");
    
  end Finalize;
  
end wx.Base.Indefinite_Handle;
