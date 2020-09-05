//
// State_DecrementCount.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7Seg_Includes.h"
#include "7Seg.h"
#include "State_DecrementCount.h"

#include "State_DecrementCount_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7Seg;
using namespace State;

DecrementCount::DecrementCount(const char *name): CLState(name, *new DecrementCount::OnEntry, *new DecrementCount::OnExit, *new DecrementCount::Internal)
{
	_transitions[0] = new Transition_0();
}

DecrementCount::~DecrementCount()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DecrementCount::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_DecrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_DecrementCount_FuncRefs.mm"
#	include "State_DecrementCount_OnEntry.mm"
}

void DecrementCount::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_DecrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_DecrementCount_FuncRefs.mm"
#	include "State_DecrementCount_OnExit.mm"
}

void DecrementCount::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_DecrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_DecrementCount_FuncRefs.mm"
#	include "State_DecrementCount_Internal.mm"
}

bool DecrementCount::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_DecrementCount_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_DecrementCount_FuncRefs.mm"

	return
	(
#		include "State_DecrementCount_Transition_0.expr"
	);
}
