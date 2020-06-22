//
// State_SetLowCarryBit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_SetLowCarryBit.h"

#include "State_SetLowCarryBit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

SetLowCarryBit::SetLowCarryBit(const char *name): CLState(name, *new SetLowCarryBit::OnEntry, *new SetLowCarryBit::OnExit, *new SetLowCarryBit::Internal, NULLPTR, new SetLowCarryBit::OnSuspend, new SetLowCarryBit::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetLowCarryBit::~SetLowCarryBit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetLowCarryBit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetLowCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetLowCarryBit_FuncRefs.mm"
#	include "State_SetLowCarryBit_OnEntry.mm"
}
 
void SetLowCarryBit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetLowCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetLowCarryBit_FuncRefs.mm"
#	include "State_SetLowCarryBit_OnExit.mm"
}

void SetLowCarryBit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetLowCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetLowCarryBit_FuncRefs.mm"
#	include "State_SetLowCarryBit_Internal.mm"
}

void SetLowCarryBit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetLowCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetLowCarryBit_FuncRefs.mm"
#	include "State_SetLowCarryBit_OnSuspend.mm"
}

void SetLowCarryBit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetLowCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetLowCarryBit_FuncRefs.mm"
#	include "State_SetLowCarryBit_OnResume.mm"
}
bool SetLowCarryBit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetLowCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetLowCarryBit_FuncRefs.mm"

	return
	(
#		include "State_SetLowCarryBit_Transition_0.expr"
	);
}
