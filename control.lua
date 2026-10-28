-- Take over the counter when replacing the original Quicksave mod
local function adopt_migrated()
  local migrated = storage._migrated and storage._migrated["Quicksave"]
  if migrated and migrated.quicksave_number then
    storage.quicksave_number=migrated.quicksave_number
    storage._migrated["Quicksave"]=nil
  end
end

script.on_init(
  function()
    storage.quicksave_number=0
    adopt_migrated()
  end
)

script.on_configuration_changed(adopt_migrated)

script.on_event("quicksave-hotkey-save",
  function(e)
    if game.is_multiplayer() and not game.players[e.player_index].admin then
      return
    end
    storage.quicksave_number = storage.quicksave_number+1
    if not settings.global["quicksave-unlimited"].value and
      storage.quicksave_number > settings.global["quicksave-max-saves"].value then
        storage.quicksave_number=1
    end
    local session_name = settings.global["quicksave-save-name"].value
    local quicksave_name = "quick"..storage.quicksave_number
    if session_name ~= "" then
      quicksave_name = "quick-"..session_name..storage.quicksave_number
    end
    game.auto_save(quicksave_name)
  end
)
