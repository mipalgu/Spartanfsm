//
// State_RestartChild.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_ParentMachine_State_RestartChild_h
#define clfsm_ParentMachine_State_RestartChild_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMParentMachine
      {
        namespace State
        {
            class RestartChild: public CLState
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
                    RestartChild(const char *name = "RestartChild");
                    virtual ~RestartChild();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_RestartChild_Variables.h"
#                   include "State_RestartChild_Methods.h"
            };
        }
      }
    }
}

#endif
