## Local build configuration
## Parameters configured here will override default and ENV values.

## Add your source directories here separated by space
# MODULES = app
EXTRA_INCDIR = include

## ESP_HOME sets the path where ESP tools and SDK are located.
ESP_HOME = /opt/esp-open-sdk

## SMING_HOME sets the path where Sming framework is located.
SMING_HOME = /home/michael/workspace/ESP8266/ninHOME_MQTT_Client_Web/Sming/Sming

## COM port parameter is reqruied to flash firmware correctly.
COM_PORT = /dev/ttyUSB0

## Com port speed
COM_SPEED	= 230400

## Configure flash parameters (for ESP12-E and other new boards):
#SPI_MODE = dio

## SPIFFS options
# DISABLE_SPIFFS = 1
SPIFF_FILES = web/build

flash2:
	$(vecho) "Killing Terminal to free $(COM_PORT)"
	-$(Q) $(KILL_TERM)
	$(ESPTOOL) -p $(COM_PORT) -b $(COM_SPEED_ESPTOOL) write_flash $(flashimageoptions) $(basename $(IMAGE_MAIN)) $(FW_BASE)/$(IMAGE_MAIN) $(IMAGE_SDK_OFFSET) $(FW_BASE)/$(IMAGE_SDK)
