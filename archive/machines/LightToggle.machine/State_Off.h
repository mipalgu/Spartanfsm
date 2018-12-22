//
// State_Off.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_LightToggle_State_Off_h
#define clfsm_LightToggle_State_Off_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMLightToggle
      {
        namespace State
        {
            class Off: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Off(const char *name = "Off");
                    virtual ~Off();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Off_Variables.h"
#                   include "State_Off_Methods.h"
            };
        }
      }
    }
}

#endif
