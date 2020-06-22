//
// BinaryToSingleDigitBCDEncoder.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_SetBusy.h"
#include "State_WaitForNewInput.h"
#include "State_CheckCarryBit.h"
#include "State_SetHighCarryBit.h"
#include "State_SetLowCarryBit.h"
#include "State_EncodeWithCarry.h"
#include "State_EncodeWithoutCarry.h"
#include "State_CountShifts.h"
#include "State_CheckLastCarry.h"
#include "State_InitialPseudoState.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	BinaryToSingleDigitBCDEncoder *CLM_Create_BinaryToSingleDigitBCDEncoder(int mid, const char *name)
	{
		return new BinaryToSingleDigitBCDEncoder(mid, name);
	}
}

BinaryToSingleDigitBCDEncoder::BinaryToSingleDigitBCDEncoder(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMBinaryToSingleDigitBCDEncoder::State::Initial;
	_states[1] = new FSMBinaryToSingleDigitBCDEncoder::State::SUSPENDED;
	_states[2] = new FSMBinaryToSingleDigitBCDEncoder::State::SetBusy;
	_states[3] = new FSMBinaryToSingleDigitBCDEncoder::State::WaitForNewInput;
	_states[4] = new FSMBinaryToSingleDigitBCDEncoder::State::CheckCarryBit;
	_states[5] = new FSMBinaryToSingleDigitBCDEncoder::State::SetHighCarryBit;
	_states[6] = new FSMBinaryToSingleDigitBCDEncoder::State::SetLowCarryBit;
	_states[7] = new FSMBinaryToSingleDigitBCDEncoder::State::EncodeWithCarry;
	_states[8] = new FSMBinaryToSingleDigitBCDEncoder::State::EncodeWithoutCarry;
	_states[9] = new FSMBinaryToSingleDigitBCDEncoder::State::CountShifts;
	_states[10] = new FSMBinaryToSingleDigitBCDEncoder::State::CheckLastCarry;
	_states[11] = new FSMBinaryToSingleDigitBCDEncoder::State::InitialPseudoState;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

BinaryToSingleDigitBCDEncoder::~BinaryToSingleDigitBCDEncoder()
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
}
