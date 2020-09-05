//
// SixteenBitBinaryToBCDEncoder.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SixteenBitBinaryToBCDEncoder_Includes.h"
#include "SixteenBitBinaryToBCDEncoder.h"

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
	SixteenBitBinaryToBCDEncoder *CLM_Create_SixteenBitBinaryToBCDEncoder(int mid, const char *name)
	{
		return new SixteenBitBinaryToBCDEncoder(mid, name);
	}
}

SixteenBitBinaryToBCDEncoder::SixteenBitBinaryToBCDEncoder(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSixteenBitBinaryToBCDEncoder::State::Initial;
	_states[1] = new FSMSixteenBitBinaryToBCDEncoder::State::SUSPENDED;
	_states[2] = new FSMSixteenBitBinaryToBCDEncoder::State::SetBusy;
	_states[3] = new FSMSixteenBitBinaryToBCDEncoder::State::InitialPseudoState;
	_states[4] = new FSMSixteenBitBinaryToBCDEncoder::State::SetupVarsForEncoding;
	_states[5] = new FSMSixteenBitBinaryToBCDEncoder::State::EncodeBits;
	_states[6] = new FSMSixteenBitBinaryToBCDEncoder::State::Reset;
	_states[7] = new FSMSixteenBitBinaryToBCDEncoder::State::SetResult;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SixteenBitBinaryToBCDEncoder::~SixteenBitBinaryToBCDEncoder()
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
