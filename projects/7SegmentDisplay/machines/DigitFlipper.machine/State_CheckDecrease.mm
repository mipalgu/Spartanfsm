//
// State_CheckDecrease.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "DigitFlipper_Includes.h"
#include "DigitFlipper.h"
#include "State_CheckDecrease.h"

#include "State_CheckDecrease_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDigitFlipper;
using namespace State;

CheckDecrease::CheckDecrease(const char *name): CLState(name, *new CheckDecrease::OnEntry, *new CheckDecrease::OnExit, *new CheckDecrease::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckDecrease::~CheckDecrease()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckDecrease::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_CheckDecrease_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_CheckDecrease_FuncRefs.mm"
#	include "State_CheckDecrease_OnEntry.mm"
}

void CheckDecrease::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_CheckDecrease_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_CheckDecrease_FuncRefs.mm"
#	include "State_CheckDecrease_OnExit.mm"
}

void CheckDecrease::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_CheckDecrease_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_CheckDecrease_FuncRefs.mm"
#	include "State_CheckDecrease_Internal.mm"
}

bool CheckDecrease::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_CheckDecrease_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_CheckDecrease_FuncRefs.mm"

	return
	(
#		include "State_CheckDecrease_Transition_0.expr"
	);
}
bool CheckDecrease::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "DigitFlipper_VarRefs.mm"
#	include "State_CheckDecrease_VarRefs.mm"
#	include "DigitFlipper_FuncRefs.mm"
#	include "State_CheckDecrease_FuncRefs.mm"

	return
	(
#		include "State_CheckDecrease_Transition_1.expr"
	);
}
