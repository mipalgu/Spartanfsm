//
// State_EnableDigitsSent.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_EnableDigitsSent.h"

#include "State_EnableDigitsSent_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

EnableDigitsSent::EnableDigitsSent(const char *name): CLState(name, *new EnableDigitsSent::OnEntry, *new EnableDigitsSent::OnExit, *new EnableDigitsSent::Internal, NULLPTR, new EnableDigitsSent::OnSuspend, new EnableDigitsSent::OnResume)
{
	_transitions[0] = new Transition_0();
}

EnableDigitsSent::~EnableDigitsSent()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void EnableDigitsSent::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_EnableDigitsSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_EnableDigitsSent_FuncRefs.mm"
#	include "State_EnableDigitsSent_OnEntry.mm"
}
 
void EnableDigitsSent::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_EnableDigitsSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_EnableDigitsSent_FuncRefs.mm"
#	include "State_EnableDigitsSent_OnExit.mm"
}

void EnableDigitsSent::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_EnableDigitsSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_EnableDigitsSent_FuncRefs.mm"
#	include "State_EnableDigitsSent_Internal.mm"
}

void EnableDigitsSent::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_EnableDigitsSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_EnableDigitsSent_FuncRefs.mm"
#	include "State_EnableDigitsSent_OnSuspend.mm"
}

void EnableDigitsSent::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_EnableDigitsSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_EnableDigitsSent_FuncRefs.mm"
#	include "State_EnableDigitsSent_OnResume.mm"
}
bool EnableDigitsSent::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_EnableDigitsSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_EnableDigitsSent_FuncRefs.mm"

	return
	(
#		include "State_EnableDigitsSent_Transition_0.expr"
	);
}
