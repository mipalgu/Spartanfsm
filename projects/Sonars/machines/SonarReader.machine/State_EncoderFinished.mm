//
// State_EncoderFinished.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_EncoderFinished.h"

#include "State_EncoderFinished_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

EncoderFinished::EncoderFinished(const char *name): CLState(name, *new EncoderFinished::OnEntry, *new EncoderFinished::OnExit, *new EncoderFinished::Internal, NULLPTR, new EncoderFinished::OnSuspend, new EncoderFinished::OnResume)
{
	_transitions[0] = new Transition_0();
}

EncoderFinished::~EncoderFinished()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void EncoderFinished::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_EncoderFinished_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_EncoderFinished_FuncRefs.mm"
#	include "State_EncoderFinished_OnEntry.mm"
}
 
void EncoderFinished::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_EncoderFinished_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_EncoderFinished_FuncRefs.mm"
#	include "State_EncoderFinished_OnExit.mm"
}

void EncoderFinished::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_EncoderFinished_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_EncoderFinished_FuncRefs.mm"
#	include "State_EncoderFinished_Internal.mm"
}

void EncoderFinished::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_EncoderFinished_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_EncoderFinished_FuncRefs.mm"
#	include "State_EncoderFinished_OnSuspend.mm"
}

void EncoderFinished::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_EncoderFinished_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_EncoderFinished_FuncRefs.mm"
#	include "State_EncoderFinished_OnResume.mm"
}
bool EncoderFinished::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_EncoderFinished_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_EncoderFinished_FuncRefs.mm"

	return
	(
#		include "State_EncoderFinished_Transition_0.expr"
	);
}
