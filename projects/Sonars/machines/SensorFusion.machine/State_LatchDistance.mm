//
// State_LatchDistance.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_LatchDistance.h"

#include "State_LatchDistance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

LatchDistance::LatchDistance(const char *name): CLState(name, *new LatchDistance::OnEntry, *new LatchDistance::OnExit, *new LatchDistance::Internal)
{
	_transitions[0] = new Transition_0();
}

LatchDistance::~LatchDistance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LatchDistance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_LatchDistance_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_LatchDistance_FuncRefs.mm"
#	include "State_LatchDistance_OnEntry.mm"
}

void LatchDistance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_LatchDistance_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_LatchDistance_FuncRefs.mm"
#	include "State_LatchDistance_OnExit.mm"
}

void LatchDistance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_LatchDistance_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_LatchDistance_FuncRefs.mm"
#	include "State_LatchDistance_Internal.mm"
}

bool LatchDistance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_LatchDistance_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_LatchDistance_FuncRefs.mm"

	return
	(
#		include "State_LatchDistance_Transition_0.expr"
	);
}
