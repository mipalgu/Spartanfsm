//
// State_GreenOn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "ParameterisedHelloWorld_Includes.h"
#include "ParameterisedHelloWorld.h"
#include "State_GreenOn.h"

#include "State_GreenOn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParameterisedHelloWorld;
using namespace State;

GreenOn::GreenOn(const char *name): CLState(name, *new GreenOn::OnEntry, *new GreenOn::OnExit, *new GreenOn::Internal, NULLPTR, new GreenOn::OnSuspend, new GreenOn::OnResume)
{
	_transitions[0] = new Transition_0();
}

GreenOn::~GreenOn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void GreenOn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_GreenOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_GreenOn_FuncRefs.mm"
#	include "State_GreenOn_OnEntry.mm"
}
 
void GreenOn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_GreenOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_GreenOn_FuncRefs.mm"
#	include "State_GreenOn_OnExit.mm"
}

void GreenOn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_GreenOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_GreenOn_FuncRefs.mm"
#	include "State_GreenOn_Internal.mm"
}

void GreenOn::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_GreenOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_GreenOn_FuncRefs.mm"
#	include "State_GreenOn_OnSuspend.mm"
}

void GreenOn::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_GreenOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_GreenOn_FuncRefs.mm"
#	include "State_GreenOn_OnResume.mm"
}
bool GreenOn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_GreenOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_GreenOn_FuncRefs.mm"

	return
	(
#		include "State_GreenOn_Transition_0.expr"
	);
}
