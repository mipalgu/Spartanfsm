//
// DisplayTransmitter.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "DisplayTransmitter_Includes.h"
#include "DisplayTransmitter.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_SendBit.h"
#include "State_CheckForNewData.h"
#include "State_WaitForPulse.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	DisplayTransmitter *CLM_Create_DisplayTransmitter(int mid, const char *name)
	{
		return new DisplayTransmitter(mid, name);
	}
}

DisplayTransmitter::DisplayTransmitter(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMDisplayTransmitter::State::Initial;
	_states[1] = new FSMDisplayTransmitter::State::SUSPENDED;
	_states[2] = new FSMDisplayTransmitter::State::InitialPseudoState;
	_states[3] = new FSMDisplayTransmitter::State::SendBit;
	_states[4] = new FSMDisplayTransmitter::State::CheckForNewData;
	_states[5] = new FSMDisplayTransmitter::State::WaitForPulse;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

DisplayTransmitter::~DisplayTransmitter()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
