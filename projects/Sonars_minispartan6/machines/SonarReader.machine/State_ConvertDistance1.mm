//
// State_ConvertDistance1.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_ConvertDistance1.h"

#include "State_ConvertDistance1_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

ConvertDistance1::ConvertDistance1(const char *name): CLState(name, *new ConvertDistance1::OnEntry, *new ConvertDistance1::OnExit, *new ConvertDistance1::Internal, NULLPTR, new ConvertDistance1::OnSuspend, new ConvertDistance1::OnResume)
{
	_transitions[0] = new Transition_0();
}

ConvertDistance1::~ConvertDistance1()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ConvertDistance1::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance1_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance1_FuncRefs.mm"
#	include "State_ConvertDistance1_OnEntry.mm"
}
 
void ConvertDistance1::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance1_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance1_FuncRefs.mm"
#	include "State_ConvertDistance1_OnExit.mm"
}

void ConvertDistance1::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance1_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance1_FuncRefs.mm"
#	include "State_ConvertDistance1_Internal.mm"
}

void ConvertDistance1::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance1_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance1_FuncRefs.mm"
#	include "State_ConvertDistance1_OnSuspend.mm"
}

void ConvertDistance1::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance1_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance1_FuncRefs.mm"
#	include "State_ConvertDistance1_OnResume.mm"
}
bool ConvertDistance1::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance1_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance1_FuncRefs.mm"

	return
	(
#		include "State_ConvertDistance1_Transition_0.expr"
	);
}
