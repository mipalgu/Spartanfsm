//
// State_XoredState.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "TMDS_Includes.h"
#include "TMDS.h"
#include "State_XoredState.h"

#include "State_XoredState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTMDS;
using namespace State;

XoredState::XoredState(const char *name): CLState(name, *new XoredState::OnEntry, *new XoredState::OnExit, *new XoredState::Internal)
{
	_transitions[0] = new Transition_0();
}

XoredState::~XoredState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void XoredState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XoredState_FuncRefs.mm"
#	include "State_XoredState_OnEntry.mm"
}

void XoredState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XoredState_FuncRefs.mm"
#	include "State_XoredState_OnExit.mm"
}

void XoredState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XoredState_FuncRefs.mm"
#	include "State_XoredState_Internal.mm"
}

bool XoredState::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TMDS_VarRefs.mm"
#	include "State_XoredState_VarRefs.mm"
#	include "TMDS_FuncRefs.mm"
#	include "State_XoredState_FuncRefs.mm"

	return
	(
#		include "State_XoredState_Transition_0.expr"
	);
}
