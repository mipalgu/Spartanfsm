//
// State_Wait.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "CellularAutomaton_Includes.h"
#include "CellularAutomaton.h"
#include "State_Wait.h"

#include "State_Wait_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCellularAutomaton;
using namespace State;

Wait::Wait(const char *name): CLState(name, *new Wait::OnEntry, *new Wait::OnExit, *new Wait::Internal)
{
	_transitions[0] = new Transition_0();
}

Wait::~Wait()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Wait::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_OnEntry.mm"
}

void Wait::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_OnExit.mm"
}

void Wait::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"
#	include "State_Wait_Internal.mm"
}

bool Wait::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CellularAutomaton_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "CellularAutomaton_FuncRefs.mm"
#	include "State_Wait_FuncRefs.mm"

	return
	(
#		include "State_Wait_Transition_0.expr"
	);
}
