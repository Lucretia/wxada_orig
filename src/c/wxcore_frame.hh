// wxcore_frame.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence

#ifndef _WXCORE_FRAME_H_
#define _WXCORE_FRAME_H_


/*
extern "C"
	{
	extern void *wxInstanceStore_FindClass(const wxFrame *Instance);
	};
*/

	
class wxAdaFrame : public wxFrame
	{
	DECLARE_DYNAMIC_CLASS(wxAdaFrame)

	public:
		wxAdaFrame()
			: wxFrame()/*,
			  _AdaObject(NULL)*/
			{
			}
			
		wxAdaFrame(wxWindow *Parent, int Id, const wxChar *Title, const wxPoint &Position, const wxSize &Size)
			: wxFrame(Parent, Id, Title, Position, Size)/*,
			  _AdaObject(NULL)*/
			{
			}

		virtual ~wxAdaFrame()
			{
			printf("[wxAdaFrame::~wxAdaFrame]\n");
			}

		//WXADA_DECLARE_FRAME_VIRTUALS(wxAdaFrame)
		
		// This points to an Ada class-wide type.
		//void *_AdaObject;
	};


#endif // !_WXCORE_FRAME_H_
