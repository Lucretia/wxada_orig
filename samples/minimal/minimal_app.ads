with wx.Core.App;
with Minimal_Frame;

package Minimal_App is

  type Minimal_App_Type is new wx.Core.App.App_Type with
    record
      Frame : Minimal_Frame.Minimal_Frame_Type;
    end record;
  type Minimal_App_Access is access all Minimal_App_Type;
  
  procedure On_Init(Self : in out Minimal_App_Type);
  procedure On_Exit(Self : in out Minimal_App_Type);

end Minimal_App;
