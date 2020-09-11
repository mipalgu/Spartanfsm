//
// State_SUSPENDED.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_SUSPENDED.h"

#include "State_SUSPENDED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

SUSPENDED::SUSPENDED(const char *name): CLState(name, *new SUSPENDED::OnEntry, *new SUSPENDED::OnExit, *new SUSPENDED::Internal)
{
}

SUSPENDED::~SUSPENDED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SUSPENDED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SUSPENDED_FuncRefs.mm"
#	include "State_SUSPENDED_OnEntry.mm"
}

void SUSPENDED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SUSPENDED_FuncRefs.mm"
#	include "State_SUSPENDED_OnExit.mm"
}

void SUSPENDED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_SUSPENDED_FuncRefs.mm"
#	include "State_SUSPENDED_Internal.mm"
}

