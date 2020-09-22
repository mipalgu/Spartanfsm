//
// State_WaitToFinish.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_WaitToFinish.h"

#include "State_WaitToFinish_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

WaitToFinish::WaitToFinish(const char *name): CLState(name, *new WaitToFinish::OnEntry, *new WaitToFinish::OnExit, *new WaitToFinish::Internal, NULLPTR, new WaitToFinish::OnSuspend, new WaitToFinish::OnResume)
{
	_transitions[0] = new Transition_0();
}

WaitToFinish::~WaitToFinish()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void WaitToFinish::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitToFinish_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitToFinish_FuncRefs.mm"
#	include "State_WaitToFinish_OnEntry.mm"
}
 
void WaitToFinish::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitToFinish_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitToFinish_FuncRefs.mm"
#	include "State_WaitToFinish_OnExit.mm"
}

void WaitToFinish::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitToFinish_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitToFinish_FuncRefs.mm"
#	include "State_WaitToFinish_Internal.mm"
}

void WaitToFinish::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitToFinish_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitToFinish_FuncRefs.mm"
#	include "State_WaitToFinish_OnSuspend.mm"
}

void WaitToFinish::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitToFinish_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitToFinish_FuncRefs.mm"
#	include "State_WaitToFinish_OnResume.mm"
}
bool WaitToFinish::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitToFinish_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitToFinish_FuncRefs.mm"

	return
	(
#		include "State_WaitToFinish_Transition_0.expr"
	);
}
