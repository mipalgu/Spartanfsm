//
// State_changeCurrentSensor.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_changeCurrentSensor.h"

#include "State_changeCurrentSensor_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

changeCurrentSensor::changeCurrentSensor(const char *name): CLState(name, *new changeCurrentSensor::OnEntry, *new changeCurrentSensor::OnExit, *new changeCurrentSensor::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

changeCurrentSensor::~changeCurrentSensor()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void changeCurrentSensor::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_changeCurrentSensor_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_changeCurrentSensor_FuncRefs.mm"
#	include "State_changeCurrentSensor_OnEntry.mm"
}

void changeCurrentSensor::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_changeCurrentSensor_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_changeCurrentSensor_FuncRefs.mm"
#	include "State_changeCurrentSensor_OnExit.mm"
}

void changeCurrentSensor::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_changeCurrentSensor_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_changeCurrentSensor_FuncRefs.mm"
#	include "State_changeCurrentSensor_Internal.mm"
}

bool changeCurrentSensor::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_changeCurrentSensor_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_changeCurrentSensor_FuncRefs.mm"

	return
	(
#		include "State_changeCurrentSensor_Transition_0.expr"
	);
}
bool changeCurrentSensor::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_changeCurrentSensor_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_changeCurrentSensor_FuncRefs.mm"

	return
	(
#		include "State_changeCurrentSensor_Transition_1.expr"
	);
}
bool changeCurrentSensor::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_changeCurrentSensor_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_changeCurrentSensor_FuncRefs.mm"

	return
	(
#		include "State_changeCurrentSensor_Transition_2.expr"
	);
}
