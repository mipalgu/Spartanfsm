//
// State_ConvertDistance2.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_ConvertDistance2.h"

#include "State_ConvertDistance2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

ConvertDistance2::ConvertDistance2(const char *name): CLState(name, *new ConvertDistance2::OnEntry, *new ConvertDistance2::OnExit, *new ConvertDistance2::Internal, NULLPTR, new ConvertDistance2::OnSuspend, new ConvertDistance2::OnResume)
{
	_transitions[0] = new Transition_0();
}

ConvertDistance2::~ConvertDistance2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ConvertDistance2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance2_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance2_FuncRefs.mm"
#	include "State_ConvertDistance2_OnEntry.mm"
}
 
void ConvertDistance2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance2_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance2_FuncRefs.mm"
#	include "State_ConvertDistance2_OnExit.mm"
}

void ConvertDistance2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance2_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance2_FuncRefs.mm"
#	include "State_ConvertDistance2_Internal.mm"
}

void ConvertDistance2::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance2_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance2_FuncRefs.mm"
#	include "State_ConvertDistance2_OnSuspend.mm"
}

void ConvertDistance2::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance2_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance2_FuncRefs.mm"
#	include "State_ConvertDistance2_OnResume.mm"
}
bool ConvertDistance2::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_ConvertDistance2_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_ConvertDistance2_FuncRefs.mm"

	return
	(
#		include "State_ConvertDistance2_Transition_0.expr"
	);
}
