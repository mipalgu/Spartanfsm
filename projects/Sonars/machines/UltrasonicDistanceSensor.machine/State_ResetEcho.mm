//
// State_ResetEcho.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "UltrasonicDistanceSensor_Includes.h"
#include "UltrasonicDistanceSensor.h"
#include "State_ResetEcho.h"

#include "State_ResetEcho_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDistanceSensor;
using namespace State;

ResetEcho::ResetEcho(const char *name): CLState(name, *new ResetEcho::OnEntry, *new ResetEcho::OnExit, *new ResetEcho::Internal, NULLPTR, new ResetEcho::OnSuspend, new ResetEcho::OnResume)
{
	_transitions[0] = new Transition_0();
}

ResetEcho::~ResetEcho()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ResetEcho::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_ResetEcho_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_ResetEcho_FuncRefs.mm"
#	include "State_ResetEcho_OnEntry.mm"
}
 
void ResetEcho::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_ResetEcho_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_ResetEcho_FuncRefs.mm"
#	include "State_ResetEcho_OnExit.mm"
}

void ResetEcho::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_ResetEcho_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_ResetEcho_FuncRefs.mm"
#	include "State_ResetEcho_Internal.mm"
}

void ResetEcho::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_ResetEcho_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_ResetEcho_FuncRefs.mm"
#	include "State_ResetEcho_OnSuspend.mm"
}

void ResetEcho::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_ResetEcho_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_ResetEcho_FuncRefs.mm"
#	include "State_ResetEcho_OnResume.mm"
}
bool ResetEcho::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDistanceSensor_VarRefs.mm"
#	include "State_ResetEcho_VarRefs.mm"
#	include "UltrasonicDistanceSensor_FuncRefs.mm"
#	include "State_ResetEcho_FuncRefs.mm"

	return
	(
#		include "State_ResetEcho_Transition_0.expr"
	);
}
