//
// State_One.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_One.h"

#include "State_One_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

One::One(const char *name): CLState(name, *new One::OnEntry, *new One::OnExit, *new One::Internal)
{
	_transitions[0] = new Transition_0();
}

One::~One()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void One::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnEntry.mm"
}

void One::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnExit.mm"
}

void One::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_Internal.mm"
}

bool One::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"

	return
	(
#		include "State_One_Transition_0.expr"
	);
}
