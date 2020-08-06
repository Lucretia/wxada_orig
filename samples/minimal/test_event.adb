with wx.Base.Id;
with Text_IO;

package body Test_Event is

  procedure New_Test_Event(Self : in out Test_Event_Type) is
  
  begin
  
    Text_IO.Put_Line("My_Test_Event: " & wx.Base.Event.Event_Id_Type'Image(My_Test_Event));
    
    New_Event(Self, wx.Base.Id.Id_Any, My_Test_Event);
    
    Self.Blah := 5;
    
  end New_Test_Event;
  
end Test_Event;
