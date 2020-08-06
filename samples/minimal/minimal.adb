with Ada.Unchecked_Deallocation;
with Text_IO;
--with wx.Base.Init;
with Minimal_App;

procedure Minimal is

--  The_Minimal_App : Minimal_App.Minimal_App_Access := new Minimal_App.Minimal_App_Type;
  The_Minimal_App : Minimal_App.Minimal_App_Type;
--  Return_Value    : Integer := wx.Base.Init.wxEntry;
  
--  procedure Free is new Ada.Unchecked_Deallocation(Minimal_App.Minimal_App_Type, Minimal_App.Minimal_App_Access);
  
begin

  Text_IO.Put_Line("[Minimal]");
  
  Minimal_App.New_App(The_Minimal_App);
  
--  if Return_Value /= -1 then
  
    Text_IO.Put_Line("About to clean up...");
    
--    Free(The_Minimal_App);
  
--    wx.Base.Init.Clean_Up;
  
--  end if;
  
end Minimal;
