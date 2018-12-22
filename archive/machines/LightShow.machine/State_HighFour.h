//
// State_HighFour.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_LightShow_State_HighFour_h
#define clfsm_LightShow_State_HighFour_h

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
            class HighFour: public CLState
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
                    Transition_0(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    HighFour(const char *name = "HighFour");
                    virtual ~HighFour();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_HighFour_Variables.h"
#                   include "State_HighFour_Methods.h"
            };
        }
      }
    }
}

#endif
