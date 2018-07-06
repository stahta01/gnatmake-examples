MKDIR := mkdir -m755 -p

BIN_DIR := bin
OBJ_DIR := obj
SRC_DIR := src

MAIN     := main
ADA_WRAP := ada-wrapper
# The following path was discovered using `dpkg-query --listfiles libgnat-4.6` on Travis
LIBGNAT  := /usr/lib/x86_64-linux-gnu

ADA_SUBS := ada-a ada-b

C_SUB       := c
C_SRC_FILES := $(wildcard $(SRC_DIR)/$(C_SUB)/*.c)
C_OBJ_FILES := $(patsubst $(SRC_DIR)/$(C_SUB)/%.c, \
                          $(OBJ_DIR)/$(C_SUB)/%.o, \
                          $(C_SRC_FILES))

CPP_SUB       := cpp
CPP_SRC_FILES := $(wildcard $(SRC_DIR)/$(CPP_SUB)/*.cpp)
CPP_OBJ_FILES := $(patsubst $(SRC_DIR)/$(CPP_SUB)/%.cpp, \
                            $(OBJ_DIR)/$(CPP_SUB)/%.o, \
                            $(CPP_SRC_FILES))

# Excellent SO answer guided this portion:
#    stackoverflow.com/a/40873379
all: $(ADA_SUBS) $(C_OBJ_FILES) $(CPP_OBJ_FILES)
	g++ -c -o $(OBJ_DIR)/$(MAIN).o $(SRC_DIR)/$(MAIN).cpp \
		-I$(SRC_DIR)/$(C_SUB) \
		-I$(SRC_DIR)/$(CPP_SUB)
	cd $(OBJ_DIR); \
		gnatbind -Lada \
		$(foreach subd, $(ADA_SUBS), $(subd)/*.ali) \
		-o $(ADA_WRAP).adb
	cd $(OBJ_DIR); \
		gcc-4.6 -c $(ADA_WRAP).adb
	cd $(OBJ_DIR); \
		ar cr $(ADA_WRAP).a $(ADA_WRAP).o \
		$(foreach subd, $(ADA_SUBS), $(subd)/*.o)
	$(MKDIR) $(BIN_DIR)
	cd $(OBJ_DIR); \
		g++ -o ../$(BIN_DIR)/$(MAIN) \
		$(MAIN).o $(ADA_WRAP).a \
		$(C_SUB)/*.o $(CPP_SUB)/*.o \
		-L$(LIBGNAT) -lgnat-4.6

clean:
	$(RM) -rf $(BIN_DIR) $(OBJ_DIR)

# See GNU Make Multiple Targets in a Rule, here:
#    gnu.org/software/make/manual/html_node/Multiple-Targets.html
$(ADA_SUBS):
	$(MKDIR) $(OBJ_DIR)/$@
	gnatmake -c -D $(OBJ_DIR)/$@ $(SRC_DIR)/$@/*.adb
	cd $(OBJ_DIR)/$@; gnatbind -n *.ali

$(OBJ_DIR)/$(C_SUB)/%.o: $(SRC_DIR)/$(C_SUB)/%.c
	$(MKDIR) $(OBJ_DIR)/$(C_SUB)
	g++ -c -o $@ $<

$(OBJ_DIR)/$(CPP_SUB)/%.o: $(SRC_DIR)/$(CPP_SUB)/%.cpp
	$(MKDIR) $(OBJ_DIR)/$(CPP_SUB)
	g++ -c -o $@ $<
