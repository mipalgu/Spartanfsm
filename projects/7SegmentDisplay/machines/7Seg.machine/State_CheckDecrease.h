//
// State_CheckDecrease.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_7Seg_State_CheckDecrease_h
#define clfsm_7Seg_State_CheckDecrease_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSM7Seg
      {
        namespace State
        {
            class CheckDecrease: public CLState
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
                    Transition_0(int toState = 8): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 9): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    CheckDecrease(const char *name = "CheckDecrease");
                    virtual ~CheckDecrease();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_CheckDecrease_Variables.h"
#                   include "State_CheckDecrease_Methods.h"
            };
        }
      }
    }
}

#endif
