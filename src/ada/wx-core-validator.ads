-- wx-core-validator.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with wx.Base.Event_Handler;
with wx.Core.Window;
with wx.Core.Root_Validator;

package wx.Core.Validator is

  -- This is the actual type (wxValidator) we are creating here.
  --type Validator_Type is new wx.Base.Event_Handler.Event_Handler_Type with private;
  type Validator_Type is new wx.Core.Root_Validator.Root_Validator_Type with private;
--  type Validator_Access is access all Validator_Type;
--  type Validator_View is access constant Validator_Type;
  type Validator_Class is access all Validator_Type'Class;

  procedure New_Validator(Self : in out Validator_Type);

  function Get_Window(Self : in Validator_Type) return wx.Core.Window.Window_Class;
  procedure Set_Bell_On_Error(Self : in Validator_Type; Enable_Bell : in Boolean);
  procedure Set_Window(Self : in Validator_Type; Window : in wx.Core.Window.Window_Type'Class);
  
  function Transfer_From_Window(Self : in Validator_Type) return Boolean;
  function Transfer_To_Window(Self : in Validator_Type) return Boolean;
  function Validate(Self : in Validator_Type; Window : in wx.Core.Window.Window_Type'Class) return Boolean;
  
   -- Set_Validator should really be in wx.Core.Window, but we get circular dependencies!
--  procedure Set_Validator(Self : in Window_Type; Validator : in Validator_Type);
  
private

  --type Validator_Type is new wx.Base.Event_Handler.Event_Handler_Type with null record;
  type Validator_Type is new wx.Core.Root_Validator.Root_Validator_Type with null record;
  
--  procedure Finalize(Self : in out Event_Type);
  procedure Initialize(Self : in out Validator_Type);
  procedure Finalize(Self : in out Validator_Type);
  
--  function Ada_Transfer_From_Window(Validator : in wxObject_Access) return Interfaces.C.int;
  function Ada_Transfer_From_Window(Validator : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Transfer_From_Window, "Ada_Transfer_From_Window");
  
--  function Ada_Transfer_To_Window(Validator : in wxObject_Access) return Interfaces.C.int;
  function Ada_Transfer_To_Window(Validator : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Transfer_To_Window, "Ada_Transfer_To_Window");
  
--  function Ada_Validate(Validator, Window : in wxObject_Access) return Interfaces.C.int;
  function Ada_Validate(Validator, Window : in System.Address) return Interfaces.C.int;
  pragma Export(C, Ada_Validate, "Ada_Validate");
  
end wx.Core.Validator;
