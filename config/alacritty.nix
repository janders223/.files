{ zsh }:''
# Configuration for Alacritty, the GPU enhanced terminal emulator.

# Any items in the `env` entry below will be added as
# environment variables. Some entries may override variables
# set by alacritty itself.

env:
  # TERM variable
  #
  # This value is used to set the `$TERM` environment variable for
  # each instance of Alacritty. If it is not present, alacritty will
  # check the local terminfo database and use `alacritty` if it is
  # available, otherwise `xterm-256color` is used.
  TERM: xterm-256color

window:
  # Window dimensions (changes require restart)
  #
  # Specified in number of columns/lines, not pixels.
  # If both are `0`, this setting is ignored.
  dimensions:
    columns: 0
    lines: 0

  # Window position (changes require restart)
  #
  # Specified in number of pixels.
  # If the position is not set, the window manager will handle the placement.
  #position:
  #  x: 0
  #  y: 0

  # Window padding (changes require restart)
  #
  # Blank space added around the window in pixels. This padding is scaled
  # by DPI and the specified value is always added at both opposing sides.
  padding:
    x: 0
    y: 0

  # Spread additional padding evenly around the terminal content.
  dynamic_padding: false

  # Window decorations
  #
  # Values for `decorations`:
  #     - full: Borders and title bar
  #     - none: Neither borders nor title bar
  #
  # Values for `decorations` (macOS only):
  #     - transparent: Title bar, transparent background and title bar buttons
  #     - buttonless: Title bar, transparent background, but no title bar buttons
  decorations: full

  # Startup Mode (changes require restart)
  #
  # Values for `startup_mode`:
  #   - Windowed
  #   - Maximized
  #   - Fullscreen
  #
  # Values for `startup_mode` (macOS only):
  #   - SimpleFullscreen
  # startup_mode: Fullscreen

  # Window title
  #title: Alacritty

  # Window class (Linux only):
  #class: Alacritty

scrolling:
  # Maximum number of lines in the scrollback buffer.
  # Specifying '0' will disable scrolling.
  history: 10000

  # Number of lines the viewport will move for every line scrolled when
  # scrollback is enabled (history > 0).
  multiplier: 3

  # Faux Scrolling
  #
  # The `faux_multiplier` setting controls the number of lines the terminal
  # should scroll when the alternate screen buffer is active. This is used
  # to allow mouse scrolling for applications like `man`.
  #
  # Specifying `0` will disable faux scrolling.
  faux_multiplier: 3

  # Scroll to the bottom when new text is written to the terminal.
  auto_scroll: false

# Spaces per Tab (changes require restart)
#
# This setting defines the width of a tab in cells.
#
# Some applications, like Emacs, rely on knowing about the width of a tab.
# To prevent unexpected behavior in these applications, it's also required to
# change the `it` value in terminfo when altering this setting.
tabspaces: 8

# Font configuration (changes require restart)
font:
  # Normal (roman) font face
  normal:
    # Font family
    #
    # Default:
    #   - (macOS) Menlo
    #   - (Linux) monospace
    #   - (Windows) Consolas
    family: Fira Code

    # The `style` can be specified to pick a specific face.
    style: Retina

  # Bold font face
  bold:
    # Font family
    #
    # If the bold family is not specified, it will fall back to the
    # value specified for the normal font.
    family: Fira Code

    # The `style` can be specified to pick a specific face.
    style: Bold

  # Italic font face
  italic:
    # Font family
    #
    # If the italic family is not specified, it will fall back to the
    # value specified for the normal font.
    family: menlo

    # The `style` can be specified to pick a specific face.
    style: Italic

  # Point size
  size: 18.0

  # Offset is the extra space around each character. `offset.y` can be thought of
  # as modifying the line spacing, and `offset.x` as modifying the letter spacing.
  offset:
    x: 0
    y: 0

  # Glyph offset determines the locations of the glyphs within their cells with
  # the default being at the bottom. Increasing `x` moves the glyph to the right,
  # increasing `y` moves the glyph upwards.
  glyph_offset:
    x: 0
    y: 0

  # Thin stroke font rendering (macOS only)
  #
  # Thin strokes are suitable for retina displays, but for non-retina screens
  # it is recommended to set `use_thin_strokes` to `false`
  #
  # macOS >= 10.14.x:
  #
  # If the font quality on non-retina display looks bad then set
  # `use_thin_strokes` to `true` and enable font smoothing by running the
  # following command:
  #   `defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO`
  #
  # This is a global setting and will require a log out or restart to take
  # effect.
  use_thin_strokes: true

