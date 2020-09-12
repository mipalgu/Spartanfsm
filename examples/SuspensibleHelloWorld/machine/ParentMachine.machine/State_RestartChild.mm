//
// State_RestartChild.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParentMachine_Includes.h"
#include "ParentMachine.h"
#include "State_RestartChild.h"

#include "State_RestartChild_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParentMachine;
using namespace State;

RestartChild::RestartChild(const char *name): CLState(name, *new RestartChild::OnEntry, *new RestartChild::OnExit, *new RestartChild::Internal)
{
	_transitions[0] = new Transition_0();
}

RestartChild::~RestartChild()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RestartChild::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartChild_FuncRefs.mm"
#	include "State_RestartChild_OnEntry.mm"
}

void RestartChild::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartChild_FuncRefs.mm"
#	include "State_RestartChild_OnExit.mm"
}

void RestartChild::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartChild_FuncRefs.mm"
#	include "State_RestartChild_Internal.mm"
}

bool RestartChild::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_RestartChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_RestartChild_FuncRefs.mm"

	return
	(
#		include "State_RestartChild_Transition_0.expr"
	);
}
