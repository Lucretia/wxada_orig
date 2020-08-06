// wxbase_validator.h
// 
// Copyright © 2005 Luke A. Guest
//
// wxEvent is abstract and as such cannot be instantiated as is. This file implements base classes which can be derived from within Ada.
//
// Distributed under the wxWidgets Licence

#ifndef _WXBASE_VALIDATOR_H_
#define _WXBASE_VALIDATOR_H_


class wxAdaValidator;

extern "C"
	{
	int Ada_Transfer_From_Window(wxAdaValidator *Validator);
	int Ada_Transfer_To_Window(wxAdaValidator *Validator);
	int Ada_Validate(wxAdaValidator *Validator, wxWindow *Window);
	};
	

class wxAdaValidator : public wxValidator
	{
	DECLARE_DYNAMIC_CLASS(wxAdaValidator)
//	DECLARE_ABSTRACT_CLASS(wxAdaValidator)

	public:
		wxAdaValidator()
			: wxValidator(),
			  _AdaValidator(NULL)
			{
			}

		/*
		wxAdaValidator(const wxAdaValidator &Validator)
			: wxValidator(Validator),
			  _AdaValidator(Validator._AdaValidator)
			{
			wxASSERT_MSG(_AdaValidator != NULL, "Internal Ada Validator pointer is NULL\n");
			}
			*/

		//wxAdaValidator *Clone() const
		wxObject *Clone() const
			{
			//printf("[wxAdaValidator::Clone]\n");
			//return new wxAdaValidator(*this);
			/*
			wxAdaValidator *p = new wxAdaValidator(*this);
			printf("[wxAdaValidator::Clone]\n\tp: %s\n", p->GetClassInfo()->GetClassName());
			return p;
			*/
			wxAdaValidator *p = new wxAdaValidator();
			
			p->_AdaValidator = _AdaValidator;
			
			wxASSERT_MSG(p->_AdaValidator != NULL, "Internal Ada Validator pointer is NULL\n");
			
			printf("[wxAdaValidator::Clone]\n\tp: %s\n", p->GetClassInfo()->GetClassName());
			return p;
			}
	
		virtual bool TransferFromWindow()
			{
			printf("[wxAdaValidator::TransferFromWindow]\n");
			return Ada_Transfer_From_Window(wx_static_cast(wxAdaValidator *, _AdaValidator)) == 1 ? true : false;
			}
			
		virtual bool TransferToWindow()
			{
			printf("[wxAdaValidator::TransferToWindow]\n");
			return Ada_Transfer_To_Window(wx_static_cast(wxAdaValidator *, _AdaValidator)) == 1 ? true : false;
			}
	
		virtual bool Validate(wxWindow *Parent)
			{
			printf("[wxAdaValidator::Validate]\n");
			return Ada_Validate(wx_static_cast(wxAdaValidator *, _AdaValidator), Parent) == 1 ? true : false;
			}
	
		void *_AdaValidator;
	};


#endif // !_WXBASE_VALIDATOR_H_
