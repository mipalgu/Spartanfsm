//
// State_NoShutdown.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_NoShutdown.h"

#include "State_NoShutdown_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

NoShutdown::NoShutdown(const char *name): CLState(name, *new NoShutdown::OnEntry, *new NoShutdown::OnExit, *new NoShutdown::Internal, NULLPTR, new NoShutdown::OnSuspend, new NoShutdown::OnResume)
{
	_transitions[0] = new Transition_0();
}

NoShutdown::~NoShutdown()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void NoShutdown::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoShutdown_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoShutdown_FuncRefs.mm"
#	include "State_NoShutdown_OnEntry.mm"
}
 
void NoShutdown::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoShutdown_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoShutdown_FuncRefs.mm"
#	include "State_NoShutdown_OnExit.mm"
}

void NoShutdown::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoShutdown_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoShutdown_FuncRefs.mm"
#	include "State_NoShutdown_Internal.mm"
}

void NoShutdown::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoShutdown_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoShutdown_FuncRefs.mm"
#	include "State_NoShutdown_OnSuspend.mm"
}

void NoShutdown::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoShutdown_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoShutdown_FuncRefs.mm"
#	include "State_NoShutdown_OnResume.mm"
}
bool NoShutdown::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoShutdown_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoShutdown_FuncRefs.mm"

	return
	(
#		include "State_NoShutdown_Transition_0.expr"
	);
}
