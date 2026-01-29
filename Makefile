VERILATOR_ROOT ?= /usr/share/verilator

WORKING_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
RTL_DIR := $(WORKING_DIR)/rtl
BUILD_DIR := $(WORKING_DIR)/build

DEPS := $(shell find $(BUILD_DIR) -name '*.d' 2>/dev/null)
-include $(DEPS)

VERILATOR ?= $(shell which verilator 2>/dev/null)
VERILATOR_FLAGS := --MMD --MP --stats -Wall -Wpedantic
VERILATOR_FLAGS += -Mdir $(BUILD_DIR)

MKDIR ?= mkdir
MKDIR_FLAGS := -p

ECHO ?= echo

NAME := cpu_2601
TOP := $(RTL_DIR)/$(NAME).sv
VERILATOR_FLAGS += -I$(RTL_DIR) --cc $(TOP) --prefix $(NAME)_

TARGET := V$(NAME)

all: $(TARGET)

$(TARGET): $(BUILD_DIR)
	@$(ECHO) " VERILATING $(TOP)"
	@$(VERILATOR) $(VERILATOR_FLAGS)

$(BUILD_DIR):
	@$(ECHO) " MKDIR $@"
	@$(MKDIR) $(MKDIR_FLAGS) $@

