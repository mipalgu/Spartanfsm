//
// FourBitBCD.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "FourBitBCD_Includes.h"
#include "FourBitBCD.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_SeparateInput.h"
#include "State_SetOutput.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	FourBitBCD *CLM_Create_FourBitBCD(int mid, const char *name)
	{
		return new FourBitBCD(mid, name);
	}
}

FourBitBCD::FourBitBCD(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMFourBitBCD::State::Initial;
	_states[1] = new FSMFourBitBCD::State::SUSPENDED;
	_states[2] = new FSMFourBitBCD::State::InitialPseudoState;
	_states[3] = new FSMFourBitBCD::State::SeparateInput;
	_states[4] = new FSMFourBitBCD::State::SetOutput;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

FourBitBCD::~FourBitBCD()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
