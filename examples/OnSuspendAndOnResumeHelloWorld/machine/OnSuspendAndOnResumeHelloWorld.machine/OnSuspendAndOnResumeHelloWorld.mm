//
// OnSuspendAndOnResumeHelloWorld.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "OnSuspendAndOnResumeHelloWorld_Includes.h"
#include "OnSuspendAndOnResumeHelloWorld.h"

#include "State_Initial.h"
#include "State_LightOn.h"
#include "State_LightOff.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	OnSuspendAndOnResumeHelloWorld *CLM_Create_OnSuspendAndOnResumeHelloWorld(int mid, const char *name)
	{
		return new OnSuspendAndOnResumeHelloWorld(mid, name);
	}
}

OnSuspendAndOnResumeHelloWorld::OnSuspendAndOnResumeHelloWorld(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMOnSuspendAndOnResumeHelloWorld::State::Initial;
	_states[1] = new FSMOnSuspendAndOnResumeHelloWorld::State::LightOn;
	_states[2] = new FSMOnSuspendAndOnResumeHelloWorld::State::LightOff;
	_states[3] = new FSMOnSuspendAndOnResumeHelloWorld::State::SUSPENDED;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

OnSuspendAndOnResumeHelloWorld::~OnSuspendAndOnResumeHelloWorld()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
