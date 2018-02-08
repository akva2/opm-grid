# -*- mode: cmake; tab-width: 2; indent-tabs-mode: t; truncate-lines: t; compile-command: "cmake -Wdev" -*-
# vim: set filetype=cmake autoindent tabstop=2 shiftwidth=2 noexpandtab softtabstop=2 nowrap:

# This file sets up six lists:
# MAIN_SOURCE_FILES     List of compilation units which will be included in
#                       the library. If it isn't on this list, it won't be
#                       part of the library. Please try to keep it sorted to
#                       maintain sanity.
#
# TEST_SOURCE_FILES     List of programs that will be run as unit tests.
#
# TEST_DATA_FILES       Files from the source three that should be made
#                       available in the corresponding location in the build
#                       tree in order to run tests there.
#
# EXAMPLE_SOURCE_FILES  Other programs that will be compiled as part of the
#                       build, but which is not part of the library nor is
#                       run as tests.
#
# PUBLIC_HEADER_FILES   List of public header files that should be
#                       distributed together with the library. The source
#                       files can of course include other files than these;
#                       you should only add to this list if the *user* of
#                       the library needs it.
#
# ATTIC_FILES           Unmaintained files. This for the projects developers
#                       only. Don't expect these files to build.

# originally generated with the command:
# find dune -name '*.c*' -printf '\t%p\n' | sort
list (APPEND MAIN_SOURCE_FILES
  dune/grid/cpgrid/Intersection.cpp
  dune/grid/cpgrid/CpGridData.cpp
  dune/grid/cpgrid/CpGrid.cpp
  dune/grid/cpgrid/GridHelpers.cpp
  dune/grid/cpgrid/PartitionTypeIndicator.cpp
  dune/grid/cpgrid/processEclipseFormat.cpp
  dune/grid/cpgrid/readSintefLegacyFormat.cpp
  dune/grid/cpgrid/writeSintefLegacyFormat.cpp
  dune/grid/common/GeometryHelpers.cpp
  dune/grid/common/GridPartitioning.cpp
  dune/grid/common/WellConnections.cpp
  dune/grid/common/ZoltanGraphFunctions.cpp
  dune/grid/common/ZoltanPartition.cpp
  opm/grid/GridHelpers.cpp
  opm/grid/GridManager.cpp
  opm/grid/GridUtilities.cpp
  opm/grid/cart_grid.c
  opm/grid/cornerpoint_grid.c
  opm/grid/cpgpreprocess/facetopology.c
  opm/grid/cpgpreprocess/geometry.c
  opm/grid/cpgpreprocess/preprocess.c
  opm/grid/cpgpreprocess/uniquepoints.c
  opm/grid/UnstructuredGrid.c
  opm/grid/grid_equal.cpp
  opm/core/pressure/tpfa/trans_tpfa.c
  opm/core/utility/compressedToCartesian.cpp
  opm/core/utility/VelocityInterpolation.cpp
  opm/core/utility/StopWatch.cpp
  opm/core/utility/WachspressCoord.cpp
  )

if(opm-parser_FOUND)
  list(APPEND MAIN_SOURCE_FILES opm/core/utility/extractPvtTableIndex.cpp)
endif()

# originally generated with the command:
# find tests/not-unit/ -name \*.cpp -o \*.cc
list (APPEND ATTIC_FILES
  attic/partition_test.cpp
# attic/dumux_test.cpp
  attic/mapper_test.cpp
  attic/buildcpgrid_test.cpp
# attic/cpgrid_test.cpp
  attic/check_grid_normals.cpp
  )

# originally generated with the command:
# find tests -name '*.cpp' -a ! -wholename '*/not-unit/*' -printf '\t%p\n' | sort
list (APPEND TEST_SOURCE_FILES
  tests/test_cartgrid.cpp
  tests/test_column_extract.cpp
  tests/cpgrid/distribution_test.cpp
  tests/cpgrid/entityrep_test.cpp
  tests/cpgrid/entity_test.cpp
  tests/cpgrid/facetag_test.cpp
  tests/cpgrid/geometry_test.cpp
  tests/cpgrid/orientedentitytable_test.cpp
  tests/cpgrid/partition_iterator_test.cpp
  tests/cpgrid/zoltan_test.cpp
  tests/test_geom2d.cpp
  tests/test_gridutilities.cpp
  tests/test_minpvprocessor.cpp
#	tests/grid_test.cc
  tests/p2pcommunicator_test.cc
  tests/test_regionmapping.cpp
  tests/test_repairzcorn.cpp
  tests/test_sparsetable.cpp
  tests/test_ug.cpp
  tests/test_quadratures.cpp
	)

if(opm-parser_FOUND)
  list(APPEND TEST_SOURCE_FILES tests/test_compressedpropertyaccess.cpp)
endif()

# originally generated with the command:
# find tests -name '*.xml' -a ! -wholename '*/not-unit/*' -printf '\t%p\n' | sort
list (APPEND TEST_DATA_FILES
     tests/CORNERPOINT_ACTNUM.DATA
     tests/compressed_gridproperty.data
  )

