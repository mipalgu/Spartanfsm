//
// State_SeparateInput.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_FourBitBCD_State_SeparateInput_h
#define clfsm_FourBitBCD_State_SeparateInput_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMFourBitBCD
      {
        namespace State
        {
            class SeparateInput: public CLState
            {
                class OnEntry: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnExit: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Internal: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    SeparateInput(const char *name = "SeparateInput");
                    virtual ~SeparateInput();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SeparateInput_Variables.h"
#                   include "State_SeparateInput_Methods.h"
            };
        }
      }
    }
}

#endif
