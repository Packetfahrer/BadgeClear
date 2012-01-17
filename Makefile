include theos/makefiles/common.mk

TWEAK_NAME = BadgeClear
BadgeClear_FILES = Tweak.xm
BadgeClear_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
