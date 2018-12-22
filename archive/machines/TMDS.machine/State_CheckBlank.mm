//
// State_CheckBlank.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "TMDS_Includes.h"
#include "TMDS.h"
#include "State_CheckBlank.h"

#include "State_CheckBlank_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTMDS;
using namespace State;

CheckBlank::CheckBlank(const char *name): CLState(name, *new CheckBlank::OnEntry, *new CheckBlank::OnExit, *new CheckBlank::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckBlank::~CheckBlank()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckBlank::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_CheckBlank_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_CheckBlank_FuncRefs.mm"
#	include "State_CheckBlank_OnEntry.mm"
}

void CheckBlank::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_CheckBlank_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_CheckBlank_FuncRefs.mm"
#	include "State_CheckBlank_OnExit.mm"
}

void CheckBlank::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_CheckBlank_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_CheckBlank_FuncRefs.mm"
#	include "State_CheckBlank_Internal.mm"
}

bool CheckBlank::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_CheckBlank_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_CheckBlank_FuncRefs.mm"

	return
	(
#		include "State_CheckBlank_Transition_0.expr"
	);
}
bool CheckBlank::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_CheckBlank_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_CheckBlank_FuncRefs.mm"

	return
	(
#		include "State_CheckBlank_Transition_1.expr"
	);
}
