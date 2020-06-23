//
// SevenSegmentEncoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegmentEncoding_Includes.h"
#include "SevenSegmentEncoding.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_Compare.h"
#include "State_Zero.h"
#include "State_One.h"
#include "State_Two.h"
#include "State_Three.h"
#include "State_Four.h"
#include "State_Five.h"
#include "State_Six.h"
#include "State_Seven.h"
#include "State_Eight.h"
#include "State_Nine.h"
#include "State_Wait.h"
#include "State_Error.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SevenSegmentEncoding *CLM_Create_SevenSegmentEncoding(int mid, const char *name)
	{
		return new SevenSegmentEncoding(mid, name);
	}
}

SevenSegmentEncoding::SevenSegmentEncoding(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSevenSegmentEncoding::State::Initial;
	_states[1] = new FSMSevenSegmentEncoding::State::SUSPENDED;
	_states[2] = new FSMSevenSegmentEncoding::State::InitialPseudoState;
	_states[3] = new FSMSevenSegmentEncoding::State::Compare;
	_states[4] = new FSMSevenSegmentEncoding::State::Zero;
	_states[5] = new FSMSevenSegmentEncoding::State::One;
	_states[6] = new FSMSevenSegmentEncoding::State::Two;
	_states[7] = new FSMSevenSegmentEncoding::State::Three;
	_states[8] = new FSMSevenSegmentEncoding::State::Four;
	_states[9] = new FSMSevenSegmentEncoding::State::Five;
	_states[10] = new FSMSevenSegmentEncoding::State::Six;
	_states[11] = new FSMSevenSegmentEncoding::State::Seven;
	_states[12] = new FSMSevenSegmentEncoding::State::Eight;
	_states[13] = new FSMSevenSegmentEncoding::State::Nine;
	_states[14] = new FSMSevenSegmentEncoding::State::Wait;
	_states[15] = new FSMSevenSegmentEncoding::State::Error;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SevenSegmentEncoding::~SevenSegmentEncoding()
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
	delete _states[10];
	delete _states[11];
	delete _states[12];
	delete _states[13];
	delete _states[14];
	delete _states[15];
}
