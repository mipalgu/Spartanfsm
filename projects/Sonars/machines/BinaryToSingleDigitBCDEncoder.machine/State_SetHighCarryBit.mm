//
// State_SetHighCarryBit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_SetHighCarryBit.h"

#include "State_SetHighCarryBit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

SetHighCarryBit::SetHighCarryBit(const char *name): CLState(name, *new SetHighCarryBit::OnEntry, *new SetHighCarryBit::OnExit, *new SetHighCarryBit::Internal, NULLPTR, new SetHighCarryBit::OnSuspend, new SetHighCarryBit::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetHighCarryBit::~SetHighCarryBit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetHighCarryBit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetHighCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetHighCarryBit_FuncRefs.mm"
#	include "State_SetHighCarryBit_OnEntry.mm"
}
 
void SetHighCarryBit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetHighCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetHighCarryBit_FuncRefs.mm"
#	include "State_SetHighCarryBit_OnExit.mm"
}

void SetHighCarryBit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetHighCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetHighCarryBit_FuncRefs.mm"
#	include "State_SetHighCarryBit_Internal.mm"
}

void SetHighCarryBit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetHighCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetHighCarryBit_FuncRefs.mm"
#	include "State_SetHighCarryBit_OnSuspend.mm"
}

void SetHighCarryBit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetHighCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetHighCarryBit_FuncRefs.mm"
#	include "State_SetHighCarryBit_OnResume.mm"
}
bool SetHighCarryBit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_SetHighCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_SetHighCarryBit_FuncRefs.mm"

	return
	(
#		include "State_SetHighCarryBit_Transition_0.expr"
	);
}
