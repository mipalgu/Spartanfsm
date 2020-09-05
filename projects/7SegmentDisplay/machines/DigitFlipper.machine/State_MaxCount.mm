//
// State_MaxCount.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "DigitFlipper_Includes.h"
#include "DigitFlipper.h"
#include "State_MaxCount.h"

#include "State_MaxCount_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDigitFlipper;
using namespace State;

MaxCount::MaxCount(const char *name): CLState(name, *new MaxCount::OnEntry, *new MaxCount::OnExit, *new MaxCount::Internal)
{
	_transitions[0] = new Transition_0();
}

MaxCount::~MaxCount()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void MaxCount::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_MaxCount_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_MaxCount_FuncRefs.mm"
#	include "State_MaxCount_OnEntry.mm"
}

void MaxCount::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_MaxCount_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_MaxCount_FuncRefs.mm"
#	include "State_MaxCount_OnExit.mm"
}

void MaxCount::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_MaxCount_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_MaxCount_FuncRefs.mm"
#	include "State_MaxCount_Internal.mm"
}

bool MaxCount::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_MaxCount_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_MaxCount_FuncRefs.mm"

	return
	(
#		include "State_MaxCount_Transition_0.expr"
	);
}
