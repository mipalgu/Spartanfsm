//
// State_WaitForEnable.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SingleDigitBCDEncoderWithShifting_Includes.h"
#include "SingleDigitBCDEncoderWithShifting.h"
#include "State_WaitForEnable.h"

#include "State_WaitForEnable_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSingleDigitBCDEncoderWithShifting;
using namespace State;

WaitForEnable::WaitForEnable(const char *name): CLState(name, *new WaitForEnable::OnEntry, *new WaitForEnable::OnExit, *new WaitForEnable::Internal, NULLPTR, new WaitForEnable::OnSuspend, new WaitForEnable::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

WaitForEnable::~WaitForEnable()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void WaitForEnable::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"
#	include "State_WaitForEnable_OnEntry.mm"
}
 
void WaitForEnable::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"
#	include "State_WaitForEnable_OnExit.mm"
}

void WaitForEnable::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"
#	include "State_WaitForEnable_Internal.mm"
}

void WaitForEnable::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"
#	include "State_WaitForEnable_OnSuspend.mm"
}

void WaitForEnable::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"
#	include "State_WaitForEnable_OnResume.mm"
}
bool WaitForEnable::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"

	return
	(
#		include "State_WaitForEnable_Transition_0.expr"
	);
}
bool WaitForEnable::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_WaitForEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_WaitForEnable_FuncRefs.mm"

	return
	(
#		include "State_WaitForEnable_Transition_1.expr"
	);
}
