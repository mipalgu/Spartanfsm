//
// SevenSegDisplay.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_WaitForBCDEncoding.h"
#include "State_SendToDisplays.h"
#include "State_ChangeDigit.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SevenSegDisplay *CLM_Create_SevenSegDisplay(int mid, const char *name)
	{
		return new SevenSegDisplay(mid, name);
	}
}

SevenSegDisplay::SevenSegDisplay(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSevenSegDisplay::State::Initial;
	_states[1] = new FSMSevenSegDisplay::State::SUSPENDED;
	_states[2] = new FSMSevenSegDisplay::State::InitialPseudoState;
	_states[3] = new FSMSevenSegDisplay::State::WaitForBCDEncoding;
	_states[4] = new FSMSevenSegDisplay::State::SendToDisplays;
	_states[5] = new FSMSevenSegDisplay::State::ChangeDigit;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SevenSegDisplay::~SevenSegDisplay()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
