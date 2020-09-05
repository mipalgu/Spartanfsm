//
// State_MaxCount.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_7Seg_State_MaxCount_h
#define clfsm_7Seg_State_MaxCount_h

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
            class MaxCount: public CLState
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
                    MaxCount(const char *name = "MaxCount");
                    virtual ~MaxCount();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_MaxCount_Variables.h"
#                   include "State_MaxCount_Methods.h"
            };
        }
      }
    }
}

#endif
