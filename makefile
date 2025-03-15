BUILD_DIR := build

.PHONY:
build: $(BUILD_DIR)/gdtk_ldc-1.40.0.sif $(BUILD_DIR)/overlay $(BUILD_DIR)/bin

$(BUILD_DIR)/gdtk_ldc-1.40.0.sif: src/gdtk.def src/update src/compile-install
	mkdir -p $(BUILD_DIR)
	apptainer build --bind $(MPI_INCLUDE):/usr/host/include/openmpi-x86_64 --bind $(MPI_HOME):/usr/lib64/openmpi --bind /usr/lib64:/usr/host/all $(BUILD_DIR)/gdtk_ldc-1.40.0.sif src/gdtk.def

$(BUILD_DIR)/overlay: 
	mkdir $(BUILD_DIR)/overlay

$(BUILD_DIR)/bin:
	cp -r bin $(BUILD_DIR)

.PHONY:
clean:
	- rm -r $(BUILD_DIR)
