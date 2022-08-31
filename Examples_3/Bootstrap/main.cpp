#include "OS/Interfaces/IApp.h"

class TestApp : public IApp {
public:
	virtual bool Init() override {
    return true;
  }
	virtual void Exit() override {}

	virtual bool Load() override {
    return true;
  }
	virtual void Unload() override {}

	virtual void Update(float deltaTime) override {}
	virtual void Draw() override {}

	virtual const char* GetName() override {
    return "TestApp";
  }
};

DEFINE_APPLICATION_MAIN(TestApp);
