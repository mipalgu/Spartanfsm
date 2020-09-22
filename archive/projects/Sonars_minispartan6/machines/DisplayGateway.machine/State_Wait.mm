//
// State_Wait.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_Wait.h"

#include "State_Wait_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

Wait::Wait(const char *name): CLState(name, *new Wait::OnEntry, *new Wait::OnExit, *new Wait::Internal, NULLPTR, new Wait::OnSuspend, new Wait::OnResume)
{
	_transitions[0] = new Transition_0();
}

Wait::~Wait()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Wait::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_OnEntry.mm"
}
 
void Wait::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_OnExit.mm"
}

void Wait::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_Internal.mm"
}

void Wait::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_OnSuspend.mm"
}

void Wait::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_OnResume.mm"
}
bool Wait::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"

	return
	(
#		include "State_Wait_Transition_0.expr"
	);
}
