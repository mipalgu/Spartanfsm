//
// State_UpdateBcdVariable.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "bcd_Includes.h"
#include "bcd.h"
#include "State_UpdateBcdVariable.h"

#include "State_UpdateBcdVariable_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMbcd;
using namespace State;

UpdateBcdVariable::UpdateBcdVariable(const char *name): CLState(name, *new UpdateBcdVariable::OnEntry, *new UpdateBcdVariable::OnExit, *new UpdateBcdVariable::Internal, NULLPTR, new UpdateBcdVariable::OnSuspend, new UpdateBcdVariable::OnResume)
{
	_transitions[0] = new Transition_0();
}

UpdateBcdVariable::~UpdateBcdVariable()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void UpdateBcdVariable::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_UpdateBcdVariable_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_UpdateBcdVariable_FuncRefs.mm"
#	include "State_UpdateBcdVariable_OnEntry.mm"
}

void UpdateBcdVariable::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_UpdateBcdVariable_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_UpdateBcdVariable_FuncRefs.mm"
#	include "State_UpdateBcdVariable_OnExit.mm"
}

void UpdateBcdVariable::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_UpdateBcdVariable_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_UpdateBcdVariable_FuncRefs.mm"
#	include "State_UpdateBcdVariable_Internal.mm"
}

void UpdateBcdVariable::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_UpdateBcdVariable_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_UpdateBcdVariable_FuncRefs.mm"
#	include "State_UpdateBcdVariable_OnSuspend.mm"
}

void UpdateBcdVariable::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_UpdateBcdVariable_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_UpdateBcdVariable_FuncRefs.mm"
#	include "State_UpdateBcdVariable_OnResume.mm"
}

bool UpdateBcdVariable::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_UpdateBcdVariable_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_UpdateBcdVariable_FuncRefs.mm"

	return
	(
#		include "State_UpdateBcdVariable_Transition_0.expr"
	);
}
