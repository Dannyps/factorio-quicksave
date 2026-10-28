data:extend({
  {
    type = "string-setting",
    name = "quicksave-save-name",
    setting_type = "runtime-global",
    default_value = "",
    allow_blank = true,
    order = "a"
  }
})

data:extend({
  {
    type = "bool-setting",
    name = "quicksave-unlimited",
    setting_type = "runtime-global",
    default_value = false,
    order = "c"
  }
})

data:extend({
  {
    type = "int-setting",
    name = "quicksave-max-saves",
    setting_type = "runtime-global",
    default_value = 3,
    minimum_value = 1,
    order = "f"
  }
})
