//
// State_DisplayTestSent.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_DisplayTestSent.h"

#include "State_DisplayTestSent_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

DisplayTestSent::DisplayTestSent(const char *name): CLState(name, *new DisplayTestSent::OnEntry, *new DisplayTestSent::OnExit, *new DisplayTestSent::Internal, NULLPTR, new DisplayTestSent::OnSuspend, new DisplayTestSent::OnResume)
{
	_transitions[0] = new Transition_0();
}

DisplayTestSent::~DisplayTestSent()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void DisplayTestSent::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisplayTestSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisplayTestSent_FuncRefs.mm"
#	include "State_DisplayTestSent_OnEntry.mm"
}
 
void DisplayTestSent::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisplayTestSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisplayTestSent_FuncRefs.mm"
#	include "State_DisplayTestSent_OnExit.mm"
}

void DisplayTestSent::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisplayTestSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisplayTestSent_FuncRefs.mm"
#	include "State_DisplayTestSent_Internal.mm"
}

void DisplayTestSent::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisplayTestSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisplayTestSent_FuncRefs.mm"
#	include "State_DisplayTestSent_OnSuspend.mm"
}

void DisplayTestSent::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisplayTestSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisplayTestSent_FuncRefs.mm"
#	include "State_DisplayTestSent_OnResume.mm"
}
bool DisplayTestSent::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisplayTestSent_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisplayTestSent_FuncRefs.mm"

	return
	(
#		include "State_DisplayTestSent_Transition_0.expr"
	);
}
