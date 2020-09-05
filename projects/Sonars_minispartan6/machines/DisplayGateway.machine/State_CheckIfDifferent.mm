//
// State_CheckIfDifferent.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_CheckIfDifferent.h"

#include "State_CheckIfDifferent_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

CheckIfDifferent::CheckIfDifferent(const char *name): CLState(name, *new CheckIfDifferent::OnEntry, *new CheckIfDifferent::OnExit, *new CheckIfDifferent::Internal, NULLPTR, new CheckIfDifferent::OnSuspend, new CheckIfDifferent::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckIfDifferent::~CheckIfDifferent()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void CheckIfDifferent::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"
#	include "State_CheckIfDifferent_OnEntry.mm"
}
 
void CheckIfDifferent::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"
#	include "State_CheckIfDifferent_OnExit.mm"
}

void CheckIfDifferent::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"
#	include "State_CheckIfDifferent_Internal.mm"
}

void CheckIfDifferent::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"
#	include "State_CheckIfDifferent_OnSuspend.mm"
}

void CheckIfDifferent::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"
#	include "State_CheckIfDifferent_OnResume.mm"
}
bool CheckIfDifferent::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"

	return
	(
#		include "State_CheckIfDifferent_Transition_0.expr"
	);
}
bool CheckIfDifferent::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_CheckIfDifferent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_CheckIfDifferent_FuncRefs.mm"

	return
	(
#		include "State_CheckIfDifferent_Transition_1.expr"
	);
}
