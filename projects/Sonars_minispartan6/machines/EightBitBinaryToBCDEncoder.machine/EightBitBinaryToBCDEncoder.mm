//
// EightBitBinaryToBCDEncoder.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "EightBitBinaryToBCDEncoder_Includes.h"
#include "EightBitBinaryToBCDEncoder.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_SetBusy.h"
#include "State_InitialPseudoState.h"
#include "State_SetupVarsForEncoding.h"
#include "State_EncodeBits.h"
#include "State_Reset.h"
#include "State_SetResult.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	EightBitBinaryToBCDEncoder *CLM_Create_EightBitBinaryToBCDEncoder(int mid, const char *name)
	{
		return new EightBitBinaryToBCDEncoder(mid, name);
	}
}

EightBitBinaryToBCDEncoder::EightBitBinaryToBCDEncoder(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMEightBitBinaryToBCDEncoder::State::Initial;
	_states[1] = new FSMEightBitBinaryToBCDEncoder::State::SUSPENDED;
	_states[2] = new FSMEightBitBinaryToBCDEncoder::State::SetBusy;
	_states[3] = new FSMEightBitBinaryToBCDEncoder::State::InitialPseudoState;
	_states[4] = new FSMEightBitBinaryToBCDEncoder::State::SetupVarsForEncoding;
	_states[5] = new FSMEightBitBinaryToBCDEncoder::State::EncodeBits;
	_states[6] = new FSMEightBitBinaryToBCDEncoder::State::Reset;
	_states[7] = new FSMEightBitBinaryToBCDEncoder::State::SetResult;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

EightBitBinaryToBCDEncoder::~EightBitBinaryToBCDEncoder()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
}
