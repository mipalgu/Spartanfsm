//
// State_CreateSeparator.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_CreateSeparator.h"

#include "State_CreateSeparator_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

CreateSeparator::CreateSeparator(const char *name): CLState(name, *new CreateSeparator::OnEntry, *new CreateSeparator::OnExit, *new CreateSeparator::Internal, NULLPTR, new CreateSeparator::OnSuspend, new CreateSeparator::OnResume)
{
	_transitions[0] = new Transition_0();
}

CreateSeparator::~CreateSeparator()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void CreateSeparator::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CreateSeparator_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CreateSeparator_FuncRefs.mm"
#	include "State_CreateSeparator_OnEntry.mm"
}
 
void CreateSeparator::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CreateSeparator_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CreateSeparator_FuncRefs.mm"
#	include "State_CreateSeparator_OnExit.mm"
}

void CreateSeparator::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CreateSeparator_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CreateSeparator_FuncRefs.mm"
#	include "State_CreateSeparator_Internal.mm"
}

void CreateSeparator::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CreateSeparator_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CreateSeparator_FuncRefs.mm"
#	include "State_CreateSeparator_OnSuspend.mm"
}

void CreateSeparator::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CreateSeparator_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CreateSeparator_FuncRefs.mm"
#	include "State_CreateSeparator_OnResume.mm"
}
bool CreateSeparator::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_CreateSeparator_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_CreateSeparator_FuncRefs.mm"

	return
	(
#		include "State_CreateSeparator_Transition_0.expr"
	);
}
