-- wx-core-validator.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System.Address_To_Access_Conversions;
with wx.Debug;
with wx.Factory;
with wx.Core.Validator.C;

use type Interfaces.C.int;
use type wx.VoidPtr;

package body wx.Core.Validator is

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
--  package Address_To_Object is new System.Address_To_Access_Conversions(Event_Type);
--  use Address_To_Object;
  
  package Address_To_Validator_Access is new System.Address_To_Access_Conversions(Validator_Type);
  use Address_To_Validator_Access;
    
  procedure New_Validator(Self : in out Validator_Type) is
  
--	procedure wxEvent_SetAdaEvent(Self : in wxObject_Access; AdaEvent : in VoidPtr);
--	pragma Import(C, wxEvent_SetAdaEvent, "wxEvent_SetAdaEvent");
	
--    function Validator_Class_To_VoidPtr is new Ada.Unchecked_Conversion(Source => Validator_Class, Target => VoidPtr);

    -- Get hold of the Class-wide type's address, rather than the address of Self.
--    Self_Class : Validator_Class := Self'Unchecked_Access;
    
  begin
  
    wx.Debug.Put_Line("[wx.Core.Validator.New_Validator] Enter");
    
    -- Set the Ada type to contain the pointer to the C++ instance.
--    Set_wxObject(Self, ctor(Validator_Class_To_VoidPtr(Self_Class)), True);
    Set_wxObject(Self, wx.Core.Validator.C.ctor(To_Address(Self'Unchecked_Access)), True);
    
    -- Now install the Ada event type's address into the C++ instance. This is how the event handler knows how to get hold of the
    -- Ada class wide type to pass to the callback.
    --SetAdaValidator(Get_wxObject(Self), Validator_Class_To_VoidPtr(Self_Class));
    
    wx.Debug.Put_Line("[wx.Core.Validator.New_Validator] Exit");
    
  end New_Validator;
  

  function Get_Window(Self : in Validator_Type) return wx.Core.Window.Window_Class is
  
--    Internal_Window : wxObject_Access := GetWindow(Get_wxObject(Self));
    Internal_Window : System.Address := wx.Core.Validator.C.GetWindow(Get_wxObject(Self));
    
  begin
  
    return wx.Core.Window.Window_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Internal_Window), Internal_Window, False));
    
  end Get_Window;
  

  procedure Set_Bell_On_Error(Self : in Validator_Type; Enable_Bell : in Boolean) is
  
    Enable_Bell_Converted : Interfaces.C.int := 0;
    
  begin
  
    if Enable_Bell = True then
    
      Enable_Bell_Converted := 1;
    
    end if;
  
	wx.Core.Validator.C.SetBellOnError(Get_wxObject(Self), Enable_Bell_Converted);
	
  end Set_Bell_On_Error;
  

  procedure Set_Window(Self : in Validator_Type; Window : in wx.Core.Window.Window_Type'Class) is
  
  begin
  
	wx.Core.Validator.C.SetWindow(Get_wxObject(Self), wx.Core.Window.Get_wxObject(Window));
	
  end Set_Window;
 
  
  function Transfer_From_Window(Self : in Validator_Type) return Boolean is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.Validator.Transfer_From_Window]");
    
    return False;
    
  end Transfer_From_Window;
  
  
  function Transfer_To_Window(Self : in Validator_Type) return Boolean is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.Validator.Transfer_To_Window]");
    
    return False;
  
  end Transfer_To_Window;
  
  
  function Validate(Self : in Validator_Type; Window : in wx.Core.Window.Window_Type'Class) return Boolean is
  
  begin
  
    wx.Debug.Put_Line("[wx.Core.Validator.Validate]");
    
    return False;
    
  end Validate;
  
  
   -- Set_Validator should really be in wx.Core.Window, but we get circular dependencies!
--  procedure Set_Validator(Self : in Window_Type; Validator : in Validator_Type) is
  
--    procedure wxWindow_SetValidator(Self, Validator : in System.Address);
--    pragma Import(C, wxWindow_SetValidator, "wxWindow_SetValidator");
    
--  begin
  
--    wxWindow_SetValidator(Get_wxObject(Self), Get_wxObject(Validator));
    
--  end Set_Validator;
  
  
  -- Finalize
--  procedure Finalize(Self : in out Event_Type) is
  
--    procedure wxEvent_dtor(Self : in wxObject_Access);
--    pragma Import(C, wxEvent_dtor, "wxEvent_dtor");
  
--  begin
  
--    if Get_wxObject(Self) /= Null_wxObject then
    
--      Put_Line("[wx.Base.Event.Finalize] Non-null event!");
--      if Is_wxObject_Owner(Self) = True then
    
--        wxEvent_dtor(Get_wxObject(Self));
      
--      end if;
--      Put_Line("[wx.Base.Event.Finalize] Not crashed then!");
      
--      Set_wxObject(Self, Null_wxObject, False);
    
--    end if;
    
--  end Finalize;

  procedure Initialize(Self : in out Validator_Type) is
  
  begin
  
    null;
    
  end Initialize;
  
  
  procedure Finalize(Self : in out Validator_Type) is
  
  begin
  
    null;
    
  end Finalize;
  

  -- ********************************************************** PRIVATE **********************************************************
  
  -- Construct_Ada_Event
  --
  -- This is a totally private function and should never be called from Ada code. It is called from the C event handling system to
  -- construct an Ada event object, which contains a copy of the C++ wxEvent data.
--  function Construct_Ada_Event(CXX_Object : in wxObject.wxCXX_Object) return Object is
  
--    Ada_Event : Object;
    
--  begin
  
--    Ada_Event.CXX_Object := CXX_Object;
    
--    return Ada_Event;
    
--  end Construct_Ada_Event;
  
--  pragma Export(C, Construct_Ada_Event, "ConstructAdaEvent");

  
--  function VoidPtr_To_Validator_Access is new Ada.Unchecked_Conversion(Source => VoidPtr, Target => Validator_Access);
  
--  function Ada_Transfer_From_Window(Validator : in wxObject_Access) return Interfaces.C.int is
  function Ada_Transfer_From_Window(Validator : in System.Address) return Interfaces.C.int is

--    Ada_Validator : Validator_Access := VoidPtr_To_Validator_Access(GetAdaValidator(Validator));
    Ada_Validator : Object_Pointer := To_Pointer(wx.Core.Validator.C.GetAdaValidator(Validator));
      
  begin
  
    if Transfer_From_Window(Ada_Validator.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Transfer_From_Window;
  
  
--  function Ada_Transfer_To_Window(Validator : in wxObject_Access) return Interfaces.C.int is
  function Ada_Transfer_To_Window(Validator : in System.Address) return Interfaces.C.int is
  
--    Ada_Validator : Validator_Access := VoidPtr_To_Validator_Access(GetAdaValidator(Validator));
    Ada_Validator : Object_Pointer := To_Pointer(wx.Core.Validator.C.GetAdaValidator(Validator));
      
  begin
  
    if Transfer_To_Window(Ada_Validator.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Transfer_To_Window;
  
  
--  function Ada_Validate(Validator, Window : in wxObject_Access) return Interfaces.C.int is
  function Ada_Validate(Validator, Window : in System.Address) return Interfaces.C.int is
  
--    Ada_Validator   : Validator_Access := VoidPtr_To_Validator_Access(GetAdaValidator(Validator));
    Ada_Validator   : Object_Pointer              := To_Pointer(wx.Core.Validator.C.GetAdaValidator(Validator));
    Ada_Window      : wx.Core.Window.Window_Class := wx.Core.Window.Window_Class(wx.Factory.Create_Ada_Type(Get_CPP_Class_Name(Window), Window, False));
    
  begin
  
    if Validate(Ada_Validator.all, Ada_Window.all) = True then
    
      return 1;
    
    end if;
    
    return 0;
    
  end Ada_Validate;
  

  -- Event_Factory.
  function Validator_Factory return Root_WX_Class is
  
  begin
  
    return new Validator_Type;
  
  end Validator_Factory;
  
begin

  wx.Factory.Add_Factory("wxValidator", Validator_Factory'Access);
  
end wx.Core.Validator;
