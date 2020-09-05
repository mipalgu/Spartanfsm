//
// State_LeastSignificantNibble.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_LeastSignificantNibble.h"

#include "State_LeastSignificantNibble_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

LeastSignificantNibble::LeastSignificantNibble(const char *name): CLState(name, *new LeastSignificantNibble::OnEntry, *new LeastSignificantNibble::OnExit, *new LeastSignificantNibble::Internal, NULLPTR, new LeastSignificantNibble::OnSuspend, new LeastSignificantNibble::OnResume)
{
	_transitions[0] = new Transition_0();
}

LeastSignificantNibble::~LeastSignificantNibble()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void LeastSignificantNibble::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_LeastSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_LeastSignificantNibble_FuncRefs.mm"
#	include "State_LeastSignificantNibble_OnEntry.mm"
}
 
void LeastSignificantNibble::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_LeastSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_LeastSignificantNibble_FuncRefs.mm"
#	include "State_LeastSignificantNibble_OnExit.mm"
}

void LeastSignificantNibble::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_LeastSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_LeastSignificantNibble_FuncRefs.mm"
#	include "State_LeastSignificantNibble_Internal.mm"
}

void LeastSignificantNibble::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_LeastSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_LeastSignificantNibble_FuncRefs.mm"
#	include "State_LeastSignificantNibble_OnSuspend.mm"
}

void LeastSignificantNibble::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_LeastSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_LeastSignificantNibble_FuncRefs.mm"
#	include "State_LeastSignificantNibble_OnResume.mm"
}
bool LeastSignificantNibble::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_LeastSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_LeastSignificantNibble_FuncRefs.mm"

	return
	(
#		include "State_LeastSignificantNibble_Transition_0.expr"
	);
}
