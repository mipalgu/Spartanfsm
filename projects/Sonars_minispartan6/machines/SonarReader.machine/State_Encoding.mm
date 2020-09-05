//
// State_Encoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarReader_Includes.h"
#include "SonarReader.h"
#include "State_Encoding.h"

#include "State_Encoding_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarReader;
using namespace State;

Encoding::Encoding(const char *name): CLState(name, *new Encoding::OnEntry, *new Encoding::OnExit, *new Encoding::Internal, NULLPTR, new Encoding::OnSuspend, new Encoding::OnResume)
{
	_transitions[0] = new Transition_0();
}

Encoding::~Encoding()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Encoding::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_Encoding_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_Encoding_FuncRefs.mm"
#	include "State_Encoding_OnEntry.mm"
}
 
void Encoding::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_Encoding_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_Encoding_FuncRefs.mm"
#	include "State_Encoding_OnExit.mm"
}

void Encoding::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_Encoding_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_Encoding_FuncRefs.mm"
#	include "State_Encoding_Internal.mm"
}

void Encoding::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_Encoding_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_Encoding_FuncRefs.mm"
#	include "State_Encoding_OnSuspend.mm"
}

void Encoding::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_Encoding_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_Encoding_FuncRefs.mm"
#	include "State_Encoding_OnResume.mm"
}
bool Encoding::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarReader_VarRefs.mm"
#	include "State_Encoding_VarRefs.mm"
#	include "SonarReader_FuncRefs.mm"
#	include "State_Encoding_FuncRefs.mm"

	return
	(
#		include "State_Encoding_Transition_0.expr"
	);
}
