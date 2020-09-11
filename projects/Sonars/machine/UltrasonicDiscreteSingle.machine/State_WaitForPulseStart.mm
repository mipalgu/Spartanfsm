//
// State_WaitForPulseStart.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_WaitForPulseStart.h"

#include "State_WaitForPulseStart_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

WaitForPulseStart::WaitForPulseStart(const char *name): CLState(name, *new WaitForPulseStart::OnEntry, *new WaitForPulseStart::OnExit, *new WaitForPulseStart::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

WaitForPulseStart::~WaitForPulseStart()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void WaitForPulseStart::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseStart_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseStart_FuncRefs.mm"
#	include "State_WaitForPulseStart_OnEntry.mm"
}

void WaitForPulseStart::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseStart_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseStart_FuncRefs.mm"
#	include "State_WaitForPulseStart_OnExit.mm"
}

void WaitForPulseStart::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseStart_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseStart_FuncRefs.mm"
#	include "State_WaitForPulseStart_Internal.mm"
}

bool WaitForPulseStart::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseStart_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseStart_FuncRefs.mm"

	return
	(
#		include "State_WaitForPulseStart_Transition_0.expr"
	);
}
bool WaitForPulseStart::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseStart_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseStart_FuncRefs.mm"

	return
	(
#		include "State_WaitForPulseStart_Transition_1.expr"
	);
}
