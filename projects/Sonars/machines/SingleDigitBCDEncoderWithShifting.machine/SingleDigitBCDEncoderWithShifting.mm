//
// SingleDigitBCDEncoderWithShifting.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SingleDigitBCDEncoderWithShifting_Includes.h"
#include "SingleDigitBCDEncoderWithShifting.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_ResetRegisters.h"
#include "State_SetBusy.h"
#include "State_EncodeWithCarry.h"
#include "State_EncodeWithoutCarry.h"
#include "State_SetCarry.h"
#include "State_WaitForEnable.h"
#include "State_InitialPseudoState.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SingleDigitBCDEncoderWithShifting *CLM_Create_SingleDigitBCDEncoderWithShifting(int mid, const char *name)
	{
		return new SingleDigitBCDEncoderWithShifting(mid, name);
	}
}

SingleDigitBCDEncoderWithShifting::SingleDigitBCDEncoderWithShifting(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSingleDigitBCDEncoderWithShifting::State::Initial;
	_states[1] = new FSMSingleDigitBCDEncoderWithShifting::State::SUSPENDED;
	_states[2] = new FSMSingleDigitBCDEncoderWithShifting::State::ResetRegisters;
	_states[3] = new FSMSingleDigitBCDEncoderWithShifting::State::SetBusy;
	_states[4] = new FSMSingleDigitBCDEncoderWithShifting::State::EncodeWithCarry;
	_states[5] = new FSMSingleDigitBCDEncoderWithShifting::State::EncodeWithoutCarry;
	_states[6] = new FSMSingleDigitBCDEncoderWithShifting::State::SetCarry;
	_states[7] = new FSMSingleDigitBCDEncoderWithShifting::State::WaitForEnable;
	_states[8] = new FSMSingleDigitBCDEncoderWithShifting::State::InitialPseudoState;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SingleDigitBCDEncoderWithShifting::~SingleDigitBCDEncoderWithShifting()
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
}
