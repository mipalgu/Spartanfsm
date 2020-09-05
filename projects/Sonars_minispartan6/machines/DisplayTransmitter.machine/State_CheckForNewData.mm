//
// State_CheckForNewData.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayTransmitter_Includes.h"
#include "DisplayTransmitter.h"
#include "State_CheckForNewData.h"

#include "State_CheckForNewData_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayTransmitter;
using namespace State;

CheckForNewData::CheckForNewData(const char *name): CLState(name, *new CheckForNewData::OnEntry, *new CheckForNewData::OnExit, *new CheckForNewData::Internal, NULLPTR, new CheckForNewData::OnSuspend, new CheckForNewData::OnResume)
{
	_transitions[0] = new Transition_0();
}

CheckForNewData::~CheckForNewData()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void CheckForNewData::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_CheckForNewData_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_CheckForNewData_FuncRefs.mm"
#	include "State_CheckForNewData_OnEntry.mm"
}
 
void CheckForNewData::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_CheckForNewData_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_CheckForNewData_FuncRefs.mm"
#	include "State_CheckForNewData_OnExit.mm"
}

void CheckForNewData::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_CheckForNewData_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_CheckForNewData_FuncRefs.mm"
#	include "State_CheckForNewData_Internal.mm"
}

void CheckForNewData::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_CheckForNewData_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_CheckForNewData_FuncRefs.mm"
#	include "State_CheckForNewData_OnSuspend.mm"
}

void CheckForNewData::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_CheckForNewData_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_CheckForNewData_FuncRefs.mm"
#	include "State_CheckForNewData_OnResume.mm"
}
bool CheckForNewData::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_CheckForNewData_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_CheckForNewData_FuncRefs.mm"

	return
	(
#		include "State_CheckForNewData_Transition_0.expr"
	);
}
