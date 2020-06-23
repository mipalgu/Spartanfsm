//
// State_MiddleNibble.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_MiddleNibble.h"

#include "State_MiddleNibble_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

MiddleNibble::MiddleNibble(const char *name): CLState(name, *new MiddleNibble::OnEntry, *new MiddleNibble::OnExit, *new MiddleNibble::Internal, NULLPTR, new MiddleNibble::OnSuspend, new MiddleNibble::OnResume)
{
	_transitions[0] = new Transition_0();
}

MiddleNibble::~MiddleNibble()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void MiddleNibble::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MiddleNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MiddleNibble_FuncRefs.mm"
#	include "State_MiddleNibble_OnEntry.mm"
}
 
void MiddleNibble::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MiddleNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MiddleNibble_FuncRefs.mm"
#	include "State_MiddleNibble_OnExit.mm"
}

void MiddleNibble::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MiddleNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MiddleNibble_FuncRefs.mm"
#	include "State_MiddleNibble_Internal.mm"
}

void MiddleNibble::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MiddleNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MiddleNibble_FuncRefs.mm"
#	include "State_MiddleNibble_OnSuspend.mm"
}

void MiddleNibble::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MiddleNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MiddleNibble_FuncRefs.mm"
#	include "State_MiddleNibble_OnResume.mm"
}
bool MiddleNibble::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MiddleNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MiddleNibble_FuncRefs.mm"

	return
	(
#		include "State_MiddleNibble_Transition_0.expr"
	);
}
