//
// State_CheckEnable.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SingleDigitBCDEncoderWithShifting_Includes.h"
#include "SingleDigitBCDEncoderWithShifting.h"
#include "State_CheckEnable.h"

#include "State_CheckEnable_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSingleDigitBCDEncoderWithShifting;
using namespace State;

CheckEnable::CheckEnable(const char *name): CLState(name, *new CheckEnable::OnEntry, *new CheckEnable::OnExit, *new CheckEnable::Internal, NULLPTR, new CheckEnable::OnSuspend, new CheckEnable::OnResume)
{
	_transitions[0] = new Transition_0();
}

CheckEnable::~CheckEnable()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void CheckEnable::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_CheckEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_CheckEnable_FuncRefs.mm"
#	include "State_CheckEnable_OnEntry.mm"
}
 
void CheckEnable::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_CheckEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_CheckEnable_FuncRefs.mm"
#	include "State_CheckEnable_OnExit.mm"
}

void CheckEnable::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_CheckEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_CheckEnable_FuncRefs.mm"
#	include "State_CheckEnable_Internal.mm"
}

void CheckEnable::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_CheckEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_CheckEnable_FuncRefs.mm"
#	include "State_CheckEnable_OnSuspend.mm"
}

void CheckEnable::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_CheckEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_CheckEnable_FuncRefs.mm"
#	include "State_CheckEnable_OnResume.mm"
}
bool CheckEnable::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_CheckEnable_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_CheckEnable_FuncRefs.mm"

	return
	(
#		include "State_CheckEnable_Transition_0.expr"
	);
}
