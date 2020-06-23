//
// State_ConvertDistance2.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SonarReader_State_ConvertDistance2_h
#define clfsm_SonarReader_State_ConvertDistance2_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSMSonarReader
    {
      namespace State
      {
        class ConvertDistance2: public CLState
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
                    Transition_0(int toState = 18): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    ConvertDistance2(const char *name = "ConvertDistance2");
                    virtual ~ConvertDistance2();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_ConvertDistance2_Variables.h"
#                   include "State_ConvertDistance2_Methods.h"
            };
        }
      }
    }
}

#endif
