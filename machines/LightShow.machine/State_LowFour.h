//
// State_LowFour.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_LightShow_State_LowFour_h
#define clfsm_LightShow_State_LowFour_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMLightShow
      {
        namespace State
        {
            class LowFour: public CLState
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
                    LowFour(const char *name = "LowFour");
                    virtual ~LowFour();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LowFour_Variables.h"
#                   include "State_LowFour_Methods.h"
            };
        }
      }
    }
}

#endif
