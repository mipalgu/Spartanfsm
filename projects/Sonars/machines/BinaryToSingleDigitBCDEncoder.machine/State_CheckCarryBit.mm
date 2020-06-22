//
// State_CheckCarryBit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_CheckCarryBit.h"

#include "State_CheckCarryBit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

CheckCarryBit::CheckCarryBit(const char *name): CLState(name, *new CheckCarryBit::OnEntry, *new CheckCarryBit::OnExit, *new CheckCarryBit::Internal, NULLPTR, new CheckCarryBit::OnSuspend, new CheckCarryBit::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

CheckCarryBit::~CheckCarryBit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void CheckCarryBit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"
#	include "State_CheckCarryBit_OnEntry.mm"
}
 
void CheckCarryBit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"
#	include "State_CheckCarryBit_OnExit.mm"
}

void CheckCarryBit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"
#	include "State_CheckCarryBit_Internal.mm"
}

void CheckCarryBit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"
#	include "State_CheckCarryBit_OnSuspend.mm"
}

void CheckCarryBit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"
#	include "State_CheckCarryBit_OnResume.mm"
}
bool CheckCarryBit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"

	return
	(
#		include "State_CheckCarryBit_Transition_0.expr"
	);
}
bool CheckCarryBit::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"

	return
	(
#		include "State_CheckCarryBit_Transition_1.expr"
	);
}
bool CheckCarryBit::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckCarryBit_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckCarryBit_FuncRefs.mm"

	return
	(
#		include "State_CheckCarryBit_Transition_2.expr"
	);
}
