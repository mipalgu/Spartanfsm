//
// State_SetCarry.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SingleDigitBCDEncoderWithShifting_Includes.h"
#include "SingleDigitBCDEncoderWithShifting.h"
#include "State_SetCarry.h"

#include "State_SetCarry_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSingleDigitBCDEncoderWithShifting;
using namespace State;

SetCarry::SetCarry(const char *name): CLState(name, *new SetCarry::OnEntry, *new SetCarry::OnExit, *new SetCarry::Internal, NULLPTR, new SetCarry::OnSuspend, new SetCarry::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

SetCarry::~SetCarry()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void SetCarry::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"
#	include "State_SetCarry_OnEntry.mm"
}
 
void SetCarry::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"
#	include "State_SetCarry_OnExit.mm"
}

void SetCarry::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"
#	include "State_SetCarry_Internal.mm"
}

void SetCarry::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"
#	include "State_SetCarry_OnSuspend.mm"
}

void SetCarry::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"
#	include "State_SetCarry_OnResume.mm"
}
bool SetCarry::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"

	return
	(
#		include "State_SetCarry_Transition_0.expr"
	);
}
bool SetCarry::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetCarry_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetCarry_FuncRefs.mm"

	return
	(
#		include "State_SetCarry_Transition_1.expr"
	);
}
