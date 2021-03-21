//
// State_WaitForPulseEnd.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_WaitForPulseEnd.h"

#include "State_WaitForPulseEnd_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

WaitForPulseEnd::WaitForPulseEnd(const char *name): CLState(name, *new WaitForPulseEnd::OnEntry, *new WaitForPulseEnd::OnExit, *new WaitForPulseEnd::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

WaitForPulseEnd::~WaitForPulseEnd()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void WaitForPulseEnd::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseEnd_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseEnd_FuncRefs.mm"
#	include "State_WaitForPulseEnd_OnEntry.mm"
}

void WaitForPulseEnd::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseEnd_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseEnd_FuncRefs.mm"
#	include "State_WaitForPulseEnd_OnExit.mm"
}

void WaitForPulseEnd::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseEnd_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseEnd_FuncRefs.mm"
#	include "State_WaitForPulseEnd_Internal.mm"
}

bool WaitForPulseEnd::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseEnd_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseEnd_FuncRefs.mm"

	return
	(
#		include "State_WaitForPulseEnd_Transition_0.expr"
	);
}

bool WaitForPulseEnd::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForPulseEnd_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForPulseEnd_FuncRefs.mm"

	return
	(
#		include "State_WaitForPulseEnd_Transition_1.expr"
	);
}
