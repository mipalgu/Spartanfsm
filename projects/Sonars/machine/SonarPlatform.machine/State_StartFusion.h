//
// State_StartFusion.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SonarPlatform_State_StartFusion_h
#define clfsm_SonarPlatform_State_StartFusion_h

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
            class StartFusion: public CLState
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
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    StartFusion(const char *name = "StartFusion");
                    virtual ~StartFusion();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_StartFusion_Variables.h"
#                   include "State_StartFusion_Methods.h"
            };
        }
      }
    }
}

#endif
