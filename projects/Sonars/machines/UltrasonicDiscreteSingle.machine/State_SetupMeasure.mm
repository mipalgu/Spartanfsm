//
// State_SetupMeasure.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_SetupMeasure.h"

#include "State_SetupMeasure_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

SetupMeasure::SetupMeasure(const char *name): CLState(name, *new SetupMeasure::OnEntry, *new SetupMeasure::OnExit, *new SetupMeasure::Internal)
{
	_transitions[0] = new Transition_0();
}

SetupMeasure::~SetupMeasure()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetupMeasure::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SetupMeasure_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SetupMeasure_FuncRefs.mm"
#	include "State_SetupMeasure_OnEntry.mm"
}

void SetupMeasure::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SetupMeasure_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SetupMeasure_FuncRefs.mm"
#	include "State_SetupMeasure_OnExit.mm"
}

void SetupMeasure::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SetupMeasure_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SetupMeasure_FuncRefs.mm"
#	include "State_SetupMeasure_Internal.mm"
}

bool SetupMeasure::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SetupMeasure_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SetupMeasure_FuncRefs.mm"

	return
	(
#		include "State_SetupMeasure_Transition_0.expr"
	);
}
