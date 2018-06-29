//
// State_TurnOn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "CellularAutomaton_Includes.h"
#include "CellularAutomaton.h"
#include "State_TurnOn.h"

#include "State_TurnOn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCellularAutomaton;
using namespace State;

TurnOn::TurnOn(const char *name): CLState(name, *new TurnOn::OnEntry, *new TurnOn::OnExit, *new TurnOn::Internal)
{
	_transitions[0] = new Transition_0();
}

TurnOn::~TurnOn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TurnOn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOn_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOn_FuncRefs.mm"
#	include "State_TurnOn_OnEntry.mm"
}

void TurnOn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOn_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOn_FuncRefs.mm"
#	include "State_TurnOn_OnExit.mm"
}

void TurnOn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOn_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOn_FuncRefs.mm"
#	include "State_TurnOn_Internal.mm"
}

bool TurnOn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOn_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOn_FuncRefs.mm"

	return
	(
#		include "State_TurnOn_Transition_0.expr"
	);
}
