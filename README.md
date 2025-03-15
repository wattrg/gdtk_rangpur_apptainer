# Rangpur apptainer for gdtk

## Install
1. Clone the repository to your home directory.
```
git clone git@github.com:wattrg/gdtk_rangpur_apptainer.git
```

2. Load the mpi module on rangpur
```
module load mpi
```

3. Build the container (this will take ~30 minutes)
```
cd gdtk_rangpur_apptainer
make build
```

4. Set environment variables using the provided module file
```
module use --append build/share
module load gdtk/container
```

Some bash scripts are provided in `build/bin` which mimic lmr's cli (these are added to path by the module), but instead of launching lmr directly, they launch the container and run the corresponding lmr command.

The gdtk version inside the container can be updated with
```
lmr-update
```

## Testing GDTK
To run the tests, clone the `gdtk` somewhere on rangpur, and make sure `DGD_REPO` points to it.
Some of the tests copy data files from here, so it needs to be present outside the container.
