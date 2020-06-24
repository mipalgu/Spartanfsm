//
// State_TriggerSignal.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDistanceSensor_Includes.h"
#include "UltrasonicDistanceSensor.h"
#include "State_TriggerSignal.h"

#include "State_TriggerSignal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDistanceSensor;
using namespace State;

TriggerSignal::TriggerSignal(const char *name): CLState(name, *new TriggerSignal::OnEntry, *new TriggerSignal::OnExit, *new TriggerSignal::Internal, NULLPTR, new TriggerSignal::OnSuspend, new TriggerSignal::OnResume)
{
	_transitions[0] = new Transition_0();
}

TriggerSignal::~TriggerSignal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void TriggerSignal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_TriggerSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_TriggerSignal_FuncRefs.mm"
#	include "State_TriggerSignal_OnEntry.mm"
}
 
void TriggerSignal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_TriggerSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_TriggerSignal_FuncRefs.mm"
#	include "State_TriggerSignal_OnExit.mm"
}

void TriggerSignal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_TriggerSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_TriggerSignal_FuncRefs.mm"
#	include "State_TriggerSignal_Internal.mm"
}

void TriggerSignal::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_TriggerSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_TriggerSignal_FuncRefs.mm"
#	include "State_TriggerSignal_OnSuspend.mm"
}

void TriggerSignal::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_TriggerSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_TriggerSignal_FuncRefs.mm"
#	include "State_TriggerSignal_OnResume.mm"
}
bool TriggerSignal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_TriggerSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_TriggerSignal_FuncRefs.mm"

	return
	(
#		include "State_TriggerSignal_Transition_0.expr"
	);
}
