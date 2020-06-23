//
// State_SelectDistance.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_SelectDistance.h"

#include "State_SelectDistance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

SelectDistance::SelectDistance(const char *name): CLState(name, *new SelectDistance::OnEntry, *new SelectDistance::OnExit, *new SelectDistance::Internal, NULLPTR, new SelectDistance::OnSuspend, new SelectDistance::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

SelectDistance::~SelectDistance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void SelectDistance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"
#	include "State_SelectDistance_OnEntry.mm"
}
 
void SelectDistance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"
#	include "State_SelectDistance_OnExit.mm"
}

void SelectDistance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"
#	include "State_SelectDistance_Internal.mm"
}

void SelectDistance::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"
#	include "State_SelectDistance_OnSuspend.mm"
}

void SelectDistance::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"
#	include "State_SelectDistance_OnResume.mm"
}
bool SelectDistance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"

	return
	(
#		include "State_SelectDistance_Transition_0.expr"
	);
}
bool SelectDistance::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"

	return
	(
#		include "State_SelectDistance_Transition_1.expr"
	);
}
bool SelectDistance::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_SelectDistance_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_SelectDistance_FuncRefs.mm"

	return
	(
#		include "State_SelectDistance_Transition_2.expr"
	);
}
