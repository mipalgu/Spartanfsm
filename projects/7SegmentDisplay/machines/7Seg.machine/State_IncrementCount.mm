//
// State_IncrementCount.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7Seg_Includes.h"
#include "7Seg.h"
#include "State_IncrementCount.h"

#include "State_IncrementCount_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7Seg;
using namespace State;

IncrementCount::IncrementCount(const char *name): CLState(name, *new IncrementCount::OnEntry, *new IncrementCount::OnExit, *new IncrementCount::Internal)
{
	_transitions[0] = new Transition_0();
}

IncrementCount::~IncrementCount()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void IncrementCount::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_IncrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_IncrementCount_FuncRefs.mm"
#	include "State_IncrementCount_OnEntry.mm"
}

void IncrementCount::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_IncrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_IncrementCount_FuncRefs.mm"
#	include "State_IncrementCount_OnExit.mm"
}

void IncrementCount::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_IncrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_IncrementCount_FuncRefs.mm"
#	include "State_IncrementCount_Internal.mm"
}

bool IncrementCount::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_IncrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_IncrementCount_FuncRefs.mm"

	return
	(
#		include "State_IncrementCount_Transition_0.expr"
	);
}
