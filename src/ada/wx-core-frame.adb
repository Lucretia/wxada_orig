-- wx-core-frame.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;
--with System.Address_Image;
with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.Frame.C;

use type Interfaces.C.int;

package body wx.Core.Frame is

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
  package Address_To_Frame_Class is new System.Address_To_Access_Conversions(Frame_Type'Class);
--  package Address_To_Window_Access is new System.Address_To_Access_Conversions(wx.Core.Window.Window_Type);
--  use Address_To_Window_Access;
  
  procedure New_Frame(
    Self     : in out Frame_Type;
    Id       : in wx.Base.Id.Id_Type;
    Title    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size) is
  
--    Self_Access : Frame_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(Self,
      wx.Core.Frame.C.ctor(
        System.Null_Address,
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Title),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height)),
      True);
  
  end New_Frame;
  
  
  procedure New_Frame(
    Self     : in out Frame_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Title    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size) is
  
--    Self_Access : Frame_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(Self,
      wx.Core.Frame.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Title),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height)),
      True);
  
  end New_Frame;
  
  
  procedure Set_Status_Bar(Self : in Frame_Type; Status_Bar : in wx.Core.Status_Bar.Status_Bar_Type'Class) is
  
  begin
  
    wx.Core.Frame.C.SetStatusBar(Get_wxObject(Self), wx.Core.Status_Bar.Get_wxObject(Status_Bar));
    
  end Set_Status_Bar;

    
  procedure Dump(Self : in Frame_Type) is
  
--  package Address_To_Object is new System.Address_To_Access_Conversions(Frame_Type);
--  use Address_To_Object;
  
--  Self_Access : Frame_View := Self'Unchecked_Access;
  
  begin
--    wx.Debug.Put_Line(
--      "Self'Access : " & System.Address_Image(To_Address(Frame_Access(Self_Access))) &
--      "[wx.Core.Frame.Dump] Proxy: " & System.Address_Image(wxAdaFrame_GetAdaProxyObject(Get_wxObject(Self))));
    null;
  end Dump;
  
  
  -- Frame_Factory.
  function Frame_Factory return Root_WX_Class is
  
  begin
  
    return new Frame_Type;
  
  end Frame_Factory;
  

  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.
  
  
  -- Primitives for wxWindow.
  --function Destroy(Self : access Frame_Type'Class) return Boolean is
  
  --begin

--    if Get_wxObject(Self) /= System.Null_Address then
    
  --    if wx.Core.Frame.C.Destroy(Get_wxObject(Self.all)) = 1 then
      
  --      Text_IO.Put_Line("[wx.Core.Frame.Destroy]");
        
  --      Set_wxObject(Self.all, System.Null_Address, False);
        
  --      return True;

  --    end if;
    
--    end if;

  --  return False;
      
  --end Destroy;
  
  
  -- END

    
  -- START - These proxies are called from within C code only and serve as a means to call Ada code from within C code.
  
  
  --function Ada_Frame_Destroy(Self : in System.Address) return Interfaces.C.int is
  
  --  Ada_Frame : Frame_Class := Frame_Class(Address_To_Frame_Class.To_Pointer(Self));
    
  --begin
  
  --  if Destroy(Ada_Frame) = True then
    
  --    return 1;
    
  --  end if;
    
  --  return 0;
    
  --end Ada_Frame_Destroy;
  
  
  -- END
  
begin

  wx.Factory.Add_Factory("wxFrame", Frame_Factory'Access);
  
end wx.Core.Frame;
