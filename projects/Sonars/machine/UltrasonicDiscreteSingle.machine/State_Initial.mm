//
// State_Initial.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal)
{
	_transitions[0] = new Transition_0();
}

Initial::~Initial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnEntry.mm"
}

void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_Internal.mm"
}

bool Initial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_0.expr"
	);
}
