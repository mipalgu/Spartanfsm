//
// SevenSegmentTester.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegmentTester_Includes.h"
#include "SevenSegmentTester.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_ResetDigit.h"
#include "State_InitialPseudoState.h"
#include "State_SendData.h"
#include "State_CheckDigit.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SevenSegmentTester *CLM_Create_SevenSegmentTester(int mid, const char *name)
	{
		return new SevenSegmentTester(mid, name);
	}
}

SevenSegmentTester::SevenSegmentTester(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSevenSegmentTester::State::Initial;
	_states[1] = new FSMSevenSegmentTester::State::SUSPENDED;
	_states[2] = new FSMSevenSegmentTester::State::ResetDigit;
	_states[3] = new FSMSevenSegmentTester::State::InitialPseudoState;
	_states[4] = new FSMSevenSegmentTester::State::SendData;
	_states[5] = new FSMSevenSegmentTester::State::CheckDigit;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SevenSegmentTester::~SevenSegmentTester()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
