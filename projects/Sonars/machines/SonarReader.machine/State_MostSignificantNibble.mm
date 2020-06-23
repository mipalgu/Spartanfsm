//
// State_MostSignificantNibble.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_MostSignificantNibble.h"

#include "State_MostSignificantNibble_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

MostSignificantNibble::MostSignificantNibble(const char *name): CLState(name, *new MostSignificantNibble::OnEntry, *new MostSignificantNibble::OnExit, *new MostSignificantNibble::Internal, NULLPTR, new MostSignificantNibble::OnSuspend, new MostSignificantNibble::OnResume)
{
	_transitions[0] = new Transition_0();
}

MostSignificantNibble::~MostSignificantNibble()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void MostSignificantNibble::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MostSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MostSignificantNibble_FuncRefs.mm"
#	include "State_MostSignificantNibble_OnEntry.mm"
}
 
void MostSignificantNibble::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MostSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MostSignificantNibble_FuncRefs.mm"
#	include "State_MostSignificantNibble_OnExit.mm"
}

void MostSignificantNibble::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MostSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MostSignificantNibble_FuncRefs.mm"
#	include "State_MostSignificantNibble_Internal.mm"
}

void MostSignificantNibble::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MostSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MostSignificantNibble_FuncRefs.mm"
#	include "State_MostSignificantNibble_OnSuspend.mm"
}

void MostSignificantNibble::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MostSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MostSignificantNibble_FuncRefs.mm"
#	include "State_MostSignificantNibble_OnResume.mm"
}
bool MostSignificantNibble::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_MostSignificantNibble_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_MostSignificantNibble_FuncRefs.mm"

	return
	(
#		include "State_MostSignificantNibble_Transition_0.expr"
	);
}
