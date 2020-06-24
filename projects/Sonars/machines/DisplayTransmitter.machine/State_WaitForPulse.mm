//
// State_WaitForPulse.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayTransmitter_Includes.h"
#include "DisplayTransmitter.h"
#include "State_WaitForPulse.h"

#include "State_WaitForPulse_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayTransmitter;
using namespace State;

WaitForPulse::WaitForPulse(const char *name): CLState(name, *new WaitForPulse::OnEntry, *new WaitForPulse::OnExit, *new WaitForPulse::Internal, NULLPTR, new WaitForPulse::OnSuspend, new WaitForPulse::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

WaitForPulse::~WaitForPulse()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void WaitForPulse::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"
#	include "State_WaitForPulse_OnEntry.mm"
}
 
void WaitForPulse::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"
#	include "State_WaitForPulse_OnExit.mm"
}

void WaitForPulse::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"
#	include "State_WaitForPulse_Internal.mm"
}

void WaitForPulse::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"
#	include "State_WaitForPulse_OnSuspend.mm"
}

void WaitForPulse::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"
#	include "State_WaitForPulse_OnResume.mm"
}
bool WaitForPulse::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"

	return
	(
#		include "State_WaitForPulse_Transition_0.expr"
	);
}
bool WaitForPulse::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayTransmitter_VarRefs.mm"
#	include "State_WaitForPulse_VarRefs.mm"
#	include "DisplayTransmitter_FuncRefs.mm"
#	include "State_WaitForPulse_FuncRefs.mm"

	return
	(
#		include "State_WaitForPulse_Transition_1.expr"
	);
}
