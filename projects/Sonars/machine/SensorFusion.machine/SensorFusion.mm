//
// SensorFusion.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_ConvertToUnsigned.h"
#include "State_changeCurrentSensor.h"
#include "State_ConvertToSigned.h"
#include "State_SetSmallestOutput.h"
#include "State_SignedOutput.h"
#include "State_UnsignedOutput.h"
#include "State_ChangeOutput.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SensorFusion *CLM_Create_SensorFusion(int mid, const char *name)
	{
		return new SensorFusion(mid, name);
	}
}

SensorFusion::SensorFusion(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSensorFusion::State::Initial;
	_states[1] = new FSMSensorFusion::State::SUSPENDED;
	_states[2] = new FSMSensorFusion::State::ConvertToUnsigned;
	_states[3] = new FSMSensorFusion::State::changeCurrentSensor;
	_states[4] = new FSMSensorFusion::State::ConvertToSigned;
	_states[5] = new FSMSensorFusion::State::SetSmallestOutput;
	_states[6] = new FSMSensorFusion::State::SignedOutput;
	_states[7] = new FSMSensorFusion::State::UnsignedOutput;
	_states[8] = new FSMSensorFusion::State::ChangeOutput;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SensorFusion::~SensorFusion()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
}
