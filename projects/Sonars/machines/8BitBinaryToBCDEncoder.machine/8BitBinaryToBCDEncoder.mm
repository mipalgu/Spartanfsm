//
// 8BitBinaryToBCDEncoder.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "8BitBinaryToBCDEncoder_Includes.h"
#include "8BitBinaryToBCDEncoder.h"

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
	8BitBinaryToBCDEncoder *CLM_Create_8BitBinaryToBCDEncoder(int mid, const char *name)
	{
		return new 8BitBinaryToBCDEncoder(mid, name);
	}
}

8BitBinaryToBCDEncoder::8BitBinaryToBCDEncoder(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSM8BitBinaryToBCDEncoder::State::Initial;
	_states[1] = new FSM8BitBinaryToBCDEncoder::State::SUSPENDED;
	_states[2] = new FSM8BitBinaryToBCDEncoder::State::SetBusy;
	_states[3] = new FSM8BitBinaryToBCDEncoder::State::InitialPseudoState;
	_states[4] = new FSM8BitBinaryToBCDEncoder::State::SetupVarsForEncoding;
	_states[5] = new FSM8BitBinaryToBCDEncoder::State::EncodeBits;
	_states[6] = new FSM8BitBinaryToBCDEncoder::State::Reset;
	_states[7] = new FSM8BitBinaryToBCDEncoder::State::SetResult;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

8BitBinaryToBCDEncoder::~8BitBinaryToBCDEncoder()
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
