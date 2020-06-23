//
// DisplayGateway.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_InitialPseudoState.h"
#include "State_NoShutdown.h"
#include "State_SetNoDecoding.h"
#include "State_SetIntensity.h"
#include "State_AllDigitsOn.h"
#include "State_DisableDisplayTest.h"
#include "State_LatchData.h"
#include "State_SendData.h"
#include "State_Wait.h"
#include "State_CheckIfDifferent.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	DisplayGateway *CLM_Create_DisplayGateway(int mid, const char *name)
	{
		return new DisplayGateway(mid, name);
	}
}

DisplayGateway::DisplayGateway(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMDisplayGateway::State::Initial;
	_states[1] = new FSMDisplayGateway::State::SUSPENDED;
	_states[2] = new FSMDisplayGateway::State::InitialPseudoState;
	_states[3] = new FSMDisplayGateway::State::NoShutdown;
	_states[4] = new FSMDisplayGateway::State::SetNoDecoding;
	_states[5] = new FSMDisplayGateway::State::SetIntensity;
	_states[6] = new FSMDisplayGateway::State::AllDigitsOn;
	_states[7] = new FSMDisplayGateway::State::DisableDisplayTest;
	_states[8] = new FSMDisplayGateway::State::LatchData;
	_states[9] = new FSMDisplayGateway::State::SendData;
	_states[10] = new FSMDisplayGateway::State::Wait;
	_states[11] = new FSMDisplayGateway::State::CheckIfDifferent;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

DisplayGateway::~DisplayGateway()
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
