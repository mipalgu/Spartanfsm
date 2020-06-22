//
// State_EncodeWithCarry.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_EncodeWithCarry.h"

#include "State_EncodeWithCarry_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

EncodeWithCarry::EncodeWithCarry(const char *name): CLState(name, *new EncodeWithCarry::OnEntry, *new EncodeWithCarry::OnExit, *new EncodeWithCarry::Internal, NULLPTR, new EncodeWithCarry::OnSuspend, new EncodeWithCarry::OnResume)
{
	_transitions[0] = new Transition_0();
}

EncodeWithCarry::~EncodeWithCarry()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void EncodeWithCarry::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithCarry_FuncRefs.mm"
#	include "State_EncodeWithCarry_OnEntry.mm"
}
 
void EncodeWithCarry::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithCarry_FuncRefs.mm"
#	include "State_EncodeWithCarry_OnExit.mm"
}

void EncodeWithCarry::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithCarry_FuncRefs.mm"
#	include "State_EncodeWithCarry_Internal.mm"
}

void EncodeWithCarry::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithCarry_FuncRefs.mm"
#	include "State_EncodeWithCarry_OnSuspend.mm"
}

void EncodeWithCarry::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithCarry_FuncRefs.mm"
#	include "State_EncodeWithCarry_OnResume.mm"
}
bool EncodeWithCarry::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_EncodeWithCarry_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_EncodeWithCarry_FuncRefs.mm"

	return
	(
#		include "State_EncodeWithCarry_Transition_0.expr"
	);
}
