//
// State_CheckIncrease.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_DigitFlipper_State_CheckIncrease_h
#define clfsm_DigitFlipper_State_CheckIncrease_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMDigitFlipper
      {
        namespace State
        {
            class CheckIncrease: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    CheckIncrease(const char *name = "CheckIncrease");
                    virtual ~CheckIncrease();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_CheckIncrease_Variables.h"
#                   include "State_CheckIncrease_Methods.h"
            };
        }
      }
    }
}

#endif
