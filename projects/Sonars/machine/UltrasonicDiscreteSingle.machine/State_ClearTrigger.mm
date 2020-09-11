//
// State_ClearTrigger.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_ClearTrigger.h"

#include "State_ClearTrigger_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

ClearTrigger::ClearTrigger(const char *name): CLState(name, *new ClearTrigger::OnEntry, *new ClearTrigger::OnExit, *new ClearTrigger::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ClearTrigger::~ClearTrigger()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ClearTrigger::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_ClearTrigger_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_ClearTrigger_FuncRefs.mm"
#	include "State_ClearTrigger_OnEntry.mm"
}

void ClearTrigger::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_ClearTrigger_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_ClearTrigger_FuncRefs.mm"
#	include "State_ClearTrigger_OnExit.mm"
}

void ClearTrigger::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_ClearTrigger_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_ClearTrigger_FuncRefs.mm"
#	include "State_ClearTrigger_Internal.mm"
}

bool ClearTrigger::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_ClearTrigger_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_ClearTrigger_FuncRefs.mm"

	return
	(
#		include "State_ClearTrigger_Transition_0.expr"
	);
}
bool ClearTrigger::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_ClearTrigger_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_ClearTrigger_FuncRefs.mm"

	return
	(
#		include "State_ClearTrigger_Transition_1.expr"
	);
}
