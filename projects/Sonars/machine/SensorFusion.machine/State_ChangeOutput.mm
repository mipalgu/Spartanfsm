//
// State_ChangeOutput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_ChangeOutput.h"

#include "State_ChangeOutput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

ChangeOutput::ChangeOutput(const char *name): CLState(name, *new ChangeOutput::OnEntry, *new ChangeOutput::OnExit, *new ChangeOutput::Internal)
{
	_transitions[0] = new Transition_0();
}

ChangeOutput::~ChangeOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ChangeOutput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_OnEntry.mm"
}

void ChangeOutput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_OnExit.mm"
}

void ChangeOutput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_Internal.mm"
}

bool ChangeOutput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"

	return
	(
#		include "State_ChangeOutput_Transition_0.expr"
	);
}
