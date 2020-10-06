//
// State_WaitForMaxTime.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_WaitForMaxTime.h"

#include "State_WaitForMaxTime_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

WaitForMaxTime::WaitForMaxTime(const char *name): CLState(name, *new WaitForMaxTime::OnEntry, *new WaitForMaxTime::OnExit, *new WaitForMaxTime::Internal, NULLPTR, new WaitForMaxTime::OnSuspend, new WaitForMaxTime::OnResume)
{
	_transitions[0] = new Transition_0();
}

WaitForMaxTime::~WaitForMaxTime()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void WaitForMaxTime::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForMaxTime_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForMaxTime_FuncRefs.mm"
#	include "State_WaitForMaxTime_OnEntry.mm"
}
 
void WaitForMaxTime::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForMaxTime_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForMaxTime_FuncRefs.mm"
#	include "State_WaitForMaxTime_OnExit.mm"
}

void WaitForMaxTime::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForMaxTime_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForMaxTime_FuncRefs.mm"
#	include "State_WaitForMaxTime_Internal.mm"
}

void WaitForMaxTime::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForMaxTime_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForMaxTime_FuncRefs.mm"
#	include "State_WaitForMaxTime_OnSuspend.mm"
}

void WaitForMaxTime::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForMaxTime_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForMaxTime_FuncRefs.mm"
#	include "State_WaitForMaxTime_OnResume.mm"
}
bool WaitForMaxTime::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForMaxTime_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForMaxTime_FuncRefs.mm"

	return
	(
#		include "State_WaitForMaxTime_Transition_0.expr"
	);
}
