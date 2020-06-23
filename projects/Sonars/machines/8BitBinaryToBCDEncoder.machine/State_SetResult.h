//
// State_SetResult.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_8BitBinaryToBCDEncoder_State_SetResult_h
#define clfsm_8BitBinaryToBCDEncoder_State_SetResult_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSM8BitBinaryToBCDEncoder
    {
      namespace State
      {
        class SetResult: public CLState
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
                    Transition_0(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    SetResult(const char *name = "SetResult");
                    virtual ~SetResult();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SetResult_Variables.h"
#                   include "State_SetResult_Methods.h"
            };
        }
      }
    }
}

#endif
