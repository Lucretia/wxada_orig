// wxcore_frame_virtuals.h
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence

#ifndef _WXCORE_FRAME_VIRTUALS_H_
#define _WXCORE_FRAME_VIRTUALS_H_


#define WXADA_DECLARE_FRAME_DESTROY(baseclass)	\
	virtual bool Destroy(); \
	\
	inline bool Base_Destroy() \
		{ \
		return baseclass::Destroy(); \
		}


#define WXADA_DECLARE_FRAME_VIRTUALS(baseclass)	\
	WXADA_DECLARE_FRAME_DESTROY(baseclass)


#define WXADA_IMPLEMENT_FRAME_DESTROY(classname, baseclass, funcname)	\
	extern "C" \
		{ \
		extern int funcname(void *Self); \
		} \
	\
	bool classname::Destroy() \
		{ \
		printf("[" #classname "::Destroy]\n"); \
		\
		return funcname(wxInstanceStore_FindClass(this)/*_AdaObject*/) == 1 ? true : false; \
		} \
	\
	extern "C" \
		{ \
		bool baseclass##_Destroy(classname *Self) \
			{ \
			printf("[" #baseclass "_Destroy]\n"); \
			\
			return Self->Base_Destroy(); \
			} \
		};

#define WXADA_IMPLEMENT_FRAME_VIRTUALS(classname, baseclass, adaprefix)	\
	WXADA_IMPLEMENT_FRAME_DESTROY(classname, baseclass, Ada_##adaprefix##_Destroy)
	

#endif // !_WXCORE_WINDOW_VIRTUALS_H_
