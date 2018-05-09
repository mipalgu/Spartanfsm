//
// State_XnoredState.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "TMDS_Includes.h"
#include "TMDS.h"
#include "State_XnoredState.h"

#include "State_XnoredState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTMDS;
using namespace State;

XnoredState::XnoredState(const char *name): CLState(name, *new XnoredState::OnEntry, *new XnoredState::OnExit, *new XnoredState::Internal)
{
	_transitions[0] = new Transition_0();
}

XnoredState::~XnoredState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void XnoredState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XnoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XnoredState_FuncRefs.mm"
#	include "State_XnoredState_OnEntry.mm"
}

void XnoredState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XnoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XnoredState_FuncRefs.mm"
#	include "State_XnoredState_OnExit.mm"
}

void XnoredState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XnoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XnoredState_FuncRefs.mm"
#	include "State_XnoredState_Internal.mm"
}

bool XnoredState::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XnoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XnoredState_FuncRefs.mm"

	return
	(
#		include "State_XnoredState_Transition_0.expr"
	);
}
