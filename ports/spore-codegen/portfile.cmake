vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO sporacid/spore-codegen
  REF fccb5246eb04fb4f0bbf2ea746e6d58d96f50a47
  SHA512 e86773b038910aa2de9d8fd26b65951ad9f8001d1f691c839d5229c318ff247698439739222278a80f52d7e27c0f00b0539a6010dd26446e81f5e61615a34e55
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup()