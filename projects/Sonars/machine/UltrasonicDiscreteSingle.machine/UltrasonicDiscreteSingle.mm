//
// UltrasonicDiscreteSingle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_Skip_Garbage.h"
#include "State_WaitForPulseStart.h"
#include "State_ClearTrigger.h"
#include "State_LostPulse.h"
#include "State_WaitForPulseEnd.h"
#include "State_CalculateDistance.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	UltrasonicDiscreteSingle *CLM_Create_UltrasonicDiscreteSingle(int mid, const char *name)
	{
		return new UltrasonicDiscreteSingle(mid, name);
	}
}

UltrasonicDiscreteSingle::UltrasonicDiscreteSingle(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMUltrasonicDiscreteSingle::State::Initial;
	_states[1] = new FSMUltrasonicDiscreteSingle::State::SUSPENDED;
	_states[2] = new FSMUltrasonicDiscreteSingle::State::Skip_Garbage;
	_states[3] = new FSMUltrasonicDiscreteSingle::State::WaitForPulseStart;
	_states[4] = new FSMUltrasonicDiscreteSingle::State::ClearTrigger;
	_states[5] = new FSMUltrasonicDiscreteSingle::State::LostPulse;
	_states[6] = new FSMUltrasonicDiscreteSingle::State::WaitForPulseEnd;
	_states[7] = new FSMUltrasonicDiscreteSingle::State::CalculateDistance;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

UltrasonicDiscreteSingle::~UltrasonicDiscreteSingle()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
}
