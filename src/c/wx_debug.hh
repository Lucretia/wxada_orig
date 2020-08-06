// wx_debug.hh
// 
// Copyright © 2005 Luke A. Guest
//
// Distributed under the wxWidgets Licence

#ifndef _WX_DEBUG_HH_
#define _WX_DEBUG_HH_


#ifdef __WXDEBUG__

inline void wxAdaDebug(const wxString &DebugText)
	{
	printf(DebugText.c_str());
	}
	
#define WXADA_MSG(x)	wxAdaDebug(x)

#else

#define WXADA_MSG(x)

#endif // __WXDEBUG__


#endif // !_WX_DEBUG_HH_
