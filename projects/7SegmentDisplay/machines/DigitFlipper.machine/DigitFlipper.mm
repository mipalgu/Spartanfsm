//
// DigitFlipper.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "DigitFlipper_Includes.h"
#include "DigitFlipper.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_Check.h"
#include "State_ResetCount.h"
#include "State_CheckIncrease.h"
#include "State_IncrementCount.h"
#include "State_CheckDecrease.h"
#include "State_MaxCount.h"
#include "State_DecrementCount.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	DigitFlipper *CLM_Create_DigitFlipper(int mid, const char *name)
	{
		return new DigitFlipper(mid, name);
	}
}

DigitFlipper::DigitFlipper(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMDigitFlipper::State::Initial;
	_states[1] = new FSMDigitFlipper::State::SUSPENDED;
	_states[2] = new FSMDigitFlipper::State::InitialPseudoState;
	_states[3] = new FSMDigitFlipper::State::Check;
	_states[4] = new FSMDigitFlipper::State::ResetCount;
	_states[5] = new FSMDigitFlipper::State::CheckIncrease;
	_states[6] = new FSMDigitFlipper::State::IncrementCount;
	_states[7] = new FSMDigitFlipper::State::CheckDecrease;
	_states[8] = new FSMDigitFlipper::State::MaxCount;
	_states[9] = new FSMDigitFlipper::State::DecrementCount;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

DigitFlipper::~DigitFlipper()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
}
