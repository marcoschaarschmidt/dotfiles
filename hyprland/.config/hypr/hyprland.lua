-------------------
---- MONITORS ----
-------------------

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@300",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

--------------------
---- MY PROGRAMS ----
--------------------

local terminal = "terminator"
local fileManager = "thunar"
-- local menu     = "wofi --show drun --allow-images"
local menu = "vicinae toggle"
local screenshot = "hyprshot-gui"

-------------------
---- AUTOSTART ----
-------------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	-- hl.exec_cmd(terminal)
	-- hl.exec_cmd("nm-applet &")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("copyq --start-server")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("udiskie --no-tray &")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("dropbox")
	hl.exec_cmd("discord --start-minimized")
	hl.exec_cmd("lact daemon")
	hl.exec_cmd("obsidian --ozone-platform=wayland --hidden")

	hl.exec_cmd("USE_LAYER_SHELL=0 vicinae server")
end)

-------------------------------
---- Vicinae Configuration ----
-------------------------------

-- Blur for vicinae
hl.layer_rule({
	name = "vicinae-blur",
	match = { namespace = "vicinae" },
	blur = true,
})

-- Original: `layerrule = ignore_alpha 0, match:namespace 0, match:namespace vicinae`
-- The duplicate "match:namespace 0" was not a valid value; assuming only the
-- ignore_alpha threshold (0) was intended for the vicinae layer.
hl.layer_rule({
	name = "vicinae-ignore-alpha",
	match = { namespace = "vicinae" },
	ignore_alpha = 0,
})

-- Original: `ilayerrule = noanim,1,match:namesapce vicinae`
-- "ilayerrule" does not exist (typo for "layerrule"), "namesapce" for "namespace".
-- Assuming the intent was to disable the fade animation for the vicinae layer.
hl.layer_rule({
	name = "vicinae-no-anim",
	match = { namespace = "vicinae" },
	no_anim = true,
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")

-----------------------
----- PERMISSIONS -----
-----------------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,

		col = {
			active_border = { colors = { "rgba(ffffffee)", "rgba(FF8000ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a, -- was: rgba(1a1a1aee)
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
})

-- Bezier curves, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
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

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only" -- uncomment if needed
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ name = "no-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- hl.window_rule({ name = "no-gaps-f1",   match = { float = false, workspace = "f[1]" },   border_size = 0, rounding = 0 })

-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
	dwindle = {
		-- pseudotile = true, -- master switch for pseudotiling, bound to mainMod + P below
		preserve_split = true,
	},
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

----------------
---- MISC ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
		disable_splash_rendering = true,
		on_focus_under_fullscreen = false,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "de",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 0,
		follow_mouse_threshold = 600.0,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
		numlock_by_default = true,
	},
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.config({ gestures = { workspace_swipe = false } })
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- sets the "Windows" key as main modifier

hl.bind("print", hl.dsp.exec_cmd(screenshot))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.window.close())
hl.bind("ALT + F4", hl.dsp.window.close())

-- hl.dsp.exit() quits Hyprland hard. If using uwsm, the wiki recommends
-- hl.dsp.exec_cmd("uwsm stop") instead.
hl.bind(mainMod .. " + M", hl.dsp.exit())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + CONTROL + F", hl.dsp.window.fullscreen({ mode = 0 }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll wheel
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume and brightness (laptop)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
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
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Original: `windowrule = suppress_event on, fullscreen off, maximize off, match:class .*`
-- The comment above ("Ignore maximize requests") implies only maximize events should be
-- suppressed. Check the wiki (Window-Rules) whether "suppress_event" accepts multiple
-- values if you also want to suppress fullscreen.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fixes drag issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Plugins / Configs
if hl.plugin.csgo_vulkan_fix ~= nil then
	hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "SDL Application", w = 1680, h = 1050 })
end

hl.config({
	plugin = {
		csgo_vulkan_fix = {
			fix_mouse = true,
		},
	},
})
