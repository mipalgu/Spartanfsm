//
// State_SetResult.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "8BitBinaryToBCDEncoder_Includes.h"
#include "8BitBinaryToBCDEncoder.h"
#include "State_SetResult.h"

#include "State_SetResult_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM8BitBinaryToBCDEncoder;
using namespace State;

SetResult::SetResult(const char *name): CLState(name, *new SetResult::OnEntry, *new SetResult::OnExit, *new SetResult::Internal, NULLPTR, new SetResult::OnSuspend, new SetResult::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetResult::~SetResult()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetResult::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_OnEntry.mm"
}
 
void SetResult::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_OnExit.mm"
}

void SetResult::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_Internal.mm"
}

void SetResult::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_OnSuspend.mm"
}

void SetResult::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"
#	include "State_SetResult_OnResume.mm"
}
bool SetResult::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetResult_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetResult_FuncRefs.mm"

	return
	(
#		include "State_SetResult_Transition_0.expr"
	);
}
