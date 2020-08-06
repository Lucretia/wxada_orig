-- wx-base-handle.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Ada.Finalization;

generic

  -- Not an actual pointer, just the type that we will be creating an access type of.
  type Data_Type is limited private;
  
package wx.Base.Handle is

  type Handle_Type is private;
  type Data_Access is access all Data_Type;

  function New_Handle return Handle_Type;
  function Ref(Self : in Handle_Type) return Data_Access;
  function Value(Self : in Handle_Type) return Data_Type;
  
private

  type Referenced_Handle_Type is
    record
      Data      : aliased Data_Type;
      Ref_Count : Natural;
    end record;
    
  type Referenced_Handle_Access is access Referenced_Handle_Type;

  type Handle_Type is new Ada.Finalization.Controlled with
    record
      Handle_Data : Referenced_Handle_Access := null;
    end record;

  procedure Adjust(Self : in out Handle_Type);
  procedure Finalize(Self : in out Handle_Type);
  
end wx.Base.Handle;
