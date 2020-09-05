//
// State_ShutdownSent.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_ShutdownSent.h"

#include "State_ShutdownSent_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

ShutdownSent::ShutdownSent(const char *name): CLState(name, *new ShutdownSent::OnEntry, *new ShutdownSent::OnExit, *new ShutdownSent::Internal, NULLPTR, new ShutdownSent::OnSuspend, new ShutdownSent::OnResume)
{
	_transitions[0] = new Transition_0();
}

ShutdownSent::~ShutdownSent()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ShutdownSent::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_ShutdownSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_ShutdownSent_FuncRefs.mm"
#	include "State_ShutdownSent_OnEntry.mm"
}
 
void ShutdownSent::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_ShutdownSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_ShutdownSent_FuncRefs.mm"
#	include "State_ShutdownSent_OnExit.mm"
}

void ShutdownSent::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_ShutdownSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_ShutdownSent_FuncRefs.mm"
#	include "State_ShutdownSent_Internal.mm"
}

void ShutdownSent::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_ShutdownSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_ShutdownSent_FuncRefs.mm"
#	include "State_ShutdownSent_OnSuspend.mm"
}

void ShutdownSent::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_ShutdownSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_ShutdownSent_FuncRefs.mm"
#	include "State_ShutdownSent_OnResume.mm"
}
bool ShutdownSent::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_ShutdownSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_ShutdownSent_FuncRefs.mm"

	return
	(
#		include "State_ShutdownSent_Transition_0.expr"
	);
}
