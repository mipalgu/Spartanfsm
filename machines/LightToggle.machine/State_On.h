//
// State_On.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_LightToggle_State_On_h
#define clfsm_LightToggle_State_On_h

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
            class On: public CLState
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
                    On(const char *name = "On");
                    virtual ~On();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_On_Variables.h"
#                   include "State_On_Methods.h"
            };
        }
      }
    }
}

#endif
