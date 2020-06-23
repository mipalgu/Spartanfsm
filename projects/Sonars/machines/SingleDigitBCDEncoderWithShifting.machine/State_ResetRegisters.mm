//
// State_ResetRegisters.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SingleDigitBCDEncoderWithShifting_Includes.h"
#include "SingleDigitBCDEncoderWithShifting.h"
#include "State_ResetRegisters.h"

#include "State_ResetRegisters_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSingleDigitBCDEncoderWithShifting;
using namespace State;

ResetRegisters::ResetRegisters(const char *name): CLState(name, *new ResetRegisters::OnEntry, *new ResetRegisters::OnExit, *new ResetRegisters::Internal, NULLPTR, new ResetRegisters::OnSuspend, new ResetRegisters::OnResume)
{
	_transitions[0] = new Transition_0();
}

ResetRegisters::~ResetRegisters()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ResetRegisters::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_ResetRegisters_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_ResetRegisters_FuncRefs.mm"
#	include "State_ResetRegisters_OnEntry.mm"
}
 
void ResetRegisters::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_ResetRegisters_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_ResetRegisters_FuncRefs.mm"
#	include "State_ResetRegisters_OnExit.mm"
}

void ResetRegisters::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_ResetRegisters_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_ResetRegisters_FuncRefs.mm"
#	include "State_ResetRegisters_Internal.mm"
}

void ResetRegisters::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_ResetRegisters_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_ResetRegisters_FuncRefs.mm"
#	include "State_ResetRegisters_OnSuspend.mm"
}

void ResetRegisters::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_ResetRegisters_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_ResetRegisters_FuncRefs.mm"
#	include "State_ResetRegisters_OnResume.mm"
}
bool ResetRegisters::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SingleDigitBCDEncoderWithShifting_VarRefs.mm"
#	include "State_ResetRegisters_VarRefs.mm"
#	include "SingleDigitBCDEncoderWithShifting_FuncRefs.mm"
#	include "State_ResetRegisters_FuncRefs.mm"

	return
	(
#		include "State_ResetRegisters_Transition_0.expr"
	);
}
