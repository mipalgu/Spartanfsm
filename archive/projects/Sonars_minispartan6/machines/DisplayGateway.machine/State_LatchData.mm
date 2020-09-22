//
// State_LatchData.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_LatchData.h"

#include "State_LatchData_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

LatchData::LatchData(const char *name): CLState(name, *new LatchData::OnEntry, *new LatchData::OnExit, *new LatchData::Internal, NULLPTR, new LatchData::OnSuspend, new LatchData::OnResume)
{
	_transitions[0] = new Transition_0();
}

LatchData::~LatchData()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void LatchData::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_LatchData_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_LatchData_FuncRefs.mm"
#	include "State_LatchData_OnEntry.mm"
}
 
void LatchData::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_LatchData_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_LatchData_FuncRefs.mm"
#	include "State_LatchData_OnExit.mm"
}

void LatchData::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_LatchData_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_LatchData_FuncRefs.mm"
#	include "State_LatchData_Internal.mm"
}

void LatchData::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_LatchData_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_LatchData_FuncRefs.mm"
#	include "State_LatchData_OnSuspend.mm"
}

void LatchData::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_LatchData_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_LatchData_FuncRefs.mm"
#	include "State_LatchData_OnResume.mm"
}
bool LatchData::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_LatchData_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_LatchData_FuncRefs.mm"

	return
	(
#		include "State_LatchData_Transition_0.expr"
	);
}
