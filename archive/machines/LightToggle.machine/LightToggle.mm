//
// LightToggle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LightToggle_Includes.h"
#include "LightToggle.h"

#include "State_InitialPseudoState.h"
#include "State_Compare.h"
#include "State_On.h"
#include "State_Off.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	LightToggle *CLM_Create_LightToggle(int mid, const char *name)
	{
		return new LightToggle(mid, name);
	}
}

LightToggle::LightToggle(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMLightToggle::State::InitialPseudoState;
	_states[1] = new FSMLightToggle::State::Compare;
	_states[2] = new FSMLightToggle::State::On;
	_states[3] = new FSMLightToggle::State::Off;

	setInitialState(_states[0]);            // set initial state
}

LightToggle::~LightToggle()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
