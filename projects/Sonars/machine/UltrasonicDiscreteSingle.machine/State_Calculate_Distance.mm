//
// State_Calculate_Distance.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_Calculate_Distance.h"

#include "State_Calculate_Distance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

Calculate_Distance::Calculate_Distance(const char *name): CLState(name, *new Calculate_Distance::OnEntry, *new Calculate_Distance::OnExit, *new Calculate_Distance::Internal, NULLPTR, new Calculate_Distance::OnSuspend, new Calculate_Distance::OnResume)
{
	_transitions[0] = new Transition_0();
}

Calculate_Distance::~Calculate_Distance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Calculate_Distance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Calculate_Distance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Calculate_Distance_FuncRefs.mm"
#	include "State_Calculate_Distance_OnEntry.mm"
}
 
void Calculate_Distance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Calculate_Distance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Calculate_Distance_FuncRefs.mm"
#	include "State_Calculate_Distance_OnExit.mm"
}

void Calculate_Distance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Calculate_Distance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Calculate_Distance_FuncRefs.mm"
#	include "State_Calculate_Distance_Internal.mm"
}

void Calculate_Distance::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Calculate_Distance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Calculate_Distance_FuncRefs.mm"
#	include "State_Calculate_Distance_OnSuspend.mm"
}

void Calculate_Distance::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Calculate_Distance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Calculate_Distance_FuncRefs.mm"
#	include "State_Calculate_Distance_OnResume.mm"
}
bool Calculate_Distance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Calculate_Distance_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Calculate_Distance_FuncRefs.mm"

	return
	(
#		include "State_Calculate_Distance_Transition_0.expr"
	);
}
