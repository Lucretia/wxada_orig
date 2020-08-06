-- wx-core-window-c.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C.Strings;
with System;

private package wx.Core.Window.C is

  function ctor(Parent : in System.Address; Id, X, Y, Width, Height : in Interfaces.C.int) return System.Address;
  pragma Import(C, ctor, "wxWindow_ctor");

  procedure dtor(Self : in System.Address);
  pragma Import(C, dtor, "wxWindow_dtor");

  --function GetAdaObject(Self : System.Address) return System.Address;
  --pragma Import(C, GetAdaObject, "wxWindow_GetAdaObject");

  procedure CacheBestSize(Self : in System.Address; Width, Height : in Interfaces.C.int);
  pragma Import(C, CacheBestSize, "wxWindow_CacheBestSize");

  procedure Centre(Self : in System.Address; Direction : in Interfaces.C.int);
  pragma Import(C, Centre, "wxWindow_Centre");

  procedure CentreOnParent(Self : in System.Address; Direction : in Interfaces.C.int);
  pragma Import(C, CentreOnParent, "wxWindow_CentreOnParent");

  procedure CentreOnScreen(Self : in System.Address; Direction : in Interfaces.C.int);
  pragma Import(C, CentreOnScreen, "wxWindow_CentreOnScreen");

  procedure ClearBackground(Self : in System.Address);
  pragma Import(C, ClearBackground, "wxWindow_ClearBackground");

  procedure ClientToScreen(Self, X, Y : in System.Address);
  pragma Import(C, ClientToScreen, "wxWindow_ClientToScreen");

  function Close(Self : in System.Address; Force : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, Close, "wxWindow_Close");

  procedure ConvertDialogToPixels_For_Point(Self : in System.Address; InX, InY : in Interfaces.C.int; OutX, OutY : System.Address);
  pragma Import(C, ConvertDialogToPixels_For_Point, "wxWindow_ConvertDialogToPixels_For_Point");

  procedure ConvertDialogToPixels_For_Size(Self : in System.Address; InWidth, InHeight : in Interfaces.C.int; OutWidth, OutHeight : System.Address);
  pragma Import(C, ConvertDialogToPixels_For_Size, "wxWindow_ConvertDialogToPixels_For_Size");

  procedure ConvertPixelsToDialog_For_Point(Self : in System.Address; InX, InY : in Interfaces.C.int; OutX, OutY : System.Address);
  pragma Import(C, ConvertPixelsToDialog_For_Point, "wxWindow_ConvertPixelsToDialog_For_Point");

  procedure ConvertPixelsToDialog_For_Size(Self : in System.Address; InWidth, InHeight : in Interfaces.C.int; OutWidth, OutHeight : System.Address);
  pragma Import(C, ConvertPixelsToDialog_For_Size, "wxWindow_ConvertPixelsToDialog_For_Size");

  procedure DestroyChildren(Self : in System.Address);
  pragma Import(C, DestroyChildren, "wxWindow_DestroyChildren");

  function FindWindow(Self : in System.Address; Id : in Interfaces.C.long) return System.Address;
  pragma Import(C, FindWindow, "wxWindow_FindWindow");

  function FindWindow_By_Name(Self : in System.Address; Name : in Interfaces.C.Strings.chars_ptr) return System.Address;
  pragma Import(C, FindWindow_By_Name, "wxWindow_FindWindow_By_Name");

  procedure GetAdjustedBestSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetAdjustedBestSize, "wxWindow_GetAdjustedBestSize");

  procedure GetBackgroundColour(Self, Red, Green, Blue : in System.Address);
  pragma Import(C, GetBackgroundColour, "wxWindow_GetBackgroundColour");

  procedure GetBestFittingSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetBestFittingSize, "wxWindow_GetBestFittingSize");

  procedure GetBestSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetBestSize, "wxWindow_GetBestSize");

  procedure GetClientSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetClientSize, "wxWindow_GetClientSize");

  procedure GetForegroundColour(Self, Red, Green, Blue : in System.Address);
  pragma Import(C, GetForegroundColour, "wxWindow_GetForegroundColour");

  function GetGrandParent(Self : in System.Address) return System.Address;
  pragma Import(C, GetGrandParent, "wxWindow_GetGrandParent");

  function GetId(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetId, "wxWindow_GetId");

  function GetParent(Self : in System.Address) return System.Address;
  pragma Import(C, GetParent, "wxWindow_GetParent");

  procedure GetPosition(Self, X, Y : in System.Address);
  pragma Import(C, GetPosition, "wxWindow_GetPosition");

  procedure GetSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetSize, "wxWindow_GetSize");

  procedure GetVirtualSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetVirtualSize, "wxWindow_GetVirtualSize");

  function GetWindowVariant(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetWindowVariant, "wxWindow_GetWindowVariant");

  function HasScrollbar(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, HasScrollbar, "wxWindow_HasScrollbar");

  procedure InvalidateBestSize(Self : in System.Address);
  pragma Import(C, InvalidateBestSize, "wxWindow_InvalidateBestSize");

  function IsExposed_For_Point(Self : in System.Address; X, Y : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, IsExposed_For_Point, "wxWindow_IsExposed_For_Point");

  function IsExposed_For_Rect(Self : in System.Address; X, Y, Width, Height : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, IsExposed_For_Rect, "wxWindow_IsExposed_For_Rect");

  function Show(Self : in System.Address; Show : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, Show, "wxWindow_Show");

  procedure SetSizer(Self, Sizer : in System.Address; Delete_Old_Sizer : in Interfaces.C.int);
  pragma Import(C, SetSizer, "wxWindow_SetSizer");

  procedure SetValidator(Self, Validator : in System.Address);
  pragma Import(C, SetValidator, "wxWindow_SetValidator");

  -- START - These primitive operations are the Ada equivalents of the C++ virtuals.

  function ProcessEvent(Self, Event : in System.Address) return Interfaces.C.int;
  pragma Import(C, ProcessEvent, "wxWindow_ProcessEvent");

  procedure CaptureMouse(Self : in System.Address);
  pragma Import(C, CaptureMouse, "wxWindow_CaptureMouse");

  function Destroy(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Destroy, "wxWindow_Destroy");

  procedure DoClientToScreen(Self, X, Y : in System.Address);
  pragma Import(C, DoClientToScreen, "wxWindow_DoClientToScreen");

  procedure DoGetBestSize(Self, Width, Height : in System.Address);
  pragma Import(C, DoGetBestSize, "wxWindow_DoGetBestSize");

  procedure DoGetClientSize(Self, Width, Height : in System.Address);
  pragma Import(C, DoGetClientSize, "wxWindow_DoGetClientSize");

  procedure DoGetPosition(Self, X, Y : in System.Address);
  pragma Import(C, DoGetPosition, "wxWindow_DoGetPosition");

  procedure DoGetSize(Self, Width, Height : in System.Address);
  pragma Import(C, DoGetSize, "wxWindow_DoGetSize");

  procedure DoGetVirtualSize(Self, Width, Height : in System.Address);
  pragma Import(C, DoGetVirtualSize, "wxWindow_DoGetVirtualSize");

  procedure DoMoveWindow(Self : System.Address; X, Y, Width, Height : in Interfaces.C.int);
  pragma Import(C, DoMoveWindow, "wxWindow_DoMoveWindow");

  procedure DoSetClientSize(Self : System.Address; Width, Height : in Interfaces.C.int);
  pragma Import(C, DoSetClientSize, "wxWindow_DoSetClientSize");

  procedure DoSetSize(Self : System.Address; X, Y, Width, Height, Fize_Flags : in Interfaces.C.int);
  pragma Import(C, DoSetSize, "wxWindow_DoSetSize");

  procedure DoUpdateWindowUI(Self, Event : in System.Address);
  pragma Import(C, DoUpdateWindowUI, "wxWindow_DoUpdateWindowUI");

  procedure Enable(Self : in System.Address; Enable : Interfaces.C.int);
  pragma Import(C, Enable, "wxWindow_Enable");

  procedure Fit(Self : in System.Address);
  pragma Import(C, Fit, "wxWindow_Fit");

  procedure FitInside(Self : in System.Address);
  pragma Import(C, FitInside, "wxWindow_FitInside");

  procedure Freeze(Self : in System.Address);
  pragma Import(C, Freeze, "wxWindow_Freeze");

  function GetCharHeight(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetCharHeight, "wxWindow_GetCharHeight");

  function GetCharWidth(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, GetCharWidth, "wxWindow_GetCharWidth");

  function GetLabel(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetLabel, "wxWindow_GetLabel");

  procedure GetMaxSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetMaxSize, "wxWindow_GetMaxSize");

  procedure GetMinSize(Self, Width, Height : in System.Address);
  pragma Import(C, GetMinSize, "wxWindow_GetMinSize");

  function GetName(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetName, "wxWindow_GetName");

  function GetScrollPos(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, GetScrollPos, "wxWindow_GetScrollPos");

  function GetScrollThumb(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, GetScrollThumb, "wxWindow_GetScrollThumb");

  function GetScrollRange(Self : in System.Address; Orientation : in Interfaces.C.int) return Interfaces.C.int;
  pragma Import(C, GetScrollRange, "wxWindow_GetScrollRange");

  function GetTitle(Self : in System.Address) return Interfaces.C.Strings.chars_ptr;
  pragma Import(C, GetTitle, "wxWindow_GetTitle");

  function GetWindowStyleFlag(Self : in System.Address) return Interfaces.C.long;
  pragma Import(C, GetWindowStyleFlag, "wxWindow_GetWindowStyleFlag");

  function HasCapture(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, HasCapture, "wxWindow_HasCapture");

  function HasTransparentBackground(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, HasTransparentBackground, "wxWindow_HasTransparentBackground");

  procedure InheritAttributes(Self : in System.Address);
  pragma Import(C, InheritAttributes, "wxWindow_InheritAttributes");

  procedure InitDialog(Self : in System.Address);
  pragma Import(C, InitDialog, "wxWindow_InitDialog");

  function IsEnabled(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsEnabled, "wxWindow_IsEnabled");

  function IsRetained(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsRetained, "wxWindow_IsRetained");

  function IsShown(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsShown, "wxWindow_IsShown");

  function IsTopLevel(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, IsTopLevel, "wxWindow_IsTopLevel");

  function Layout(Self : in System.Address) return Interfaces.C.int;
  pragma Import(C, Layout, "wxWindow_Layout");

  procedure Lower(Self : in System.Address);
  pragma Import(C, Lower, "wxWindow_Lower");

  procedure MakeModal(Self : in System.Address; Flag : in Interfaces.C.int);
  pragma Import(C, MakeModal, "wxWindow_MakeModal");

end wx.Core.Window.C;
