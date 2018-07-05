TOP_DIR = $(shell pwd)

MKDIR := mkdir -m755 -p

BIN_DIR := ./bin
OBJ_DIR := ./obj
SRC_DIR := ./src

ADA_SUBS := ada-a ada-b

C_SUB       := c
C_SRC_FILES := $(wildcard $(SRC_DIR)/$(C_SUB)/*.c)
C_OBJ_FILES := $(patsubst $(SRC_DIR)/$(C_SUB)/%.c, \
                          $(OBJ_DIR)/$(C_SUB)/%.o, \
                          $(C_SRC_FILES))

CPP_SUB       := cpp
CPP_SRC_FILES := $(wildcard $(SRC_DIR)/$(CPP_SUB)/*.cpp)
CPP_OBJ_FILES := $(patsubst $(SRC_DIR)/$(CPP_SUB)/%.cpp, \
                            $(OBJ_DIR)/$(CPP_SUB)/%.o,   \
                            $(CPP_SRC_FILES))

# Complex directory accounting needed to keep GNAT tools happy,
#    and OBJ & BIN directories logically organized
all: $(ADA_SUBS) $(C_OBJ_FILES) $(CPP_OBJ_FILES)
	cd $(TOP_DIR)/$(OBJ_DIR);                         \
		gcc-4.6 -c $(TOP_DIR)/$(SRC_DIR)/main.adb \
		$(foreach subd, $(ADA_SUBS),              \
		  -I$(TOP_DIR)/$(SRC_DIR)/$(subd))
	cd $(TOP_DIR)/$(OBJ_DIR);                        \
		gnatbind -x main.ali                     \
		$(foreach subd, $(ADA_SUBS),             \
		  $(TOP_DIR)/$(OBJ_DIR)/$(subd)/*.ali)
	$(MKDIR) $(BIN_DIR)
	cd $(TOP_DIR)/$(OBJ_DIR);                        \
		gnatlink main.ali                        \
		$(TOP_DIR)/$(OBJ_DIR)/$(C_SUB)/*.o       \
		$(TOP_DIR)/$(OBJ_DIR)/$(CPP_SUB)/*.o     \
		-o $(TOP_DIR)/$(BIN_DIR)/main            \
		--LINK=g++

clean:
	$(RM) -rf $(BIN_DIR) $(OBJ_DIR)

# See GNU Make Multiple Targets in a Rule, here:
#    gnu.org/software/make/manual/html_node/Multiple-Targets.html
$(ADA_SUBS):
	$(MKDIR) $(OBJ_DIR)/$@
	gnatmake -c -D $(OBJ_DIR)/$@ $(SRC_DIR)/$@/*.adb
	cd $(TOP_DIR)/$(OBJ_DIR)/$@; gnatbind -n *.ali

$(OBJ_DIR)/$(C_SUB)/%.o: $(SRC_DIR)/$(C_SUB)/%.c
	$(MKDIR) $(OBJ_DIR)/$(C_SUB)
	gcc -c -o $@ $<

$(OBJ_DIR)/$(CPP_SUB)/%.o: $(SRC_DIR)/$(CPP_SUB)/%.cpp
	$(MKDIR) $(OBJ_DIR)/$(CPP_SUB)
	g++ -c -o $@ $<
