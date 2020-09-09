//
// SuspensibleHelloWorld.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SuspensibleHelloWorld_Includes.h"
#include "SuspensibleHelloWorld.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_LightOn.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SuspensibleHelloWorld *CLM_Create_SuspensibleHelloWorld(int mid, const char *name)
	{
		return new SuspensibleHelloWorld(mid, name);
	}
}

SuspensibleHelloWorld::SuspensibleHelloWorld(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSuspensibleHelloWorld::State::Initial;
	_states[1] = new FSMSuspensibleHelloWorld::State::SUSPENDED;
	_states[2] = new FSMSuspensibleHelloWorld::State::InitialPseudoState;
	_states[3] = new FSMSuspensibleHelloWorld::State::LightOn;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SuspensibleHelloWorld::~SuspensibleHelloWorld()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
