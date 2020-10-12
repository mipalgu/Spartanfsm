//
// State_C.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SevenSegDigit_State_C_h
#define clfsm_SevenSegDigit_State_C_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

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
            class C: public CLState
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

                class OnSuspend: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnResume: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    C(const char *name = "C");
                    virtual ~C();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_C_Variables.h"
#                   include "State_C_Methods.h"
            };
        }
      }
    }
}

#endif
