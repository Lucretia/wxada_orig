-- wx-base-indefinite_handle.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Finalization;

generic

  -- Not an actual pointer, just the type that we will be creating an access type of.
  type Data_Type(<>) is limited private;
  
package wx.Base.Indefinite_Handle is

  type Indefinite_Handle_Type is private;
  type Data_Access is access all Data_Type;

  function New_Indefinite_Handle(Data : in Data_Access) return Indefinite_Handle_Type;
  function Ref(Self : in Indefinite_Handle_Type) return Data_Access;
  function Value(Self : in Indefinite_Handle_Type) return Data_Type;
  
private

  --type Referenced_Handle_Type is
  --  record
  --    Data      : Data_Access;
  --    Ref_Count : Natural;
  --  end record;
    
  --type Referenced_Handle_Access is access Referenced_Handle_Type;

  type Indefinite_Handle_Type is new Ada.Finalization.Controlled with
    record
      --Handle_Data : Referenced_Handle_Access := null;
      Data      : Data_Access;
      Ref_Count : Natural;
    end record;

  procedure Adjust(Self : in out Indefinite_Handle_Type);
  procedure Finalize(Self : in out Indefinite_Handle_Type);
  
end wx.Base.Indefinite_Handle;
