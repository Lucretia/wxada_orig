-- wx-instance_store.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- The instance store provides a way for the C code to know about the Ada side so that the correct Ada type can be passed
-- from a C++ virtual to an Ada primitive type. The general mechanism is as follows:
--   1) Virtual is called in C++ class, this class must have been derived in the C/C++ wrapper code,
--      e.g. wxAdaWindow::CaptureMouse() in wxcore_window.h & wxcore_window_virtuals.h.
--   2) Inside the wrapped virtual call, the Ada "virtual" primitive is called, e.g. Ada_Window_Capture_Mouse in wx-core-window.ad[sb].
--   3) Inside the Ada "virtual" primitive, the actual Ada class is retrieved and passed to the Ada "non-virtual" primitive,
--      e.g. Capture_Mouse.
--
-- TODO: Remove the dependency on the charles library!!
with Ada.Finalization;
with System;
with wx.Single_Linked_List;

private package wx.Instance_Store is

  -- TODO:
  --   Use the wx.Dynamic_Array and wx.Single_Linked_List for the implementation of the instance store.
  --   The wx.Dynamic_Array will contain the actual Root_WX_Class elements and the wx.Single_Linked_List will
  --   contain any empty indices into the wx.Dynamic_Array so that insertion into the array is faster.
  
  Instance_Store_Error : exception;
  
  procedure Add(Key : in System.Address; Element : in Root_WX_Class);
  pragma Inline(Add);
  
  function Find(Key : in System.Address) return Root_WX_Class;
  pragma Export(C, Find, "wxInstanceStore_FindClass");
  
--  function Find(Key : in Factory_Class) return System.Address;

private

  type Instance_Type is 
    record
      Address : System.Address;
      Object  : Root_WX_Class;
    end record;

  package Instance_List is new wx.Single_Linked_List(Instance_Type);

  Instances : Instance_List.Single_Linked_List_Type;
    
end wx.Instance_Store;
