//
// SevenSegDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"

#include "State_Init.h"
#include "State_Suspend.h"
#include "State_ConvertBinary.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SevenSegDigit *CLM_Create_SevenSegDigit(int mid, const char *name)
	{
		return new SevenSegDigit(mid, name);
	}
}

SevenSegDigit::SevenSegDigit(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSevenSegDigit::State::Init;
	_states[1] = new FSMSevenSegDigit::State::Suspend;
	_states[2] = new FSMSevenSegDigit::State::ConvertBinary;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SevenSegDigit::~SevenSegDigit()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
