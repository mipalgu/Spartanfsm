//
// State_BCDEncode.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_BCDEncode.h"

#include "State_BCDEncode_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

BCDEncode::BCDEncode(const char *name): CLState(name, *new BCDEncode::OnEntry, *new BCDEncode::OnExit, *new BCDEncode::Internal, NULLPTR, new BCDEncode::OnSuspend, new BCDEncode::OnResume)
{
	_transitions[0] = new Transition_0();
}

BCDEncode::~BCDEncode()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void BCDEncode::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_BCDEncode_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_BCDEncode_FuncRefs.mm"
#	include "State_BCDEncode_OnEntry.mm"
}
 
void BCDEncode::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_BCDEncode_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_BCDEncode_FuncRefs.mm"
#	include "State_BCDEncode_OnExit.mm"
}

void BCDEncode::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_BCDEncode_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_BCDEncode_FuncRefs.mm"
#	include "State_BCDEncode_Internal.mm"
}

void BCDEncode::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_BCDEncode_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_BCDEncode_FuncRefs.mm"
#	include "State_BCDEncode_OnSuspend.mm"
}

void BCDEncode::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_BCDEncode_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_BCDEncode_FuncRefs.mm"
#	include "State_BCDEncode_OnResume.mm"
}
bool BCDEncode::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_BCDEncode_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_BCDEncode_FuncRefs.mm"

	return
	(
#		include "State_BCDEncode_Transition_0.expr"
	);
}
