//
// bcd.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "bcd_Includes.h"
#include "bcd.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_SeparateInput.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	bcd *CLM_Create_bcd(int mid, const char *name)
	{
		return new bcd(mid, name);
	}
}

bcd::bcd(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMbcd::State::Initial;
	_states[1] = new FSMbcd::State::SUSPENDED;
	_states[2] = new FSMbcd::State::InitialPseudoState;
	_states[3] = new FSMbcd::State::SeparateInput;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

bcd::~bcd()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
