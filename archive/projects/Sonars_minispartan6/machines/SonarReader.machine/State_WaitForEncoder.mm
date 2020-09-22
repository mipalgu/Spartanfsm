//
// State_WaitForEncoder.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_WaitForEncoder.h"

#include "State_WaitForEncoder_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

WaitForEncoder::WaitForEncoder(const char *name): CLState(name, *new WaitForEncoder::OnEntry, *new WaitForEncoder::OnExit, *new WaitForEncoder::Internal, NULLPTR, new WaitForEncoder::OnSuspend, new WaitForEncoder::OnResume)
{
	_transitions[0] = new Transition_0();
}

WaitForEncoder::~WaitForEncoder()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void WaitForEncoder::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForEncoder_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForEncoder_FuncRefs.mm"
#	include "State_WaitForEncoder_OnEntry.mm"
}
 
void WaitForEncoder::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForEncoder_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForEncoder_FuncRefs.mm"
#	include "State_WaitForEncoder_OnExit.mm"
}

void WaitForEncoder::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForEncoder_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForEncoder_FuncRefs.mm"
#	include "State_WaitForEncoder_Internal.mm"
}

void WaitForEncoder::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForEncoder_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForEncoder_FuncRefs.mm"
#	include "State_WaitForEncoder_OnSuspend.mm"
}

void WaitForEncoder::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForEncoder_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForEncoder_FuncRefs.mm"
#	include "State_WaitForEncoder_OnResume.mm"
}
bool WaitForEncoder::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_WaitForEncoder_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_WaitForEncoder_FuncRefs.mm"

	return
	(
#		include "State_WaitForEncoder_Transition_0.expr"
	);
}
