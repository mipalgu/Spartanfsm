//
// State_SetBusy.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SingleDigitBCDEncoderWithShifting_Includes.h"
#include "SingleDigitBCDEncoderWithShifting.h"
#include "State_SetBusy.h"

#include "State_SetBusy_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSingleDigitBCDEncoderWithShifting;
using namespace State;

SetBusy::SetBusy(const char *name): CLState(name, *new SetBusy::OnEntry, *new SetBusy::OnExit, *new SetBusy::Internal, NULLPTR, new SetBusy::OnSuspend, new SetBusy::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

SetBusy::~SetBusy()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void SetBusy::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnEntry.mm"
}
 
void SetBusy::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnExit.mm"
}

void SetBusy::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_Internal.mm"
}

void SetBusy::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnSuspend.mm"
}

void SetBusy::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnResume.mm"
}
bool SetBusy::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"

	return
	(
#		include "State_SetBusy_Transition_0.expr"
	);
}
bool SetBusy::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"

	return
	(
#		include "State_SetBusy_Transition_1.expr"
	);
}
