//
// State_SendToDisplay.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_SendToDisplay.h"

#include "State_SendToDisplay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

SendToDisplay::SendToDisplay(const char *name): CLState(name, *new SendToDisplay::OnEntry, *new SendToDisplay::OnExit, *new SendToDisplay::Internal, NULLPTR, new SendToDisplay::OnSuspend, new SendToDisplay::OnResume)
{
	_transitions[0] = new Transition_0();
}

SendToDisplay::~SendToDisplay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SendToDisplay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SendToDisplay_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SendToDisplay_FuncRefs.mm"
#	include "State_SendToDisplay_OnEntry.mm"
}
 
void SendToDisplay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SendToDisplay_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SendToDisplay_FuncRefs.mm"
#	include "State_SendToDisplay_OnExit.mm"
}

void SendToDisplay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SendToDisplay_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SendToDisplay_FuncRefs.mm"
#	include "State_SendToDisplay_Internal.mm"
}

void SendToDisplay::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SendToDisplay_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SendToDisplay_FuncRefs.mm"
#	include "State_SendToDisplay_OnSuspend.mm"
}

void SendToDisplay::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SendToDisplay_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SendToDisplay_FuncRefs.mm"
#	include "State_SendToDisplay_OnResume.mm"
}
bool SendToDisplay::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SendToDisplay_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SendToDisplay_FuncRefs.mm"

	return
	(
#		include "State_SendToDisplay_Transition_0.expr"
	);
}