# If `true`, bold text is drawn using the bright color variants.
draw_bold_text_with_bright_colors: true

colors:
  primary:
    background: '0x2E3440'
    foreground: '0xD8DEE9'
  cursor:
    text: '0x2E3440'
    cursor: '0xD8DEE9'
  normal:
    black: '0x3B4252'
    red: '0xBF616A'
    green: '0xA3BE8C'
    yellow: '0xEBCB8B'
    blue: '0x81A1C1'
    magenta: '0xB48EAD'
    cyan: '0x88C0D0'
    white: '0xE5E9F0'
  bright:
    black: '0x4C566A'
    red: '0xBF616A'
    green: '0xA3BE8C'
    yellow: '0xEBCB8B'
    blue: '0x81A1C1'
    magenta: '0xB48EAD'
    cyan: '0x8FBCBB'
    white: '0xECEFF4'

# Visual Bell
#
# Any time the BEL code is received, Alacritty "rings" the visual bell. Once
# rung, the terminal background will be set to white and transition back to the
# default background color. You can control the rate of this transition by
# setting the `duration` property (represented in milliseconds). You can also
# configure the transition function by setting the `animation` property.
#
# Values for `animation`:
#   - Ease
#   - EaseOut
#   - EaseOutSine
#   - EaseOutQuad
#   - EaseOutCubic
#   - EaseOutQuart
#   - EaseOutQuint
#   - EaseOutExpo
#   - EaseOutCirc
#   - Linear
#
# Specifying a `duration` of `0` will disable the visual bell.
visual_bell:
  animation: EaseOutExpo
  duration: 0
  color: '0xffffff'

# Background opacity
#
# Window opacity as a floating point number from `0.0` to `1.0`.
# The value `0.0` is completely transparent and `1.0` is opaque.
background_opacity: 1.0

# Mouse bindings
#
# Available fields:
#   - mouse
#   - action
#   - mods (optional)
#
# Values for `mouse`:
#   - Middle
#   - Left
#   - Right
#   - Numeric identifier such as `5`
#
# All available `mods` and `action` values are documented in the key binding
# section.
mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  # If this is `true`, the cursor is temporarily hidden when typing.
  hide_when_typing: true

  url:
    # URL launcher
    #
    # This program is executed when clicking on a text which is recognized as a URL.
    # The URL is always added to the command as the last parameter.
    #
    # When set to `None`, URL launching will be disabled completely.
    #
    # Default:
    #   - (macOS) open
    #   - (Linux) xdg-open
    #   - (Windows) explorer
    launcher:
      program: open
    #  args: []

    # URL modifiers
    #
    # These are the modifiers that need to be held down for opening URLs when clicking
    # on them. The available modifiers are documented in the key binding section.
    modifiers: None

selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>"

  # When set to `true`, selected text will be copied to the primary clipboard.
  save_to_clipboard: false

# Allow terminal applications to change Alacritty's window title.
dynamic_title: true

cursor:
  # Cursor style
  #
  # Values for `style`:
  #   - ▇ Block
  #   - _ Underline
  #   - | Beam
  style: Block

  # If this is `true`, the cursor will be rendered as a hollow box when the
  # window is not focused.
  unfocused_hollow: true

# Live config reload (changes require restart)
live_config_reload: true

# Shell
#
# You can set `shell.program` to the path of your favorite shell, e.g. `/bin/fish`.
# Entries in `shell.args` are passed unmodified as arguments to the shell.
#
# Default:
#   - (macOS) /bin/bash --login
#   - (Linux) user login shell
#   - (Windows) powershell
shell:
  program: ${zsh}/bin/zsh
  args:
    - --login

# Startup directory
#
# Directory the shell is started in. If this is unset, or `None`, the working
# directory of the parent process will be used.
working_directory: None

# Windows 10 ConPTY backend (Windows only)
#
# This will enable better color support and may resolve other issues,
# however this API and its implementation is still young and so is
# disabled by default, as stability may not be as good as the winpty
# backend.
#
# Alacritty will fall back to the WinPTY automatically if the ConPTY
# backend cannot be initialized.
enable_experimental_conpty_backend: false

# Send ESC (\x1b) before characters when alt is pressed.
alt_send_esc: true

debug:
  # Display the time it takes to redraw each frame.
  render_timer: false

  # Keep the log file after quitting Alacritty.
  persistent_logging: false

  # Log level
  #
  # Values for `log_level`:
  #   - None
  #   - Error
  #   - Warn
  #   - Info
  #   - Debug
  #   - Trace
  log_level: Warn

  # Print all received window events.
  print_events: false

  # Record all characters and escape sequences as test data.
  ref_test: false

