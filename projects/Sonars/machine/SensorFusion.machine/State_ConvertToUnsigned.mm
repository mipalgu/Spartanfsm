//
// State_ConvertToUnsigned.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_ConvertToUnsigned.h"

#include "State_ConvertToUnsigned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

ConvertToUnsigned::ConvertToUnsigned(const char *name): CLState(name, *new ConvertToUnsigned::OnEntry, *new ConvertToUnsigned::OnExit, *new ConvertToUnsigned::Internal, NULLPTR, new ConvertToUnsigned::OnSuspend, new ConvertToUnsigned::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ConvertToUnsigned::~ConvertToUnsigned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void ConvertToUnsigned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"
#	include "State_ConvertToUnsigned_OnEntry.mm"
}
 
void ConvertToUnsigned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"
#	include "State_ConvertToUnsigned_OnExit.mm"
}

void ConvertToUnsigned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"
#	include "State_ConvertToUnsigned_Internal.mm"
}

void ConvertToUnsigned::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"
#	include "State_ConvertToUnsigned_OnSuspend.mm"
}

void ConvertToUnsigned::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"
#	include "State_ConvertToUnsigned_OnResume.mm"
}
bool ConvertToUnsigned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"

	return
	(
#		include "State_ConvertToUnsigned_Transition_0.expr"
	);
}
bool ConvertToUnsigned::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToUnsigned_FuncRefs.mm"

	return
	(
#		include "State_ConvertToUnsigned_Transition_1.expr"
	);
}
