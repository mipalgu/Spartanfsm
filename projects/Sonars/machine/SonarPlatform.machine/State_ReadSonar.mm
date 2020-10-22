//
// State_ReadSonar.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_ReadSonar.h"

#include "State_ReadSonar_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

ReadSonar::ReadSonar(const char *name): CLState(name, *new ReadSonar::OnEntry, *new ReadSonar::OnExit, *new ReadSonar::Internal, NULLPTR, new ReadSonar::OnSuspend, new ReadSonar::OnResume)
{
	_transitions[0] = new Transition_0();
}

ReadSonar::~ReadSonar()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void ReadSonar::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_ReadSonar_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_ReadSonar_FuncRefs.mm"
#	include "State_ReadSonar_OnEntry.mm"
}

void ReadSonar::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_ReadSonar_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_ReadSonar_FuncRefs.mm"
#	include "State_ReadSonar_OnExit.mm"
}

void ReadSonar::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_ReadSonar_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_ReadSonar_FuncRefs.mm"
#	include "State_ReadSonar_Internal.mm"
}

void ReadSonar::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_ReadSonar_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_ReadSonar_FuncRefs.mm"
#	include "State_ReadSonar_OnSuspend.mm"
}

void ReadSonar::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_ReadSonar_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_ReadSonar_FuncRefs.mm"
#	include "State_ReadSonar_OnResume.mm"
}

bool ReadSonar::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_ReadSonar_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_ReadSonar_FuncRefs.mm"

	return
	(
#		include "State_ReadSonar_Transition_0.expr"
	);
}
