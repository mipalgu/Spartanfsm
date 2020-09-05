//
// State_SetBusy.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SixteenBitBinaryToBCDEncoder_Includes.h"
#include "SixteenBitBinaryToBCDEncoder.h"
#include "State_SetBusy.h"

#include "State_SetBusy_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSixteenBitBinaryToBCDEncoder;
using namespace State;

SetBusy::SetBusy(const char *name): CLState(name, *new SetBusy::OnEntry, *new SetBusy::OnExit, *new SetBusy::Internal)
{
	_transitions[0] = new Transition_0();
}

SetBusy::~SetBusy()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetBusy::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnEntry.mm"
}

void SetBusy::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_OnExit.mm"
}

void SetBusy::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"
#	include "State_SetBusy_Internal.mm"
}

bool SetBusy::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetBusy_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetBusy_FuncRefs.mm"

	return
	(
#		include "State_SetBusy_Transition_0.expr"
	);
}