# Key bindings
#
# Key bindings are specified as a list of objects. Each binding will specify a
# key and modifiers required to trigger it, terminal modes where the binding is
# applicable, and what should be done when the key binding fires. It can either
# send a byte sequence to the running application (`chars`), execute a
# predefined action (`action`) or fork and execute a specified command plus
# arguments (`command`).
#
# Bindings are always filled by default, but will be replaced when a new binding
# with the same triggers is defined. To unset a default binding, it can be
# mapped to the `None` action.
#
# Example:
#   `- { key: V, mods: Control|Shift, action: Paste }`
#
# Available fields:
#   - key
#   - mods (optional)
#   - chars | action | command (exactly one required)
#   - mode (optional)
#
# Values for `key`:
#   - `A` -> `Z`
#   - `F1` -> `F12`
#   - `Key1` -> `Key0`
#
#   A full list with available key codes can be found here:
#   https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
#
#   Instead of using the name of the keys, the `key` field also supports using
#   the scancode of the desired key. Scancodes have to be specified as a
#   decimal number.
#   This command will allow you to display the hex scancodes for certain keys:
#     `showkey --scancodes`
#
# Values for `mods`:
#   - Command
#   - Control
#   - Option
#   - Super
#   - Shift
#   - Alt
#
#   Multiple `mods` can be combined using `|` like this: `mods: Control|Shift`.
#   Whitespace and capitalization is relevant and must match the example.
#
# Values for `chars`:
#   The `chars` field writes the specified string to the terminal. This makes
#   it possible to pass escape sequences.
#   To find escape codes for bindings like `PageUp` ("\x1b[5~"), you can run
#   the command `showkey -a` outside of tmux.
#   Note that applications use terminfo to map escape sequences back to
#   keys. It is therefore required to update the terminfo when
#   changing an escape sequence.
#
# Values for `action`:
#   - Paste
#   - PasteSelection
#   - Copy
#   - IncreaseFontSize
#   - DecreaseFontSize
#   - ResetFontSize
#   - ScrollPageUp
#   - ScrollPageDown
#   - ScrollLineUp
#   - ScrollLineDown
#   - ScrollToTop
#   - ScrollToBottom
#   - ClearHistory
#   - Hide
#   - Quit
#   - ClearLogNotice
#   - SpawnNewInstance
#   - ToggleFullscreen
#   - None
#
# Values for `action` (macOS only):
#   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
#
# Values for `command`:
#   The `command` field must be a map containing a `program` string and
#   an `args` array of command line parameter strings.
#
#   Example:
#       `command: { program: "alacritty", args: ["-e", "vttest"] }`
#
# Values for `mode`:
#   - ~AppCursor
#   - AppCursor
#   - ~AppKeypad
#   - AppKeypad

key_bindings:
  - { key: P,     mods: Control,       chars: "\x1b\x5b\x41" }
  # - { key: N,     mods: Control,       chars: "\x1b\x5b\x42" }
  - { key: D,     mods: Command|Shift, chars: "\x01\x73" }
  - { key: W,     mods: Command,       chars: "\x01\x78" }
  - { key: L,        mods: Control, chars: "\x0c"          }
  - { key: D,       mods: Command, chars: "\x01\x76"             }
  - { key: T,     mods: Command,       chars: "\x01\x63" }
  - { key: N,     mods: Command,       chars: "\x01\x6e" }
  - { key: Key1,  mods: Command,       chars: "\x01\x31" }
  - { key: Key2,  mods: Command,       chars: "\x01\x32" }
  - { key: Key3,  mods: Command,       chars: "\x01\x33" }
  - { key: Key4,  mods: Command,       chars: "\x01\x34" }
  - { key: Key5,  mods: Command,       chars: "\x01\x35" }
  - { key: Key6,  mods: Command,       chars: "\x01\x36" }
  - { key: Key7,  mods: Command,       chars: "\x01\x37" }
  - { key: Key8,  mods: Command,       chars: "\x01\x38" }
  - { key: Key9,  mods: Command,       chars: "\x01\x39" }
  - { key: Left,  mods: Command,       chars: "\x01\x48" }
  - { key: Down,  mods: Command,       chars: "\x01\x4a" }
  - { key: Up,    mods: Command,       chars: "\x01\x4b" }
  - { key: Right, mods: Command,       chars: "\x01\x4c" }
''
