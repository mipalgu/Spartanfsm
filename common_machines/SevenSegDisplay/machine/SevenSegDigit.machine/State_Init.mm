//
// State_Init.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Init.h"

#include "State_Init_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Init::Init(const char *name): CLState(name, *new Init::OnEntry, *new Init::OnExit, *new Init::Internal, NULLPTR, new Init::OnSuspend, new Init::OnResume)
{
	_transitions[0] = new Transition_0();
}

Init::~Init()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Init::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnEntry.mm"
}
 
void Init::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnExit.mm"
}

void Init::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_Internal.mm"
}

void Init::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnSuspend.mm"
}

void Init::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnResume.mm"
}
bool Init::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_0.expr"
	);
}
