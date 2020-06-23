//
// State_EncodeBits.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "8BitBinaryToBCDEncoder_Includes.h"
#include "8BitBinaryToBCDEncoder.h"
#include "State_EncodeBits.h"

#include "State_EncodeBits_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM8BitBinaryToBCDEncoder;
using namespace State;

EncodeBits::EncodeBits(const char *name): CLState(name, *new EncodeBits::OnEntry, *new EncodeBits::OnExit, *new EncodeBits::Internal, NULLPTR, new EncodeBits::OnSuspend, new EncodeBits::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

EncodeBits::~EncodeBits()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void EncodeBits::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_OnEntry.mm"
}
 
void EncodeBits::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_OnExit.mm"
}

void EncodeBits::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_Internal.mm"
}

void EncodeBits::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_OnSuspend.mm"
}

void EncodeBits::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_OnResume.mm"
}
bool EncodeBits::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"

	return
	(
#		include "State_EncodeBits_Transition_0.expr"
	);
}
bool EncodeBits::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"

	return
	(
#		include "State_EncodeBits_Transition_1.expr"
	);
}
