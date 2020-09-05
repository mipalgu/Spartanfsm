//
// State_ResetCount.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7Seg_Includes.h"
#include "7Seg.h"
#include "State_ResetCount.h"

#include "State_ResetCount_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7Seg;
using namespace State;

ResetCount::ResetCount(const char *name): CLState(name, *new ResetCount::OnEntry, *new ResetCount::OnExit, *new ResetCount::Internal)
{
	_transitions[0] = new Transition_0();
}

ResetCount::~ResetCount()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ResetCount::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_ResetCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_ResetCount_FuncRefs.mm"
#	include "State_ResetCount_OnEntry.mm"
}

void ResetCount::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_ResetCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_ResetCount_FuncRefs.mm"
#	include "State_ResetCount_OnExit.mm"
}

void ResetCount::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_ResetCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_ResetCount_FuncRefs.mm"
#	include "State_ResetCount_Internal.mm"
}

bool ResetCount::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_ResetCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_ResetCount_FuncRefs.mm"

	return
	(
#		include "State_ResetCount_Transition_0.expr"
	);
}
