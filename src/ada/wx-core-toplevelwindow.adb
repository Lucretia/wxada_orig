-- wx-core-toplevelwindow.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;
--with System.Address_To_Access_Conversions;
with wx.Factory;
with wx.Core.TopLevelWindow.C;

package body wx.Core.TopLevelWindow is

  -- Use System.Address_To_Access_Conversions to convert between the access type the address.
--  package Address_To_Object is new System.Address_To_Access_Conversions(wx.Core.Window.Window_Type);
--  use Address_To_Object;
  
  -- These two are always required by every Ada proxy type. These enable the  wxAda tagged types to associate themselves with
  -- the C++ object (wxObject) and vice-versa.
--  procedure wxAdaTopLevelWindow_SetAdaProxyObject(Self : in wxObject_Access; Proxy : in System.Address);
--  function wxAdaTopLevelWindow_GetAdaProxyObject(Self : in wxObject_Access) return System.Address;

  -- Import the C functions necessary for the wxObject class.
--  pragma Import(C, wxAdaTopLevelWindow_SetAdaProxyObject, "wxAdaTopLevelWindow_SetAdaProxyObject");
--  pragma Import(C, wxAdaTopLevelWindow_GetAdaProxyObject, "wxAdaTopLevelWindow_GetAdaProxyObject");
  
  procedure New_Top_Level_Window(
    Self     : in out Top_Level_Window_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Title    : in String;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size) is
  
--    Self_Access : Top_Level_Window_Access := Self'Unchecked_Access;
    
  begin
  
    Set_wxObject(Self,
      wx.Core.TopLevelWindow.C.ctor(
        wx.Core.Window.Get_wxObject(Parent),
        Interfaces.C.int(Id),
        Interfaces.C.Strings.New_String(Title),
        Interfaces.C.int(Position.X),
        Interfaces.C.int(Position.Y),
        Interfaces.C.int(Size.Width),
        Interfaces.C.int(Size.Height)),
      True);
    
--    wxAdaTopLevelWindow_SetAdaProxyObject(Get_wxObject(Self), To_Address(Object_Pointer(Self_Access)));
    
  end New_Top_Level_Window;
  

  -- Top_Level_Window_Factory.
  function Top_Level_Window_Factory return Root_WX_Class is
  
  begin
  
    return new Top_Level_Window_Type;
  
  end Top_Level_Window_Factory;
  
begin

  wx.Factory.Add_Factory("wxTopLevelWindow", Top_Level_Window_Factory'Access);

end wx.Core.TopLevelWindow;
