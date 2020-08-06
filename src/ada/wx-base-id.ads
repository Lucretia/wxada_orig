 -- wx-base-id.ads
-- 
-- Copyright © 2005 Luke A. Guest
--
-- Distributed under the wxWidgets Licence
package wx.Base.Id is

  type Id_Type is range Integer'First .. Integer'Last;
  
  Id_Separator        : constant Id_Type := -2;  -- When creating an event handler or window.
  Id_Any              : constant Id_Type := -1;  -- Separate line in a menu.
  
  -- Standard menu Id's.
  Id_Lowest           : constant Id_Type := 4999;
  
  Id_Open             : constant Id_Type := Id_Lowest + 1;   --  wxID_OPEN
  Id_Close            : constant Id_Type := Id_Lowest + 2;   --  wxID_CLOSE
  Id_New              : constant Id_Type := Id_Lowest + 3;   --  wxID_NEW
  Id_Save             : constant Id_Type := Id_Lowest + 4;   --  wxID_SAVE
  Id_Save_As          : constant Id_Type := Id_Lowest + 5;   --  wxID_SAVEAS
  Id_Revert           : constant Id_Type := Id_Lowest + 6;   --  wxID_REVERT
  Id_Exit             : constant Id_Type := Id_Lowest + 7;   --  wxID_EXIT
  Id_Undo             : constant Id_Type := Id_Lowest + 8;   --  wxID_UNDO
  Id_Redo             : constant Id_Type := Id_Lowest + 9;   --  wxID_REDO
  Id_Help             : constant Id_Type := Id_Lowest + 10;  --  wxID_HELP
  Id_Print            : constant Id_Type := Id_Lowest + 11;  --  wxID_PRINT
  Id_Print_Set_Up     : constant Id_Type := Id_Lowest + 12;  --  wxID_PRINT_SETUP
  Id_Preview          : constant Id_Type := Id_Lowest + 13;  --  wxID_PREVIEW
  Id_About            : constant Id_Type := Id_Lowest + 14;  --  wxID_ABOUT
  Id_Help_Contents    : constant Id_Type := Id_Lowest + 15;  --  wxID_HELP_CONTENTS
  Id_Help_Commands    : constant Id_Type := Id_Lowest + 16;  --  wxID_HELP_COMMANDS
  Id_Help_Procedures  : constant Id_Type := Id_Lowest + 17;  --  wxID_HELP_PROCEDURES
  Id_Help_Context     : constant Id_Type := Id_Lowest + 18;  --  wxID_HELP_CONTEXT
  Id_Close_All        : constant Id_Type := Id_Lowest + 19;  --  wxID_CLOSE_ALL
  Id_Preferences      : constant Id_Type := Id_Lowest + 20;  --  wxID_PREFERENCES
  
  Id_Cut              : constant Id_Type := Id_Lowest + 31;  --  wxID_CUT = 5030
  Id_Copy             : constant Id_Type := Id_Lowest + 32;  --  wxID_COPY
  Id_Paste            : constant Id_Type := Id_Lowest + 33;  --  wxID_PASTE
  Id_Clear            : constant Id_Type := Id_Lowest + 34;  --  wxID_CLEAR
  Id_Find             : constant Id_Type := Id_Lowest + 35;  --  wxID_FIND
  Id_Duplicate        : constant Id_Type := Id_Lowest + 36;  --  wxID_DUPLICATE
  Id_Select_All       : constant Id_Type := Id_Lowest + 37;  --  wxID_SELECTALL
  Id_Delete           : constant Id_Type := Id_Lowest + 38;  --  wxID_DELETE
  Id_Replace          : constant Id_Type := Id_Lowest + 39;  --  wxID_REPLACE
  Id_Replace_All      : constant Id_Type := Id_Lowest + 40;  --  wxID_REPLACE_ALL
  Id_Properties       : constant Id_Type := Id_Lowest + 41;  --  wxID_PROPERTIES
  
  Id_View_Details     : constant Id_Type := Id_Lowest + 42;  --  wxID_VIEW_DETAILS
  Id_View_Large_Icons : constant Id_Type := Id_Lowest + 43;  --  wxID_VIEW_LARGEICONS
  Id_View_Small_Icons : constant Id_Type := Id_Lowest + 44;  --  wxID_VIEW_SMALLICONS
  Id_View_List        : constant Id_Type := Id_Lowest + 45;  --  wxID_VIEW_LIST
  Id_View_Sort_Date   : constant Id_Type := Id_Lowest + 46;  --  wxID_VIEW_SORTDATE
  Id_View_Sort_Name   : constant Id_Type := Id_Lowest + 47;  --  wxID_VIEW_SORTNAME
  Id_View_Sort_Size   : constant Id_Type := Id_Lowest + 48;  --  wxID_VIEW_SORTSIZE
  Id_View_Sort_Type   : constant Id_Type := Id_Lowest + 49;  --  wxID_VIEW_SORTTYPE

  Id_File_1           : constant Id_Type := Id_Lowest + 51;  --  wxID_FILE1 = 5050
  Id_File_2           : constant Id_Type := Id_Lowest + 52;  --  wxID_FILE2
  Id_File_3           : constant Id_Type := Id_Lowest + 53;  --  wxID_FILE3
  Id_File_4           : constant Id_Type := Id_Lowest + 54;  --  wxID_FILE4
  Id_File_5           : constant Id_Type := Id_Lowest + 55;  --  wxID_FILE5
  Id_File_6           : constant Id_Type := Id_Lowest + 56;  --  wxID_FILE6
  Id_File_7           : constant Id_Type := Id_Lowest + 57;  --  wxID_FILE7
  Id_File_8           : constant Id_Type := Id_Lowest + 58;  --  wxID_FILE8
  Id_File_9           : constant Id_Type := Id_Lowest + 59;  --  wxID_FILE9

  -- Standard button and menu Id's
  Id_Ok               : constant Id_Type := Id_Lowest + 101;  --  wxID_OK = 5100
  Id_Cancel           : constant Id_Type := Id_Lowest + 102;  --  wxID_CANCEL
  Id_Apply            : constant Id_Type := Id_Lowest + 103;  --  wxID_APPLY
  Id_Yes              : constant Id_Type := Id_Lowest + 104;  --  wxID_YES
  Id_No               : constant Id_Type := Id_Lowest + 105;  --  wxID_NO
  Id_Static           : constant Id_Type := Id_Lowest + 106;  --  wxID_STATIC
  Id_Forward          : constant Id_Type := Id_Lowest + 107;  --  wxID_FORWARD
  Id_Backward         : constant Id_Type := Id_Lowest + 108;  --  wxID_BACKWARD
  Id_Default          : constant Id_Type := Id_Lowest + 109;  --  wxID_DEFAULT
  Id_More             : constant Id_Type := Id_Lowest + 110;  --  wxID_MORE
  Id_Set_Up           : constant Id_Type := Id_Lowest + 111;  --  wxID_SETUP
  Id_Rest             : constant Id_Type := Id_Lowest + 112;  --  wxID_RESET
  Id_Context_Help     : constant Id_Type := Id_Lowest + 113;  --  wxID_CONTEXT_HELP
  Id_Yes_To_All       : constant Id_Type := Id_Lowest + 114;  --  wxID_YESTOALL
  Id_No_To_All        : constant Id_Type := Id_Lowest + 115;  --  wxID_NOTOALL
  Id_Abort            : constant Id_Type := Id_Lowest + 116;  --  wxID_ABORT
  Id_Retry            : constant Id_Type := Id_Lowest + 117;  --  wxID_RETRY
  Id_Ignore           : constant Id_Type := Id_Lowest + 118;  --  wxID_IGNORE
  Id_Add              : constant Id_Type := Id_Lowest + 119;  --  wxID_ADD
  Id_Remove           : constant Id_Type := Id_Lowest + 120;  --  wxID_REMOVE

  Id_Up               : constant Id_Type := Id_Lowest + 121;  --  wxID_UP
  Id_Down             : constant Id_Type := Id_Lowest + 122;  --  wxID_DOWN
  Id_Home             : constant Id_Type := Id_Lowest + 123;  --  wxID_HOME
  Id_Refresh          : constant Id_Type := Id_Lowest + 124;  --  wxID_REFRESH
  Id_Stop             : constant Id_Type := Id_Lowest + 125;  --  wxID_STOP
  Id_Index            : constant Id_Type := Id_Lowest + 126;  --  wxID_INDEX

  Id_Bold             : constant Id_Type := Id_Lowest + 127;  --  wxID_BOLD
  Id_Italic           : constant Id_Type := Id_Lowest + 128;  --  wxID_ITALIC
  Id_Justify_Center   : constant Id_Type := Id_Lowest + 129;  --  wxID_JUSTIFY_CENTER
  Id_Justify_Fill     : constant Id_Type := Id_Lowest + 130;  --  wxID_JUSTIFY_FILL
  Id_Justify_Right    : constant Id_Type := Id_Lowest + 131;  --  wxID_JUSTIFY_RIGHT
  Id_Justify_Left     : constant Id_Type := Id_Lowest + 132;  --  wxID_JUSTIFY_LEFT
  Id_Underline        : constant Id_Type := Id_Lowest + 133;  --  wxID_UNDERLINE
  Id_Indent           : constant Id_Type := Id_Lowest + 134;  --  wxID_INDENT
  Id_Unindent         : constant Id_Type := Id_Lowest + 135;  --  wxID_UNINDENT
  Id_Zoom_100         : constant Id_Type := Id_Lowest + 136;  --  wxID_ZOOM_100
  Id_Zoom_Fit         : constant Id_Type := Id_Lowest + 137;  --  wxID_ZOOM_FIT
  Id_Zoom_In          : constant Id_Type := Id_Lowest + 138;  --  wxID_ZOOM_IN
  Id_Zoom_Out         : constant Id_Type := Id_Lowest + 139;  --  wxID_ZOOM_OUT
  Id_Undelete         : constant Id_Type := Id_Lowest + 140;  --  wxID_UNDELETE
  Id_Revert_To_Saved  : constant Id_Type := Id_Lowest + 141;  --  wxID_REVERT_TO_SAVED

  -- System menu Id's (used by wxUniv)
  Id_System_Menu      : constant Id_Type := Id_Lowest + 201;  --  wxID_SYSTEM_MENU = 5200
  Id_Close_Frame      : constant Id_Type := Id_Lowest + 202;  --  wxID_CLOSE_FRAME
  Id_Move_Frame       : constant Id_Type := Id_Lowest + 203;  --  wxID_MOVE_FRAME
  Id_Resize_Frame     : constant Id_Type := Id_Lowest + 204;  --  wxID_RESIZE_FRAME
  Id_Maximize_Frame   : constant Id_Type := Id_Lowest + 205;  --  wxID_MAXIMIZE_FRAME
  Id_Iconize_Frame    : constant Id_Type := Id_Lowest + 206;  --  wxID_ICONIZE_FRAME
  Id_Restore_Frame    : constant Id_Type := Id_Lowest + 207;  --  wxID_RESTORE_FRAME

  -- Id's used by generic file dialog (13 consecutive starting from this value)
  Id_File_DLGG        : constant Id_Type := Id_Lowest + 901;  --  wxID_FILEDLGG = 5900
  
  Id_Highest          : constant Id_Type := 5999;
  
  type Id_User_Range_Lower is new Id_Type range 0 .. Id_Lowest;
  type Id_User_Range_Upper is new Id_Type range Id_Highest .. Id_Type'Last;
  
end wx.Base.Id;
