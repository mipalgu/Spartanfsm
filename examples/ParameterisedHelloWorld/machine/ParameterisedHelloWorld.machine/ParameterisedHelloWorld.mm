//
// ParameterisedHelloWorld.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParameterisedHelloWorld_Includes.h"
#include "ParameterisedHelloWorld.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_GreenOn.h"
#include "State_RedOn.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	ParameterisedHelloWorld *CLM_Create_ParameterisedHelloWorld(int mid, const char *name)
	{
		return new ParameterisedHelloWorld(mid, name);
	}
}

ParameterisedHelloWorld::ParameterisedHelloWorld(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMParameterisedHelloWorld::State::Initial;
	_states[1] = new FSMParameterisedHelloWorld::State::SUSPENDED;
	_states[2] = new FSMParameterisedHelloWorld::State::GreenOn;
	_states[3] = new FSMParameterisedHelloWorld::State::RedOn;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

ParameterisedHelloWorld::~ParameterisedHelloWorld()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
