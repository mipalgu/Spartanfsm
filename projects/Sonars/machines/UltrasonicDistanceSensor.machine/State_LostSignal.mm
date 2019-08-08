//
// State_LostSignal.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDistanceSensor_Includes.h"
#include "UltrasonicDistanceSensor.h"
#include "State_LostSignal.h"

#include "State_LostSignal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDistanceSensor;
using namespace State;

LostSignal::LostSignal(const char *name): CLState(name, *new LostSignal::OnEntry, *new LostSignal::OnExit, *new LostSignal::Internal, NULLPTR, new LostSignal::OnSuspend, new LostSignal::OnResume)
{
	_transitions[0] = new Transition_0();
}

LostSignal::~LostSignal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void LostSignal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_LostSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_LostSignal_FuncRefs.mm"
#	include "State_LostSignal_OnEntry.mm"
}
 
void LostSignal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_LostSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_LostSignal_FuncRefs.mm"
#	include "State_LostSignal_OnExit.mm"
}

void LostSignal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_LostSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_LostSignal_FuncRefs.mm"
#	include "State_LostSignal_Internal.mm"
}

void LostSignal::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_LostSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_LostSignal_FuncRefs.mm"
#	include "State_LostSignal_OnSuspend.mm"
}

void LostSignal::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_LostSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_LostSignal_FuncRefs.mm"
#	include "State_LostSignal_OnResume.mm"
}
bool LostSignal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_LostSignal_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_LostSignal_FuncRefs.mm"

	return
	(
#		include "State_LostSignal_Transition_0.expr"
	);
}
