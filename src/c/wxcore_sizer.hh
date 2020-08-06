// wxbase_sizer.h
// 
// Copyright © 2005 Luke A. Guest
//
// wxEvent is abstract and as such cannot be instantiated as is. This file implements base classes which can be derived from within Ada.
//
// Distributed under the wxWidgets Licence

#ifndef _WXBASE_SIZER_H_
#define _WXBASE_SIZER_H_


class wxAdaSizer : public wxSizer
	{
	DECLARE_ABSTRACT_CLASS(wxAdaSizer)

	public:
		wxAdaSizer()
			: wxSizer()
			{
			}

		virtual void RecalcSizes()
			{
			}
		
		virtual wxSize CalcMin()
			{
			return wxSize();
			}
	};


#endif // !_WXBASE_SIZER_H_
