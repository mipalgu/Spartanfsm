//
// TMDS.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "TMDS_Includes.h"
#include "TMDS.h"

#include "State_Initial.h"
#include "State_XnoredState.h"
#include "State_XoredState.h"
#include "State_ControlBalanced.h"
#include "State_ControlUnbalanced.h"
#include "State_CheckBlank.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	TMDS *CLM_Create_TMDS(int mid, const char *name)
	{
		return new TMDS(mid, name);
	}
}

TMDS::TMDS(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMTMDS::State::Initial;
	_states[1] = new FSMTMDS::State::XnoredState;
	_states[2] = new FSMTMDS::State::XoredState;
	_states[3] = new FSMTMDS::State::ControlBalanced;
	_states[4] = new FSMTMDS::State::ControlUnbalanced;
	_states[5] = new FSMTMDS::State::CheckBlank;

	setInitialState(_states[0]);            // set initial state
}

TMDS::~TMDS()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
