//
// State_D.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SevenSegDigit_State_D_h
#define clfsm_SevenSegDigit_State_D_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSevenSegDigit
      {
        namespace State
        {
            class D: public CLState
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
                    Transition_0(int toState = 18): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    D(const char *name = "D");
                    virtual ~D();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_D_Variables.h"
#                   include "State_D_Methods.h"
            };
        }
      }
    }
}

#endif
