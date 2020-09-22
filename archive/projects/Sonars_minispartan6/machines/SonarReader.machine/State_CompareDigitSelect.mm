//
// State_CompareDigitSelect.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_CompareDigitSelect.h"

#include "State_CompareDigitSelect_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

CompareDigitSelect::CompareDigitSelect(const char *name): CLState(name, *new CompareDigitSelect::OnEntry, *new CompareDigitSelect::OnExit, *new CompareDigitSelect::Internal, NULLPTR, new CompareDigitSelect::OnSuspend, new CompareDigitSelect::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

CompareDigitSelect::~CompareDigitSelect()
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

void CompareDigitSelect::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"
#	include "State_CompareDigitSelect_OnEntry.mm"
}
 
void CompareDigitSelect::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"
#	include "State_CompareDigitSelect_OnExit.mm"
}

void CompareDigitSelect::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"
#	include "State_CompareDigitSelect_Internal.mm"
}

void CompareDigitSelect::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"
#	include "State_CompareDigitSelect_OnSuspend.mm"
}

void CompareDigitSelect::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"
#	include "State_CompareDigitSelect_OnResume.mm"
}
bool CompareDigitSelect::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"

	return
	(
#		include "State_CompareDigitSelect_Transition_0.expr"
	);
}
bool CompareDigitSelect::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"

	return
	(
#		include "State_CompareDigitSelect_Transition_1.expr"
	);
}
bool CompareDigitSelect::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CompareDigitSelect_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CompareDigitSelect_FuncRefs.mm"

	return
	(
#		include "State_CompareDigitSelect_Transition_2.expr"
	);
}
