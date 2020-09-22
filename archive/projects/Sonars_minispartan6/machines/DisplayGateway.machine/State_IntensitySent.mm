//
// State_IntensitySent.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_IntensitySent.h"

#include "State_IntensitySent_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

IntensitySent::IntensitySent(const char *name): CLState(name, *new IntensitySent::OnEntry, *new IntensitySent::OnExit, *new IntensitySent::Internal, NULLPTR, new IntensitySent::OnSuspend, new IntensitySent::OnResume)
{
	_transitions[0] = new Transition_0();
}

IntensitySent::~IntensitySent()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void IntensitySent::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_IntensitySent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_IntensitySent_FuncRefs.mm"
#	include "State_IntensitySent_OnEntry.mm"
}
 
void IntensitySent::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_IntensitySent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_IntensitySent_FuncRefs.mm"
#	include "State_IntensitySent_OnExit.mm"
}

void IntensitySent::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_IntensitySent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_IntensitySent_FuncRefs.mm"
#	include "State_IntensitySent_Internal.mm"
}

void IntensitySent::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_IntensitySent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_IntensitySent_FuncRefs.mm"
#	include "State_IntensitySent_OnSuspend.mm"
}

void IntensitySent::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_IntensitySent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_IntensitySent_FuncRefs.mm"
#	include "State_IntensitySent_OnResume.mm"
}
bool IntensitySent::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_IntensitySent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_IntensitySent_FuncRefs.mm"

	return
	(
#		include "State_IntensitySent_Transition_0.expr"
	);
}
