//
// Pixel.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Pixel_Includes.h"
#include "Pixel.h"

#include "State_Initial.h"
#include "State_Suspend.h"
#include "State_Red.h"
#include "State_Green.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Pixel *CLM_Create_Pixel(int mid, const char *name)
	{
		return new Pixel(mid, name);
	}
}

Pixel::Pixel(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMPixel::State::Initial;
	_states[1] = new FSMPixel::State::Suspend;
	_states[2] = new FSMPixel::State::Red;
	_states[3] = new FSMPixel::State::Green;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

Pixel::~Pixel()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
