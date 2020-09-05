//
// State_SetResult.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SixteenBitBinaryToBCDEncoder_Includes.h"
#include "SixteenBitBinaryToBCDEncoder.h"
#include "State_SetResult.h"

#include "State_SetResult_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSixteenBitBinaryToBCDEncoder;
using namespace State;

SetResult::SetResult(const char *name): CLState(name, *new SetResult::OnEntry, *new SetResult::OnExit, *new SetResult::Internal)
{
	_transitions[0] = new Transition_0();
}

SetResult::~SetResult()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetResult::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_OnEntry.mm"
}

void SetResult::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_OnExit.mm"
}

void SetResult::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_Internal.mm"
}

bool SetResult::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"

	return
	(
#		include "State_SetResult_Transition_0.expr"
	);
}