# originally generated with the command:
# find tutorials examples -name '*.c*' -printf '\t%p\n' | sort
list (APPEND EXAMPLE_SOURCE_FILES
  examples/grdecl2vtu.cpp
  examples/finitevolume/finitevolume.cc
  examples/mirror_grid.cpp
  )

# programs listed here will not only be compiled, but also marked for
# installation
list (APPEND PROGRAM_SOURCE_FILES
  examples/grdecl2vtu.cpp
  examples/mirror_grid.cpp
  )

# originally generated with the command:
# find dune -name '*.h*' -a ! -name '*-pch.hpp' -printf '\t%p\n' | sort
list (APPEND PUBLIC_HEADER_FILES
  dune/grid/common/GeometryHelpers.hpp
  dune/grid/common/GridAdapter.hpp
  dune/grid/common/GridPartitioning.hpp
  dune/grid/common/Volumes.hpp
  dune/grid/common/p2pcommunicator.hh
  dune/grid/common/p2pcommunicator_impl.hh
  dune/grid/cpgrid/CartesianIndexMapper.hpp
  dune/grid/cpgrid/CpGridData.hpp
  dune/grid/cpgrid/DefaultGeometryPolicy.hpp
  dune/grid/cpgrid/dgfparser.hh
  dune/grid/cpgrid/Entity2IndexDataHandle.hpp
  dune/grid/cpgrid/Entity.hpp
  dune/grid/cpgrid/EntityRep.hpp
  dune/grid/cpgrid/Geometry.hpp
  dune/grid/cpgrid/GlobalIdMapping.hpp
  dune/grid/cpgrid/GridHelpers.hpp
  dune/grid/CpGrid.hpp
  dune/grid/cpgrid/Indexsets.hpp
  dune/grid/cpgrid/Intersection.hpp
  dune/grid/cpgrid/Iterators.hpp
  dune/grid/cpgrid/OrientedEntityTable.hpp
  dune/grid/cpgrid/PartitionIteratorRule.hpp
  dune/grid/cpgrid/PartitionTypeIndicator.hpp
  dune/grid/cpgrid/PersistentContainer.hpp
  dune/grid/common/CartesianIndexMapper.hpp
  dune/grid/common/WellConnections.hpp
  dune/grid/common/ZoltanGraphFunctions.hpp
  dune/grid/common/ZoltanPartition.hpp
  dune/grid/polyhedralgrid/capabilities.hh
  dune/grid/polyhedralgrid/cartesianindexmapper.hh
  dune/grid/polyhedralgrid/declaration.hh
  dune/grid/polyhedralgrid/dgfparser.hh
  dune/grid/polyhedralgrid/entity.hh
  dune/grid/polyhedralgrid/entitypointer.hh
  dune/grid/polyhedralgrid/entityseed.hh
  dune/grid/polyhedralgrid/geometry.hh
  dune/grid/polyhedralgrid/gridhelpers.hh
  dune/grid/polyhedralgrid/grid.hh
  dune/grid/polyhedralgrid/gridview.hh
  dune/grid/polyhedralgrid.hh
  dune/grid/polyhedralgrid/idset.hh
  dune/grid/polyhedralgrid/indexset.hh
  dune/grid/polyhedralgrid/intersection.hh
  dune/grid/polyhedralgrid/intersectioniterator.hh
  dune/grid/polyhedralgrid/iterator.hh
  dune/grid/polyhedralgrid/persistentcontainer.hh
  opm/UnstructuredGrid.h
  opm/grid/CellQuadrature.hpp
  opm/grid/ColumnExtract.hpp
  opm/grid/FaceQuadrature.hpp
  opm/grid/GridHelpers.hpp
  opm/grid/GridManager.hpp
  opm/grid/GridUtilities.hpp
  opm/grid/MinpvProcessor.hpp
  opm/grid/PinchProcessor.hpp
  opm/grid/RepairZCORN.hpp
  opm/grid/cart_grid.h
  opm/grid/cornerpoint_grid.h
  opm/grid/cpgpreprocess/facetopology.h
  opm/grid/cpgpreprocess/geometry.h
  opm/grid/cpgpreprocess/preprocess.h
  opm/grid/cpgpreprocess/uniquepoints.h
  opm/core/pressure/tpfa/trans_tpfa.h
  opm/core/pressure/tpfa/TransTpfa.hpp
  opm/core/pressure/tpfa/TransTpfa_impl.hpp
  opm/core/utility/CompressedPropertyAccess.hpp
  opm/core/utility/compressedToCartesian.hpp
  opm/core/utility/extractPvtTableIndex.hpp
  opm/core/utility/RegionMapping.hpp
  opm/core/utility/SparseTable.hpp
  opm/core/utility/StopWatch.hpp
  opm/core/utility/VelocityInterpolation.hpp
  opm/core/utility/WachspressCoord.hpp
  opm/grid/utility/ErrorMacros.hpp
  opm/grid/utility/OpmParserIncludes.hpp
  opm/grid/utility/platform_dependent/disable_warnings.h
  opm/grid/utility/platform_dependent/reenable_warnings.h
  )
