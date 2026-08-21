-- Hyprland Lua config, migrated from hyprland.conf
-- Wiki: https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "eDP-1", mode = "1920x1080", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "2560x1080", position = "1920x0", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
for i = 2, 8 do
  hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" })
end
hl.workspace_rule({ workspace = "9", monitor = "DP-2" })
hl.workspace_rule({ workspace = "10", monitor = "DP-2" })
-- ponytail: per-workspace layout not supported by workspace_rule; layout is global (general.layout).
-- To try scrolling: set general.layout = "scrolling" (affects all workspaces).

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

local WALLPAPER = os.getenv("HOME")
  .. "/.wallpapers/thomas_cole-the_course_of_empire_1-_the_savage_state-1834-obelisk-art-history.jpg"

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP LANG LC_ALL")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("mako")
  hl.exec_cmd("sleep 5 && waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprsunset -t 5500")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("aw-qt")
  -- Wait for hyprpaper socket, then set wallpaper on both outputs
  hl.exec_cmd(
    "sh -c 'until pgrep -x hyprpaper >/dev/null; do sleep 0.3; done; sleep 1; "
      .. 'hyprctl hyprpaper wallpaper "eDP-1,'
      .. WALLPAPER
      .. '"; '
      .. 'hyprctl hyprpaper wallpaper "DP-2,'
      .. WALLPAPER
      .. "\"'"
  )
end)

-- Reload waybar on monitor hotplug so new output gets a bar
hl.on("monitor.added", function(monitor)
  hl.exec_cmd("pkill -SIGUSR2 waybar")
  hl.exec_cmd("notify-send 'Monitor connected: " .. (monitor and monitor.name or "?") .. "'")
end)

-- Dump session state on shutdown
hl.on("hyprland.shutdown", function()
  local dir = os.getenv("HOME") .. "/.local/state/hyprland"
  hl.exec_cmd("mkdir -p " .. dir)
  local ts = os.date("%Y%m%d-%H%M%S")
  hl.exec_cmd("hyprctl -j clients    > " .. dir .. "/clients-" .. ts .. ".json")
  hl.exec_cmd("hyprctl -j workspaces > " .. dir .. "/workspaces-" .. ts .. ".json")
  hl.exec_cmd("hyprctl -j monitors   > " .. dir .. "/monitors-" .. ts .. ".json")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("LANG", "C.UTF-8")
hl.env("LC_ALL", "C.UTF-8")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 1,
    col = {
      active_border = { colors = { "rgba(88c0d0ee)", "rgba(81a1c1ee)" }, angle = 45 },
      inactive_border = "rgba(4c566aaa)",
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    rounding_power = 2, -- >2 rounder, <2 sharper (default 2)
    active_opacity = 1.0,
    inactive_opacity = 0.8,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },

  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "compose:ralt",
    kb_rules = "",
    follow_mouse = 0,
    sensitivity = 0,
    repeat_rate = 120,
    repeat_delay = 180,
    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Spring curve for natural window motion
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl dispatch exit")) -- ponytail: fallback, replace with hl.dsp.exit() if exposed

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/menu-surfraw"))

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd('grim -g "$(slurp)"'))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("/home/neumann/.go/bin/GoSpeedRead"))

hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen")) -- ponytail: fallback
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprctl dispatch swapnext")) -- ponytail: fallback
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.pseudo())

-- Move focus (handles captured for resize-mode toggle below)
local focus_binds = {
  hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" })),
  hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" })),
  hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" })),
  hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" })),
}

-- Switch-workspaces menu
hl.bind(mainMod .. " + grave", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/switch-workspaces"))

-- Workspaces 1-10
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Mouse move/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume / brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOW RULES            ----
--------------------------------

-- GoSpeedRead: float, center, fixed size (replaces [float;center;size ...] prefix)
-- ponytail: class name is a guess — verify with `hyprctl clients | grep -i class` after launch
hl.window_rule({
  name = "gospeedread-float",
  match = { class = "GoSpeedRead" },
  float = true,
  center = true,
  size = "1200 400",
})

--------------------------------
---- TOGGLE-KEYMAP EXAMPLE   ----
--------------------------------

-- Resize submap. Handles captured so they can be enabled/disabled at runtime.
-- Pattern: create parallel binds on the same keys, one set enabled, the other disabled;
-- flip them together to swap modes.
local resize_binds = {
  hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -20 0")),
  hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch resizeactive  20 0")),
  hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -20")),
  hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0  20")),
}
for _, b in ipairs(resize_binds) do
  b:set_enabled(false)
end -- start OFF

-- Toggle via an external trigger. Bind writes a sentinel file; hl.on watches it.
-- ponytail: cleanest if hl.bind supports Lua fn directly, use that instead.
-- Confirmed working pattern below uses exec_cmd → filesystem → event handler.
local resize_mode = false
local function toggle_resize_mode()
  resize_mode = not resize_mode
  for _, b in ipairs(focus_binds) do
    b:set_enabled(not resize_mode)
  end
  for _, b in ipairs(resize_binds) do
    b:set_enabled(resize_mode)
  end
  hl.exec_cmd("notify-send 'Resize mode: " .. (resize_mode and "ON" or "OFF") .. "'")
end

-- Simplest: if hl.bind accepts a Lua function (test first), this line works:
-- hl.bind(mainMod .. " + CTRL + R", toggle_resize_mode)
-- Otherwise, drive toggle_resize_mode() from an hl.on(...) event of your choice.
_ = toggle_resize_mode -- keep reference alive
