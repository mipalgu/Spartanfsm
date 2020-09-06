//
// State_WaitForOneSecond.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_WaitForOneSecond.h"

#include "State_WaitForOneSecond_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

WaitForOneSecond::WaitForOneSecond(const char *name): CLState(name, *new WaitForOneSecond::OnEntry, *new WaitForOneSecond::OnExit, *new WaitForOneSecond::Internal)
{
	_transitions[0] = new Transition_0();
}

WaitForOneSecond::~WaitForOneSecond()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WaitForOneSecond::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForOneSecond_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForOneSecond_FuncRefs.mm"
#	include "State_WaitForOneSecond_OnEntry.mm"
}

void WaitForOneSecond::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForOneSecond_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForOneSecond_FuncRefs.mm"
#	include "State_WaitForOneSecond_OnExit.mm"
}

void WaitForOneSecond::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForOneSecond_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForOneSecond_FuncRefs.mm"
#	include "State_WaitForOneSecond_Internal.mm"
}

bool WaitForOneSecond::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_WaitForOneSecond_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_WaitForOneSecond_FuncRefs.mm"

	return
	(
#		include "State_WaitForOneSecond_Transition_0.expr"
	);
}
