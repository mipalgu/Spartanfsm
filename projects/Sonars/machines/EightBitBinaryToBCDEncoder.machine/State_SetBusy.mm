//
// State_SetBusy.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "EightBitBinaryToBCDEncoder_Includes.h"
#include "EightBitBinaryToBCDEncoder.h"
#include "State_SetBusy.h"

#include "State_SetBusy_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMEightBitBinaryToBCDEncoder;
using namespace State;

SetBusy::SetBusy(const char *name): CLState(name, *new SetBusy::OnEntry, *new SetBusy::OnExit, *new SetBusy::Internal, NULLPTR, new SetBusy::OnSuspend, new SetBusy::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetBusy::~SetBusy()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetBusy::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EightBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "EightBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnEntry.mm"
}
 
void SetBusy::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EightBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "EightBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnExit.mm"
}

void SetBusy::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EightBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "EightBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_Internal.mm"
}

void SetBusy::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EightBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "EightBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnSuspend.mm"
}

void SetBusy::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EightBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "EightBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnResume.mm"
}
bool SetBusy::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "EightBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "EightBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"

	return
	(
#		include "State_SetBusy_Transition_0.expr"
	);
}
