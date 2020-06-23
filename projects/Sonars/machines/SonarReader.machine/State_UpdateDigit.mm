//
// State_UpdateDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_UpdateDigit.h"

#include "State_UpdateDigit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

UpdateDigit::UpdateDigit(const char *name): CLState(name, *new UpdateDigit::OnEntry, *new UpdateDigit::OnExit, *new UpdateDigit::Internal, NULLPTR, new UpdateDigit::OnSuspend, new UpdateDigit::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

UpdateDigit::~UpdateDigit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void UpdateDigit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"
#	include "State_UpdateDigit_OnEntry.mm"
}
 
void UpdateDigit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"
#	include "State_UpdateDigit_OnExit.mm"
}

void UpdateDigit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"
#	include "State_UpdateDigit_Internal.mm"
}

void UpdateDigit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"
#	include "State_UpdateDigit_OnSuspend.mm"
}

void UpdateDigit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"
#	include "State_UpdateDigit_OnResume.mm"
}
bool UpdateDigit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"

	return
	(
#		include "State_UpdateDigit_Transition_0.expr"
	);
}
bool UpdateDigit::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_UpdateDigit_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_UpdateDigit_FuncRefs.mm"

	return
	(
#		include "State_UpdateDigit_Transition_1.expr"
	);
}
