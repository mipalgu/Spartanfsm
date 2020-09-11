//
// SevenSegDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"

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
#include "State_Initial.h"
#include "State_F.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SevenSegDigit *CLM_Create_SevenSegDigit(int mid, const char *name)
	{
		return new SevenSegDigit(mid, name);
	}
}

SevenSegDigit::SevenSegDigit(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSevenSegDigit::State::SUSPENDED;
	_states[1] = new FSMSevenSegDigit::State::InitialPseudoState;
	_states[2] = new FSMSevenSegDigit::State::Zero;
	_states[3] = new FSMSevenSegDigit::State::One;
	_states[4] = new FSMSevenSegDigit::State::Two;
	_states[5] = new FSMSevenSegDigit::State::Three;
	_states[6] = new FSMSevenSegDigit::State::Four;
	_states[7] = new FSMSevenSegDigit::State::Five;
	_states[8] = new FSMSevenSegDigit::State::Six;
	_states[9] = new FSMSevenSegDigit::State::Seven;
	_states[10] = new FSMSevenSegDigit::State::Eight;
	_states[11] = new FSMSevenSegDigit::State::Nine;
	_states[12] = new FSMSevenSegDigit::State::A;
	_states[13] = new FSMSevenSegDigit::State::B;
	_states[14] = new FSMSevenSegDigit::State::C;
	_states[15] = new FSMSevenSegDigit::State::D;
	_states[16] = new FSMSevenSegDigit::State::E;
	_states[17] = new FSMSevenSegDigit::State::Initial;
	_states[18] = new FSMSevenSegDigit::State::F;

	setSuspendState(_states[0]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SevenSegDigit::~SevenSegDigit()
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
