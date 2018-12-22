//
// PixelFlip.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "PixelFlip_Includes.h"
#include "PixelFlip.h"

#include "State_InitialPseudoState.h"
#include "State_Compare.h"
#include "State_Red.h"
#include "State_Green.h"
#include "State_Wait.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	PixelFlip *CLM_Create_PixelFlip(int mid, const char *name)
	{
		return new PixelFlip(mid, name);
	}
}

PixelFlip::PixelFlip(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMPixelFlip::State::InitialPseudoState;
	_states[1] = new FSMPixelFlip::State::Compare;
	_states[2] = new FSMPixelFlip::State::Red;
	_states[3] = new FSMPixelFlip::State::Green;
	_states[4] = new FSMPixelFlip::State::Wait;

	setInitialState(_states[0]);            // set initial state
}

PixelFlip::~PixelFlip()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
