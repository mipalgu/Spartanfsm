//
// CellularAutomaton.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "CellularAutomaton_Includes.h"
#include "CellularAutomaton.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_TurnOn.h"
#include "State_Wait.h"
#include "State_TurnOff.h"
#include "State_CountNeighbours.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	CellularAutomaton *CLM_Create_CellularAutomaton(int mid, const char *name)
	{
		return new CellularAutomaton(mid, name);
	}
}

CellularAutomaton::CellularAutomaton(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMCellularAutomaton::State::InitialPseudoState;
	_states[1] = new FSMCellularAutomaton::State::Initial;
	_states[2] = new FSMCellularAutomaton::State::TurnOn;
	_states[3] = new FSMCellularAutomaton::State::Wait;
	_states[4] = new FSMCellularAutomaton::State::TurnOff;
	_states[5] = new FSMCellularAutomaton::State::CountNeighbours;

	setInitialState(_states[0]);            // set initial state
}

CellularAutomaton::~CellularAutomaton()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
