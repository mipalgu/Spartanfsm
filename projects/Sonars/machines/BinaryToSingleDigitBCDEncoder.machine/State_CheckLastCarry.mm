//
// State_CheckLastCarry.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_CheckLastCarry.h"

#include "State_CheckLastCarry_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

CheckLastCarry::CheckLastCarry(const char *name): CLState(name, *new CheckLastCarry::OnEntry, *new CheckLastCarry::OnExit, *new CheckLastCarry::Internal, NULLPTR, new CheckLastCarry::OnSuspend, new CheckLastCarry::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckLastCarry::~CheckLastCarry()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void CheckLastCarry::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"
#	include "State_CheckLastCarry_OnEntry.mm"
}
 
void CheckLastCarry::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"
#	include "State_CheckLastCarry_OnExit.mm"
}

void CheckLastCarry::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"
#	include "State_CheckLastCarry_Internal.mm"
}

void CheckLastCarry::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"
#	include "State_CheckLastCarry_OnSuspend.mm"
}

void CheckLastCarry::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"
#	include "State_CheckLastCarry_OnResume.mm"
}
bool CheckLastCarry::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"

	return
	(
#		include "State_CheckLastCarry_Transition_0.expr"
	);
}
bool CheckLastCarry::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CheckLastCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CheckLastCarry_FuncRefs.mm"

	return
	(
#		include "State_CheckLastCarry_Transition_1.expr"
	);
}
