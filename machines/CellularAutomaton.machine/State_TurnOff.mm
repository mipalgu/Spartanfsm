//
// State_TurnOff.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "CellularAutomaton_Includes.h"
#include "CellularAutomaton.h"
#include "State_TurnOff.h"

#include "State_TurnOff_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCellularAutomaton;
using namespace State;

TurnOff::TurnOff(const char *name): CLState(name, *new TurnOff::OnEntry, *new TurnOff::OnExit, *new TurnOff::Internal)
{
	_transitions[0] = new Transition_0();
}

TurnOff::~TurnOff()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TurnOff::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOff_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOff_FuncRefs.mm"
#	include "State_TurnOff_OnEntry.mm"
}

void TurnOff::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOff_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOff_FuncRefs.mm"
#	include "State_TurnOff_OnExit.mm"
}

void TurnOff::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOff_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOff_FuncRefs.mm"
#	include "State_TurnOff_Internal.mm"
}

bool TurnOff::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_TurnOff_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_TurnOff_FuncRefs.mm"

	return
	(
#		include "State_TurnOff_Transition_0.expr"
	);
}
