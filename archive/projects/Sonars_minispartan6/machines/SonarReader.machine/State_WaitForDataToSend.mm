//
// State_WaitForDataToSend.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_WaitForDataToSend.h"

#include "State_WaitForDataToSend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

WaitForDataToSend::WaitForDataToSend(const char *name): CLState(name, *new WaitForDataToSend::OnEntry, *new WaitForDataToSend::OnExit, *new WaitForDataToSend::Internal, NULLPTR, new WaitForDataToSend::OnSuspend, new WaitForDataToSend::OnResume)
{
	_transitions[0] = new Transition_0();
}

WaitForDataToSend::~WaitForDataToSend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void WaitForDataToSend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForDataToSend_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForDataToSend_FuncRefs.mm"
#	include "State_WaitForDataToSend_OnEntry.mm"
}
 
void WaitForDataToSend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForDataToSend_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForDataToSend_FuncRefs.mm"
#	include "State_WaitForDataToSend_OnExit.mm"
}

void WaitForDataToSend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForDataToSend_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForDataToSend_FuncRefs.mm"
#	include "State_WaitForDataToSend_Internal.mm"
}

void WaitForDataToSend::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForDataToSend_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForDataToSend_FuncRefs.mm"
#	include "State_WaitForDataToSend_OnSuspend.mm"
}

void WaitForDataToSend::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForDataToSend_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForDataToSend_FuncRefs.mm"
#	include "State_WaitForDataToSend_OnResume.mm"
}
bool WaitForDataToSend::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForDataToSend_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForDataToSend_FuncRefs.mm"

	return
	(
#		include "State_WaitForDataToSend_Transition_0.expr"
	);
}
