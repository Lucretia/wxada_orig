with wx.Base.Event;

package Test_Event is

  My_Test_Event : constant wx.Base.Event.Event_Id_Type := wx.Base.Event.New_Event_Id;
  
  type Test_Event_Type is new wx.Base.Event.Event_Type with
    record
      Blah : Integer;
    end record;

  procedure New_Test_Event(Self : in out Test_Event_Type);
  
end Test_Event;
