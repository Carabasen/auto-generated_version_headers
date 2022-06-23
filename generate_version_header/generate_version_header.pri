!build_pass:prebuild.commands = call $$system_quote($$system_path($$VHDR_GEN_SCRIPT_PATH\generate_version_header.cmd)) $$system_quote($$system_path($$VHDR_PATH_NAME))
!build_pass:first.depends = prebuild
QMAKE_EXTRA_TARGETS += prebuild first
