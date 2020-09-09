//
// HelloWorld.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "HelloWorld_Includes.h"
#include "HelloWorld.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_LightOn.h"
#include "State_LightOff.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	HelloWorld *CLM_Create_HelloWorld(int mid, const char *name)
	{
		return new HelloWorld(mid, name);
	}
}

HelloWorld::HelloWorld(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMHelloWorld::State::Initial;
	_states[1] = new FSMHelloWorld::State::SUSPENDED;
	_states[2] = new FSMHelloWorld::State::InitialPseudoState;
	_states[3] = new FSMHelloWorld::State::LightOn;
	_states[4] = new FSMHelloWorld::State::LightOff;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

HelloWorld::~HelloWorld()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
