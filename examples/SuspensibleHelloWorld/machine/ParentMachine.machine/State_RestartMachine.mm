//
// State_RestartMachine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParentMachine_Includes.h"
#include "ParentMachine.h"
#include "State_RestartMachine.h"

#include "State_RestartMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParentMachine;
using namespace State;

RestartMachine::RestartMachine(const char *name): CLState(name, *new RestartMachine::OnEntry, *new RestartMachine::OnExit, *new RestartMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

RestartMachine::~RestartMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RestartMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartMachine_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartMachine_FuncRefs.mm"
#	include "State_RestartMachine_OnEntry.mm"
}

void RestartMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartMachine_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartMachine_FuncRefs.mm"
#	include "State_RestartMachine_OnExit.mm"
}

void RestartMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartMachine_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartMachine_FuncRefs.mm"
#	include "State_RestartMachine_Internal.mm"
}

bool RestartMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartMachine_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartMachine_FuncRefs.mm"

	return
	(
#		include "State_RestartMachine_Transition_0.expr"
	);
}
