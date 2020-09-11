//
// State_ConvertToSigned.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_ConvertToSigned.h"

#include "State_ConvertToSigned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

ConvertToSigned::ConvertToSigned(const char *name): CLState(name, *new ConvertToSigned::OnEntry, *new ConvertToSigned::OnExit, *new ConvertToSigned::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ConvertToSigned::~ConvertToSigned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ConvertToSigned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToSigned_FuncRefs.mm"
#	include "State_ConvertToSigned_OnEntry.mm"
}

void ConvertToSigned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToSigned_FuncRefs.mm"
#	include "State_ConvertToSigned_OnExit.mm"
}

void ConvertToSigned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToSigned_FuncRefs.mm"
#	include "State_ConvertToSigned_Internal.mm"
}

bool ConvertToSigned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToSigned_FuncRefs.mm"

	return
	(
#		include "State_ConvertToSigned_Transition_0.expr"
	);
}
bool ConvertToSigned::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ConvertToSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ConvertToSigned_FuncRefs.mm"

	return
	(
#		include "State_ConvertToSigned_Transition_1.expr"
	);
}
