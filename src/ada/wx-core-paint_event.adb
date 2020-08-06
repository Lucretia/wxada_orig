-- wx-core-paint_event.adb
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
with Interfaces.C;
with System;
with wx.Factory;
with wx.Core.Paint_Event.C;

use type Interfaces.C.int;

package body wx.Core.Paint_Event is

  procedure New_Paint_Event(Self : in out Paint_Event_Type; Id : in wx.Base.Id.Id_Type) is
  
  begin
  
    Set_wxObject(Self, wx.Core.Paint_Event.C.ctor(Interfaces.C.int(Id)), True);
    
  end New_Paint_Event;
  
  
  -- Paint_Event_Factory.
  function Paint_Event_Factory return Root_WX_Class is
  
  begin
  
    return new Paint_Event_Type;
  
  end Paint_Event_Factory;
  
begin

  wx.Factory.Add_Factory("wxPaintEvent", Paint_Event_Factory'Access);
  
end wx.Core.Paint_Event;
