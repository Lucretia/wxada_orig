-- wx_lib.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
--
-- This is the main package for the entire Ada library (not including the C code!).

-- Utility packages.
with wx.Array_Conversion;
with wx.Debug;
with wx.Dynamic_Array;
with wx.Single_Linked_List;
--with wx.Factory;
--with wx.Instance_Store;

-- Everything in wx.Base.
--with wx.Base.Mutex;
--with wx.Base.Mutex.Locker;
--with wx.Base.Semaphore;
--with wx.Base.Semaphore.Locker;
with wx.Base.Handle;
with wx.Base.Indefinite_Handle;
with wx.Base.Object;
with wx.Base.Event_Handler;
with wx.Base.Event;
with wx.Base.Command_Event;
with wx.Base.Idle_Event;
with wx.Base.Init;
with wx.Base.App_Console;

-- Everything in wx.Core.
with wx.Core.App;
with wx.Core.Keyboard;
with wx.Core.Mouse;
with wx.Core.Joystick;

-- Event packages.
with wx.Core.Notify_Event;
with wx.Core.Size_Event;
with wx.Core.Scroll_Event;
with wx.Core.Spin_Event;
with wx.Core.Paint_Event;
with wx.Core.Activate_Event;
with wx.Core.Calculate_Layout_Event;
with wx.Core.Close_Event;
with wx.Core.Context_Menu_Event;
with wx.Core.Erase_Event;
with wx.Core.Dial_Up_Event;
with wx.Core.Find_Dialog_Event;
with wx.Core.Focus_Event;
with wx.Core.Help_Event;
with wx.Core.Iconize_Event;
with wx.Core.Init_Dialog_Event;
with wx.Core.Maximize_Event;
with wx.Core.Menu_Event;
with wx.Core.Key_Event;
with wx.Core.Navigation_Key_Event;
--with wx.Core.Joystick_Event;

-- GDI packages.
with wx.Core.Point;
with wx.Core.Size;
with wx.Core.Rect;
with wx.Core.GDI;
with wx.Core.Colour;
with wx.Core.Colour.Stock;
with wx.Core.Pen;
with wx.Core.Pen.Stock;
with wx.Core.Brush;
with wx.Core.Brush.Stock;
with wx.Core.Bitmap;
with wx.Core.DC;
with wx.Core.Client_DC;
with wx.Core.Window_DC;
with wx.Core.Paint_DC;

-- Window packages.
with wx.Core.Window;
with wx.Core.TopLevelWindow;
with wx.Core.Frame;
with wx.Core.Panel;
with wx.Core.Status_Bar;

-- Control packages.
with wx.Core.Control;
with wx.Core.Button;
with wx.Core.Check_Box;
with wx.Core.Slider;
with wx.Core.Scroll_Bar;
with wx.Core.Spin;

-- Sizer packages.
with wx.Core.Root_Sizer;
with wx.Core.Sizer;
with wx.Core.Box_Sizer;
with wx.Core.Static_Box_Sizer;

-- Misc packages.
with wx.Core.Static_Box;
with wx.Core.Image;
with wx.Core.Root_Validator;
with wx.Core.Validator;

-- Menu packages.
with wx.Core.Menu;
				
package wx_lib is

end wx_lib;
