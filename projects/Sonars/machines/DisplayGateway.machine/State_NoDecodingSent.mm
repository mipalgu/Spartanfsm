//
// State_NoDecodingSent.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_NoDecodingSent.h"

#include "State_NoDecodingSent_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

NoDecodingSent::NoDecodingSent(const char *name): CLState(name, *new NoDecodingSent::OnEntry, *new NoDecodingSent::OnExit, *new NoDecodingSent::Internal, NULLPTR, new NoDecodingSent::OnSuspend, new NoDecodingSent::OnResume)
{
	_transitions[0] = new Transition_0();
}

NoDecodingSent::~NoDecodingSent()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void NoDecodingSent::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoDecodingSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoDecodingSent_FuncRefs.mm"
#	include "State_NoDecodingSent_OnEntry.mm"
}
 
void NoDecodingSent::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoDecodingSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoDecodingSent_FuncRefs.mm"
#	include "State_NoDecodingSent_OnExit.mm"
}

void NoDecodingSent::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoDecodingSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoDecodingSent_FuncRefs.mm"
#	include "State_NoDecodingSent_Internal.mm"
}

void NoDecodingSent::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoDecodingSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoDecodingSent_FuncRefs.mm"
#	include "State_NoDecodingSent_OnSuspend.mm"
}

void NoDecodingSent::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoDecodingSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoDecodingSent_FuncRefs.mm"
#	include "State_NoDecodingSent_OnResume.mm"
}
bool NoDecodingSent::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_NoDecodingSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_NoDecodingSent_FuncRefs.mm"

	return
	(
#		include "State_NoDecodingSent_Transition_0.expr"
	);
}
