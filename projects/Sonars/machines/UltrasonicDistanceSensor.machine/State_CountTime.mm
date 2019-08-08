//
// State_CountTime.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDistanceSensor_Includes.h"
#include "UltrasonicDistanceSensor.h"
#include "State_CountTime.h"

#include "State_CountTime_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDistanceSensor;
using namespace State;

CountTime::CountTime(const char *name): CLState(name, *new CountTime::OnEntry, *new CountTime::OnExit, *new CountTime::Internal, NULLPTR, new CountTime::OnSuspend, new CountTime::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CountTime::~CountTime()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void CountTime::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"
#	include "State_CountTime_OnEntry.mm"
}
 
void CountTime::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"
#	include "State_CountTime_OnExit.mm"
}

void CountTime::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"
#	include "State_CountTime_Internal.mm"
}

void CountTime::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"
#	include "State_CountTime_OnSuspend.mm"
}

void CountTime::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"
#	include "State_CountTime_OnResume.mm"
}
bool CountTime::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"

	return
	(
#		include "State_CountTime_Transition_0.expr"
	);
}
bool CountTime::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_CountTime_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_CountTime_FuncRefs.mm"

	return
	(
#		include "State_CountTime_Transition_1.expr"
	);
}
