//
// State_FindMinimum.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SonarPlatform_State_FindMinimum_h
#define clfsm_SonarPlatform_State_FindMinimum_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSonarPlatform
      {
        namespace State
        {
            class FindMinimum: public CLState
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
                    Transition_0(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    FindMinimum(const char *name = "FindMinimum");
                    virtual ~FindMinimum();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FindMinimum_Variables.h"
#                   include "State_FindMinimum_Methods.h"
            };
        }
      }
    }
}

#endif
