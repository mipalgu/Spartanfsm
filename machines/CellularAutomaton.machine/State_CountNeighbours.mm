//
// State_CountNeighbours.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "CellularAutomaton_Includes.h"
#include "CellularAutomaton.h"
#include "State_CountNeighbours.h"

#include "State_CountNeighbours_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCellularAutomaton;
using namespace State;

CountNeighbours::CountNeighbours(const char *name): CLState(name, *new CountNeighbours::OnEntry, *new CountNeighbours::OnExit, *new CountNeighbours::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CountNeighbours::~CountNeighbours()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CountNeighbours::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_CountNeighbours_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_CountNeighbours_FuncRefs.mm"
#	include "State_CountNeighbours_OnEntry.mm"
}

void CountNeighbours::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_CountNeighbours_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_CountNeighbours_FuncRefs.mm"
#	include "State_CountNeighbours_OnExit.mm"
}

void CountNeighbours::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_CountNeighbours_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_CountNeighbours_FuncRefs.mm"
#	include "State_CountNeighbours_Internal.mm"
}

bool CountNeighbours::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_CountNeighbours_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_CountNeighbours_FuncRefs.mm"

	return
	(
#		include "State_CountNeighbours_Transition_0.expr"
	);
}
bool CountNeighbours::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_CountNeighbours_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_CountNeighbours_FuncRefs.mm"

	return
	(
#		include "State_CountNeighbours_Transition_1.expr"
	);
}
