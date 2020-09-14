//
// State_LightOff.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_OnSuspendAndOnResumeHelloWorld_State_LightOff_h
#define clfsm_OnSuspendAndOnResumeHelloWorld_State_LightOff_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSMOnSuspendAndOnResumeHelloWorld
    {
      namespace State
      {
        class LightOff: public CLState
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
          
          class OnSuspend: public CLAction
          {
            virtual void perform(CLMachine *, CLState *) const;
          };
          
          class OnResume: public CLAction
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
                    LightOff(const char *name = "LightOff");
                    virtual ~LightOff();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LightOff_Variables.h"
#                   include "State_LightOff_Methods.h"
            };
        }
      }
    }
}

#endif
