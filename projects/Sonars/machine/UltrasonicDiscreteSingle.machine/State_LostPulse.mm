//
// State_LostPulse.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_LostPulse.h"

#include "State_LostPulse_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

LostPulse::LostPulse(const char *name): CLState(name, *new LostPulse::OnEntry, *new LostPulse::OnExit, *new LostPulse::Internal, NULLPTR, new LostPulse::OnSuspend, new LostPulse::OnResume)
{
	_transitions[0] = new Transition_0();
}

LostPulse::~LostPulse()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void LostPulse::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_LostPulse_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_LostPulse_FuncRefs.mm"
#	include "State_LostPulse_OnEntry.mm"
}

void LostPulse::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_LostPulse_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_LostPulse_FuncRefs.mm"
#	include "State_LostPulse_OnExit.mm"
}

void LostPulse::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_LostPulse_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_LostPulse_FuncRefs.mm"
#	include "State_LostPulse_Internal.mm"
}

void LostPulse::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_LostPulse_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_LostPulse_FuncRefs.mm"
#	include "State_LostPulse_OnSuspend.mm"
}

void LostPulse::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_LostPulse_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_LostPulse_FuncRefs.mm"
#	include "State_LostPulse_OnResume.mm"
}

bool LostPulse::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_LostPulse_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_LostPulse_FuncRefs.mm"

	return
	(
#		include "State_LostPulse_Transition_0.expr"
	);
}
