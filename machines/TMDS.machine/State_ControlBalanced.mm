//
// State_ControlBalanced.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "TMDS_Includes.h"
#include "TMDS.h"
#include "State_ControlBalanced.h"

#include "State_ControlBalanced_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTMDS;
using namespace State;

ControlBalanced::ControlBalanced(const char *name): CLState(name, *new ControlBalanced::OnEntry, *new ControlBalanced::OnExit, *new ControlBalanced::Internal)
{
	_transitions[0] = new Transition_0();
}

ControlBalanced::~ControlBalanced()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ControlBalanced::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlBalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlBalanced_FuncRefs.mm"
#	include "State_ControlBalanced_OnEntry.mm"
}

void ControlBalanced::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlBalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlBalanced_FuncRefs.mm"
#	include "State_ControlBalanced_OnExit.mm"
}

void ControlBalanced::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlBalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlBalanced_FuncRefs.mm"
#	include "State_ControlBalanced_Internal.mm"
}

bool ControlBalanced::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlBalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlBalanced_FuncRefs.mm"

	return
	(
#		include "State_ControlBalanced_Transition_0.expr"
	);
}
