-- wx-base-object.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- Notes:
--   In C++ the wxObject class handles creation of new instances from this class knowing the string name of the class. Also,
--   it allows handles RTTI, we don't really need this functionality in Ada, due to the 'Class and 'Tag attributes.
--   Should referencing be handled?
--   What would be the point of being able to copy instances of these types? Would it actually work? I don't know. Come back to this later.
--   For types that derive from wxWindow, in the Finalization procedure, call Destroy to remove the window from the hierarchy.
--     This will handle the deletion of the window and we can then set the wxCXX_Object back to null.
--   Use exceptions for errors.
with Ada.Finalization;

package wx.Base.Object is

  -- This is the base type to all of the wx types (wxObject).
--  type Object_Type is new Ada.Finalization.Limited_Controlled with private;
  type Object_Type is new Root_WX_Type with private;
  type Object_Class is access all Object_Type'Class;

  -- A two step construction process allows the creation of the object, then the initialisation of the object. This is required for
  -- derived types, where the New_<type> primitive will be different yet the base type's Create primitive will still be required.
  procedure New_Object(Self : in out Object_Type);

private

  -- It may be necessary to create an instance of an object which isn't owned by the Ada runtime.
  -- For an example, see wx.Base.Event_Handler.Ada_Event_Handler.
  type Object_Type is new Root_WX_Type with null record;
    
  procedure Initialize(Self : in out Object_Type);
  procedure Finalize(Self : in out Object_Type);

end wx.Base.Object;
