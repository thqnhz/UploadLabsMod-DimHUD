extends Node


const MOD_DIR := "ThqnhZ-DimHUD"
const LOG_NAME := "ThqnhZ-DimHUD:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
    mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
    # Add extensions
    install_script_extensions()
    install_script_hook_files()

    # Add translations
    add_translations()


func install_script_extensions() -> void:
    extensions_dir_path = mod_dir_path.path_join("extensions")
    ModLoaderMod.install_script_extension(extensions_dir_path.path_join("scripts/hud.gd"))


func install_script_hook_files() -> void:
    extensions_dir_path = mod_dir_path.path_join("extensions")


func add_translations() -> void:
    translations_dir_path = mod_dir_path.path_join("translations")


func _ready() -> void:
    pass
