//
// State_Skip_Garbage.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_Skip_Garbage.h"

#include "State_Skip_Garbage_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

Skip_Garbage::Skip_Garbage(const char *name): CLState(name, *new Skip_Garbage::OnEntry, *new Skip_Garbage::OnExit, *new Skip_Garbage::Internal, NULLPTR, new Skip_Garbage::OnSuspend, new Skip_Garbage::OnResume)
{
	_transitions[0] = new Transition_0();
}

Skip_Garbage::~Skip_Garbage()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Skip_Garbage::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Skip_Garbage_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Skip_Garbage_FuncRefs.mm"
#	include "State_Skip_Garbage_OnEntry.mm"
}
 
void Skip_Garbage::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Skip_Garbage_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Skip_Garbage_FuncRefs.mm"
#	include "State_Skip_Garbage_OnExit.mm"
}

void Skip_Garbage::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Skip_Garbage_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Skip_Garbage_FuncRefs.mm"
#	include "State_Skip_Garbage_Internal.mm"
}

void Skip_Garbage::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Skip_Garbage_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Skip_Garbage_FuncRefs.mm"
#	include "State_Skip_Garbage_OnSuspend.mm"
}

void Skip_Garbage::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Skip_Garbage_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Skip_Garbage_FuncRefs.mm"
#	include "State_Skip_Garbage_OnResume.mm"
}
bool Skip_Garbage::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Skip_Garbage_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Skip_Garbage_FuncRefs.mm"

	return
	(
#		include "State_Skip_Garbage_Transition_0.expr"
	);
}
