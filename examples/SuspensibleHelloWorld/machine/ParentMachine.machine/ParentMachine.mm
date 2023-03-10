//
// ParentMachine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParentMachine_Includes.h"
#include "ParentMachine.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_SetLED.h"
#include "State_ToggleLight.h"
#include "State_SuspendChild.h"
#include "State_RestartChild.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	ParentMachine *CLM_Create_ParentMachine(int mid, const char *name)
	{
		return new ParentMachine(mid, name);
	}
}

ParentMachine::ParentMachine(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMParentMachine::State::Initial;
	_states[1] = new FSMParentMachine::State::SUSPENDED;
	_states[2] = new FSMParentMachine::State::SetLED;
	_states[3] = new FSMParentMachine::State::ToggleLight;
	_states[4] = new FSMParentMachine::State::SuspendChild;
	_states[5] = new FSMParentMachine::State::RestartChild;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

ParentMachine::~ParentMachine()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
