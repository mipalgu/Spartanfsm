//
// 7SegmentEncoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegmentEncoding_Includes.h"
#include "7SegmentEncoding.h"

#include "State_Initial.h"
#include "State_Suspend.h"
#include "State_InitialPseudostate.h"
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
	7SegmentEncoding *CLM_Create_7SegmentEncoding(int mid, const char *name)
	{
		return new 7SegmentEncoding(mid, name);
	}
}

7SegmentEncoding::7SegmentEncoding(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSM7SegmentEncoding::State::Initial;
	_states[1] = new FSM7SegmentEncoding::State::Suspend;
	_states[2] = new FSM7SegmentEncoding::State::InitialPseudostate;
	_states[3] = new FSM7SegmentEncoding::State::Compare;
	_states[4] = new FSM7SegmentEncoding::State::Zero;
	_states[5] = new FSM7SegmentEncoding::State::One;
	_states[6] = new FSM7SegmentEncoding::State::Two;
	_states[7] = new FSM7SegmentEncoding::State::Three;
	_states[8] = new FSM7SegmentEncoding::State::Four;
	_states[9] = new FSM7SegmentEncoding::State::Five;
	_states[10] = new FSM7SegmentEncoding::State::Six;
	_states[11] = new FSM7SegmentEncoding::State::Seven;
	_states[12] = new FSM7SegmentEncoding::State::Eight;
	_states[13] = new FSM7SegmentEncoding::State::Nine;
	_states[14] = new FSM7SegmentEncoding::State::Wait;
	_states[15] = new FSM7SegmentEncoding::State::Error;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

7SegmentEncoding::~7SegmentEncoding()
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
