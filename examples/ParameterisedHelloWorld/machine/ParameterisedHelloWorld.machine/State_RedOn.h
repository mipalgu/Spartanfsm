//
// State_RedOn.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_ParameterisedHelloWorld_State_RedOn_h
#define clfsm_ParameterisedHelloWorld_State_RedOn_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMParameterisedHelloWorld
      {
        namespace State
        {
            class RedOn: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    RedOn(const char *name = "RedOn");
                    virtual ~RedOn();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_RedOn_Variables.h"
#                   include "State_RedOn_Methods.h"
            };
        }
      }
    }
}

#endif
