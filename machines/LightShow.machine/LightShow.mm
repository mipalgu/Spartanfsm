//
// LightShow.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LightShow_Includes.h"
#include "LightShow.h"

#include "State_InitialPseudoState.h"
#include "State_HighFour.h"
#include "State_LowFour.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	LightShow *CLM_Create_LightShow(int mid, const char *name)
	{
		return new LightShow(mid, name);
	}
}

LightShow::LightShow(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMLightShow::State::InitialPseudoState;
	_states[1] = new FSMLightShow::State::HighFour;
	_states[2] = new FSMLightShow::State::LowFour;

	setInitialState(_states[0]);            // set initial state
}

LightShow::~LightShow()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
