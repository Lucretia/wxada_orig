-- wx-core-control.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Window;

package wx.Core.Control is

  -- This is the actual type (wxControl) we are creating here.
  type Control_Type is new wx.Core.Window.Window_Type with private;
--  type Control_Access is access all Control_Type;
--  type Control_View is access constant Control_Type;
  type Control_Class is access all Control_Type'Class;
  
  procedure New_Control(
    Self   : in out Control_Type;
    Parent : in wx.Core.Window.Window_Type'Class;
    Id     : in wx.Base.Id.Id_Type);
  
  --procedure Command(Self : in Control_Type; Event : in Command_Event_Type);
  function Get_Label(Self : in Control_Type) return String;
  procedure Set_Label(Self : in Control_Type; Label : in String);

private

  type Control_Type is new wx.Core.Window.Window_Type with null record;
  
end wx.Core.Control;
