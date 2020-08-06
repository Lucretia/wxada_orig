-- wx-core-panel.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with wx.Base.Id;
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Window;

package wx.Core.Panel is

  -- This is the actual type (wxPanel) we are creating here.
  type Panel_Type is new wx.Core.Window.Window_Type with private;
--  type Panel_Access is access all Panel_Type;
--  type Panel_View is access constant Panel_Type;
  type Panel_Class is access all Panel_Type'Class;

  -- Window styles.
  subtype Panel_Styles_Type is wx.Core.Window.Window_Styles_Type;
    
  procedure New_Panel(
    Self     : in out Panel_Type;
    Parent   : in wx.Core.Window.Window_Type'Class;
    Id       : in wx.Base.Id.Id_Type;
    Position : in wx.Core.Point.Point_Type := wx.Core.Point.Default_Position;
    Size     : in wx.Core.Size.Size_Type   := wx.Core.Size.Default_Size;
    Style    : in Panel_Styles_Type        := wx.Core.Window.Tab_Traversal);
  
-- No longer existing
--  function Get_Default_Item(Self : in Panel_Type) return wx.Core.Window.Window_Class;
  procedure Init_Dialog(Self : in Panel_Type);
--  void OnSysColourChanged(wxSysColourChangedEvent& event)
-- No longer existing
--  procedure Set_Default_Item(Self : in Panel_Type; Window : in wx.Core.Window.Window_Type'Class);
  procedure Set_Focus(Self : in Panel_Type);
  procedure Set_Focus_Ignoring_Children(Self : in Panel_Type);
  
private

  type Panel_Type is new wx.Core.Window.Window_Type with null record;
  
end wx.Core.Panel;
