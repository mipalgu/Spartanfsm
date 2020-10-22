//
// SonarPlatform.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_StartFusion.h"
#include "State_SetMinimum.h"
#include "State_FindMinimum.h"
#include "State_ReadSonar.h"
#include "State_StartSonars.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SonarPlatform *CLM_Create_SonarPlatform(int mid, const char *name)
	{
		return new SonarPlatform(mid, name);
	}
}

SonarPlatform::SonarPlatform(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSonarPlatform::State::Initial;
	_states[1] = new FSMSonarPlatform::State::SUSPENDED;
	_states[2] = new FSMSonarPlatform::State::StartFusion;
	_states[3] = new FSMSonarPlatform::State::SetMinimum;
	_states[4] = new FSMSonarPlatform::State::FindMinimum;
	_states[5] = new FSMSonarPlatform::State::ReadSonar;
	_states[6] = new FSMSonarPlatform::State::StartSonars;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SonarPlatform::~SonarPlatform()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
