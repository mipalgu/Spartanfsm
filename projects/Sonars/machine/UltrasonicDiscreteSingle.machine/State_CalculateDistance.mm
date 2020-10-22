//
// State_CalculateDistance.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_CalculateDistance.h"

#include "State_CalculateDistance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

CalculateDistance::CalculateDistance(const char *name): CLState(name, *new CalculateDistance::OnEntry, *new CalculateDistance::OnExit, *new CalculateDistance::Internal)
{
	_transitions[0] = new Transition_0();
}

CalculateDistance::~CalculateDistance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void CalculateDistance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_CalculateDistance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_CalculateDistance_FuncRefs.mm"
#	include "State_CalculateDistance_OnEntry.mm"
}

void CalculateDistance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_CalculateDistance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_CalculateDistance_FuncRefs.mm"
#	include "State_CalculateDistance_OnExit.mm"
}

void CalculateDistance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_CalculateDistance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_CalculateDistance_FuncRefs.mm"
#	include "State_CalculateDistance_Internal.mm"
}

bool CalculateDistance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_CalculateDistance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_CalculateDistance_FuncRefs.mm"

	return
	(
#		include "State_CalculateDistance_Transition_0.expr"
	);
}
