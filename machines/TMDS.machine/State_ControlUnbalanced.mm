//
// State_ControlUnbalanced.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "TMDS_Includes.h"
#include "TMDS.h"
#include "State_ControlUnbalanced.h"

#include "State_ControlUnbalanced_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTMDS;
using namespace State;

ControlUnbalanced::ControlUnbalanced(const char *name): CLState(name, *new ControlUnbalanced::OnEntry, *new ControlUnbalanced::OnExit, *new ControlUnbalanced::Internal)
{
	_transitions[0] = new Transition_0();
}

ControlUnbalanced::~ControlUnbalanced()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ControlUnbalanced::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlUnbalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlUnbalanced_FuncRefs.mm"
#	include "State_ControlUnbalanced_OnEntry.mm"
}

void ControlUnbalanced::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlUnbalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlUnbalanced_FuncRefs.mm"
#	include "State_ControlUnbalanced_OnExit.mm"
}

void ControlUnbalanced::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlUnbalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlUnbalanced_FuncRefs.mm"
#	include "State_ControlUnbalanced_Internal.mm"
}

bool ControlUnbalanced::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_ControlUnbalanced_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_ControlUnbalanced_FuncRefs.mm"

	return
	(
#		include "State_ControlUnbalanced_Transition_0.expr"
	);
}
