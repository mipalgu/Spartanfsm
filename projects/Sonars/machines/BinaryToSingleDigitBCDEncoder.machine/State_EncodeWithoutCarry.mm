//
// State_EncodeWithoutCarry.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_EncodeWithoutCarry.h"

#include "State_EncodeWithoutCarry_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

EncodeWithoutCarry::EncodeWithoutCarry(const char *name): CLState(name, *new EncodeWithoutCarry::OnEntry, *new EncodeWithoutCarry::OnExit, *new EncodeWithoutCarry::Internal, NULLPTR, new EncodeWithoutCarry::OnSuspend, new EncodeWithoutCarry::OnResume)
{
	_transitions[0] = new Transition_0();
}

EncodeWithoutCarry::~EncodeWithoutCarry()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void EncodeWithoutCarry::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithoutCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_OnEntry.mm"
}
 
void EncodeWithoutCarry::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithoutCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_OnExit.mm"
}

void EncodeWithoutCarry::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithoutCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_Internal.mm"
}

void EncodeWithoutCarry::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithoutCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_OnSuspend.mm"
}

void EncodeWithoutCarry::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithoutCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_OnResume.mm"
}
bool EncodeWithoutCarry::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithoutCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithoutCarry_FuncRefs.mm"

	return
	(
#		include "State_EncodeWithoutCarry_Transition_0.expr"
	);
}
