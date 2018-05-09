//
// Schedule.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Schedule_Includes.h"
#include "Schedule.h"

#include "State_Initial.h"
#include "State_IncrementHV.h"
#include "State_AssignControl.h"
#include "State_UpdatePixel.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Schedule *CLM_Create_Schedule(int mid, const char *name)
	{
		return new Schedule(mid, name);
	}
}

Schedule::Schedule(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSchedule::State::Initial;
	_states[1] = new FSMSchedule::State::IncrementHV;
	_states[2] = new FSMSchedule::State::AssignControl;
	_states[3] = new FSMSchedule::State::UpdatePixel;

	setInitialState(_states[0]);            // set initial state
}

Schedule::~Schedule()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
