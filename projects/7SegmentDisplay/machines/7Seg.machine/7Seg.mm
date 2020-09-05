//
// 7Seg.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7Seg_Includes.h"
#include "7Seg.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_Check.h"
#include "State_ResetCount.h"
#include "State_CheckIncrease.h"
#include "State_IncrementCount.h"
#include "State_CheckDecrease.h"
#include "State_MaxCount.h"
#include "State_DecrementCount.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	7Seg *CLM_Create_7Seg(int mid, const char *name)
	{
		return new 7Seg(mid, name);
	}
}

7Seg::7Seg(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSM7Seg::State::Initial;
	_states[1] = new FSM7Seg::State::SUSPENDED;
	_states[2] = new FSM7Seg::State::InitialPseudoState;
	_states[3] = new FSM7Seg::State::Check;
	_states[4] = new FSM7Seg::State::ResetCount;
	_states[5] = new FSM7Seg::State::CheckIncrease;
	_states[6] = new FSM7Seg::State::IncrementCount;
	_states[7] = new FSM7Seg::State::CheckDecrease;
	_states[8] = new FSM7Seg::State::MaxCount;
	_states[9] = new FSM7Seg::State::DecrementCount;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

7Seg::~7Seg()
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
}
