//
// UltrasonicDistanceSensor.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDistanceSensor_Includes.h"
#include "UltrasonicDistanceSensor.h"

#include "State_Initial.h"
#include "State_Suspend.h"
#include "State_CountTime.h"
#include "State_CalculateDistance.h"
#include "State_Wait.h"
#include "State_TriggerSignal.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	UltrasonicDistanceSensor *CLM_Create_UltrasonicDistanceSensor(int mid, const char *name)
	{
		return new UltrasonicDistanceSensor(mid, name);
	}
}

UltrasonicDistanceSensor::UltrasonicDistanceSensor(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMUltrasonicDistanceSensor::State::Initial;
	_states[1] = new FSMUltrasonicDistanceSensor::State::Suspend;
	_states[2] = new FSMUltrasonicDistanceSensor::State::CountTime;
	_states[3] = new FSMUltrasonicDistanceSensor::State::CalculateDistance;
	_states[4] = new FSMUltrasonicDistanceSensor::State::Wait;
	_states[5] = new FSMUltrasonicDistanceSensor::State::TriggerSignal;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

UltrasonicDistanceSensor::~UltrasonicDistanceSensor()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
