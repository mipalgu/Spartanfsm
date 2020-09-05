//
// State_CheckIncrease.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7Seg_Includes.h"
#include "7Seg.h"
#include "State_CheckIncrease.h"

#include "State_CheckIncrease_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7Seg;
using namespace State;

CheckIncrease::CheckIncrease(const char *name): CLState(name, *new CheckIncrease::OnEntry, *new CheckIncrease::OnExit, *new CheckIncrease::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckIncrease::~CheckIncrease()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckIncrease::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_CheckIncrease_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_CheckIncrease_FuncRefs.mm"
#	include "State_CheckIncrease_OnEntry.mm"
}

void CheckIncrease::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_CheckIncrease_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_CheckIncrease_FuncRefs.mm"
#	include "State_CheckIncrease_OnExit.mm"
}

void CheckIncrease::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_CheckIncrease_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_CheckIncrease_FuncRefs.mm"
#	include "State_CheckIncrease_Internal.mm"
}

bool CheckIncrease::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_CheckIncrease_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_CheckIncrease_FuncRefs.mm"

	return
	(
#		include "State_CheckIncrease_Transition_0.expr"
	);
}
bool CheckIncrease::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "7Seg_VarRefs.mm"
#	include "State_CheckIncrease_VarRefs.mm"
#	include "7Seg_FuncRefs.mm"
#	include "State_CheckIncrease_FuncRefs.mm"

	return
	(
#		include "State_CheckIncrease_Transition_1.expr"
	);
}
