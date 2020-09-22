//
// State_WaitForPulse.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_DisplayTransmitter_State_WaitForPulse_h
#define clfsm_DisplayTransmitter_State_WaitForPulse_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSMDisplayTransmitter
    {
      namespace State
      {
        class WaitForPulse: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    WaitForPulse(const char *name = "WaitForPulse");
                    virtual ~WaitForPulse();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_WaitForPulse_Variables.h"
#                   include "State_WaitForPulse_Methods.h"
            };
        }
      }
    }
}

#endif
