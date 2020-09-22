//
// State_AllDigitsOn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_AllDigitsOn.h"

#include "State_AllDigitsOn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

AllDigitsOn::AllDigitsOn(const char *name): CLState(name, *new AllDigitsOn::OnEntry, *new AllDigitsOn::OnExit, *new AllDigitsOn::Internal, NULLPTR, new AllDigitsOn::OnSuspend, new AllDigitsOn::OnResume)
{
	_transitions[0] = new Transition_0();
}

AllDigitsOn::~AllDigitsOn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void AllDigitsOn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_AllDigitsOn_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_AllDigitsOn_FuncRefs.mm"
#	include "State_AllDigitsOn_OnEntry.mm"
}
 
void AllDigitsOn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_AllDigitsOn_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_AllDigitsOn_FuncRefs.mm"
#	include "State_AllDigitsOn_OnExit.mm"
}

void AllDigitsOn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_AllDigitsOn_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_AllDigitsOn_FuncRefs.mm"
#	include "State_AllDigitsOn_Internal.mm"
}

void AllDigitsOn::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_AllDigitsOn_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_AllDigitsOn_FuncRefs.mm"
#	include "State_AllDigitsOn_OnSuspend.mm"
}

void AllDigitsOn::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_AllDigitsOn_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_AllDigitsOn_FuncRefs.mm"
#	include "State_AllDigitsOn_OnResume.mm"
}
bool AllDigitsOn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_AllDigitsOn_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_AllDigitsOn_FuncRefs.mm"

	return
	(
#		include "State_AllDigitsOn_Transition_0.expr"
	);
}
