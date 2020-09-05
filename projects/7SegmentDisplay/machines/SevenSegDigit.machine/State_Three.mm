//
// State_Three.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Three.h"

#include "State_Three_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Three::Three(const char *name): CLState(name, *new Three::OnEntry, *new Three::OnExit, *new Three::Internal)
{
}

Three::~Three()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Three::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnEntry.mm"
}

void Three::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnExit.mm"
}

void Three::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_Internal.mm"
}

