//
// 7SegDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
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
#include "State_A.h"
#include "State_B.h"
#include "State_C.h"
#include "State_D.h"
#include "State_E.h"
#include "State_Check.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	7SegDigit *CLM_Create_7SegDigit(int mid, const char *name)
	{
		return new 7SegDigit(mid, name);
	}
}

7SegDigit::7SegDigit(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSM7SegDigit::State::Initial;
	_states[1] = new FSM7SegDigit::State::SUSPENDED;
	_states[2] = new FSM7SegDigit::State::InitialPseudoState;
	_states[3] = new FSM7SegDigit::State::Zero;
	_states[4] = new FSM7SegDigit::State::One;
	_states[5] = new FSM7SegDigit::State::Two;
	_states[6] = new FSM7SegDigit::State::Three;
	_states[7] = new FSM7SegDigit::State::Four;
	_states[8] = new FSM7SegDigit::State::Five;
	_states[9] = new FSM7SegDigit::State::Six;
	_states[10] = new FSM7SegDigit::State::Seven;
	_states[11] = new FSM7SegDigit::State::Eight;
	_states[12] = new FSM7SegDigit::State::Nine;
	_states[13] = new FSM7SegDigit::State::A;
	_states[14] = new FSM7SegDigit::State::B;
	_states[15] = new FSM7SegDigit::State::C;
	_states[16] = new FSM7SegDigit::State::D;
	_states[17] = new FSM7SegDigit::State::E;
	_states[18] = new FSM7SegDigit::State::Check;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

7SegDigit::~7SegDigit()
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
	delete _states[16];
	delete _states[17];
	delete _states[18];
}
