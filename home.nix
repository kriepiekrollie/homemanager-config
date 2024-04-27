{ inputs, config, pkgs, ... }:
{

  imports = [ 
    inputs.ags.homeManagerModules.default 
    ./programs/programs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "benjamin";
  home.homeDirectory = "/home/benjamin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # ".config/hypr/hyprland.conf".source = 
    #   "${pkgs.hyprland}/hyprland.conf";
    # ".config/hypr/hyprpaper.conf".source = 
    #   "${pkgs.hyprpaper}/hyprpaper.conf";

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.sioyek = {
    enable = true;
  };

  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 800;
      height = 600;
      always_parse_args = true;
      show_all = false;
      term = "alacritty";
      hide_scroll = true;
      print_command = true;
      insensitive = true;
      prompt = "";
      columns = 2;
      allow_images = true;
      key_down = "Ctrl-j";
      key_up = "Ctrl-k";
      key_left = "Ctrl-h";
      key_right = "Ctrl-l";
      key_expand = "Ctrl-Tab";
    };
    style = ''
      @define-color	rosewater  #f5e0dc;
      @define-color	rosewater-rgb  rgb(245, 224, 220);
      @define-color	flamingo  #f2cdcd;
      @define-color	flamingo-rgb  rgb(242, 205, 205);
      @define-color	pink  #f5c2e7;
      @define-color	pink-rgb  rgb(245, 194, 231);
      @define-color	mauve  #cba6f7;
      @define-color	mauve-rgb  rgb(203, 166, 247);
      @define-color	red  #f38ba8;
      @define-color	red-rgb  rgb(243, 139, 168);
      @define-color	maroon  #eba0ac;
      @define-color	maroon-rgb  rgb(235, 160, 172);
      @define-color	peach  #fab387;
      @define-color	peach-rgb  rgb(250, 179, 135);
      @define-color	yellow  #f9e2af;
      @define-color	yellow-rgb  rgb(249, 226, 175);
      @define-color	green  #a6e3a1;
      @define-color	green-rgb  rgb(166, 227, 161);
      @define-color	teal  #94e2d5;
      @define-color	teal-rgb  rgb(148, 226, 213);
      @define-color	sky  #89dceb;
      @define-color	sky-rgb  rgb(137, 220, 235);
      @define-color	sapphire  #74c7ec;
      @define-color	sapphire-rgb  rgb(116, 199, 236);
      @define-color	blue  #89b4fa;
      @define-color	blue-rgb  rgb(137, 180, 250);
      @define-color	lavender  #b4befe;
      @define-color	lavender-rgb  rgb(180, 190, 254);
      @define-color	text  #cdd6f4;
      @define-color	text-rgb  rgb(205, 214, 244);
      @define-color	subtext1  #bac2de;
      @define-color	subtext1-rgb  rgb(186, 194, 222);
      @define-color	subtext0  #a6adc8;
      @define-color	subtext0-rgb  rgb(166, 173, 200);
      @define-color	overlay2  #9399b2;
      @define-color	overlay2-rgb  rgb(147, 153, 178);
      @define-color	overlay1  #7f849c;
      @define-color	overlay1-rgb  rgb(127, 132, 156);
      @define-color	overlay0  #6c7086;
      @define-color	overlay0-rgb  rgb(108, 112, 134);
      @define-color	surface2  #585b70;
      @define-color	surface2-rgb  rgb(88, 91, 112);
      @define-color	surface1  #45475a;
      @define-color	surface1-rgb  rgb(69, 71, 90);
      @define-color	surface0  #313244;
      @define-color	surface0-rgb  rgb(49, 50, 68);
      @define-color	base  #1e1e2e;
      @define-color	base-rgb  rgb(30, 30, 46);
      @define-color	mantle  #181825;
      @define-color	mantle-rgb  rgb(24, 24, 37);
      @define-color	crust  #11111b;
      @define-color	crust-rgb  rgb(17, 17, 27);

      * {
        font-family: 'Noto Sans Mono', monospace;
        font-size: 14px;
      }

      /* Window */
      window {
        margin: 0px;
        padding: 0px;
        border: 0.16em solid @mauve;
        border-radius: 10px;
        background-color: @base;
        animation: slideIn 0.2s ease-in-out both;
      }

      /* Slide In */
      @keyframes slideIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      /* Inner Box */
      #inner-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @base;
        animation: fadeIn 0.5s ease-in-out both;
      }

      /* Fade In */
      @keyframes fadeIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      /* Outer Box */
      #outer-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      /* Scroll */
      #scroll {
        margin: 0px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      /* Input */
      #input {
        font-size: 18px;
        margin: 5px 20px;
        padding: 10px;
        border: 1px solid @mauve;
        border-radius: 10px;
        color: @text;
        background-color: @crust;
        animation: fadeIn 0.5s ease-in-out both;
      }

      #input image {
        border: none;
        color: @text;
      }

      #input * {
        outline: 4px solid @red!important;
      }

      /* Text */
      #text {
        margin: 5px;
        border: none;
        color: @text;
        animation: fadeIn 0.5s ease-in-out both;
      }

      #entry {
        background-color: @base;
      }

      #entry arrow {
        border: none;
        color: @lavender;
      }

      /* Selected Entry */
      #entry:selected {
        outline: none;
        background-color: @surface0;
        border: 1px solid @surface0;
        border-radius: 10px;
      }

      #entry:selected #text {
        color: @mauve;
      }

      #entry:drop(active) {
        background-color: @mauve!important;
      }
    '';
  };

  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 2;

      modules-left = [
        "hyprland/workspaces"
        "custom/media"
      ];
      modules-center = [
        "hyprland/window"
      ];
      modules-right = [
        "pulseaudio"
        "network"
        "battery"
        "battery#bat2"
        "clock"
        "tray"
      ];
      "hyprland/workspaces" = {
        format = " {name} │ {windows} ";
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        window-rewrite = {
          "class<firefox>" = " ";
          "class<org.pwmt.zathura>" = " ";
          "class<sioyek>" = " ";
          "class<libreoffice-(.*)>" = " ";
          "class<shotwell>" =" ";
          "class<org.kde.kamoso>" = "󰵝 ";
          "class<cheese>" = "󰵝 ";
          "class<vlc>" = "󰕼 ";
          "class<Gimp.(.*)>" = " ";
          "class<org.kde.kdenlive>" = " ";
          "class<gnome-mines>" = "󰷚 ";
          "class<Minecraft Launcher>" = "󰍳 ";
          "class<steam>" = "󰓓 ";
          "class<discord>" = "󰙯 ";
          "class<alacritty>" = " ";
          "class<thunar>" = " ";
        };
        window-rewrite-default = "󰙵 ";
        format-window-separator = " ";
      };
      "hyprland/window" = {
        max-length = 100;
        separate-outputs = true;
      };
      tray = {
        icon-size = 21;
        spacing = 10;
      };
      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% {icon}󱐋";
        format-critical = "{capacity}% 󰂎";
        format-alt = "{time} {icon}";

        format-icons = [
          "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
        ];
      };
      "battery#bat2" = {
        bat = "BAT2";
      };
      network = {
        # "interface": "wlp2*", // (Optional) To force the use of this interface
        format-wifi = "{essid}  ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      pulseaudio = {
        # "scroll-step": 1, // %, can be a float
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = "󰝟 {format_source}";
        format-source = "";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ 
            "󰕿" "󰖀" "󰕾"
          ];
        };
        on-click = "pavucontrol";
      };
    };
    style = ''
    @define-color rosewater #f5e0dc;
    @define-color flamingo #f2cdcd;
    @define-color pink #f5c2e7;
    @define-color mauve #cba6f7;
    @define-color red #f38ba8;
    @define-color maroon #eba0ac;
    @define-color peach #fab387;
    @define-color yellow #f9e2af;
    @define-color green #a6e3a1;
    @define-color teal #94e2d5;
    @define-color sky #89dceb;
    @define-color sapphire #74c7ec;
    @define-color blue #89b4fa;
    @define-color lavender #b4befe;
    @define-color text #cdd6f4;
    @define-color subtext1 #bac2de;
    @define-color subtext0 #a6adc8;
    @define-color overlay2 #9399b2;
    @define-color overlay1 #7f849c;
    @define-color overlay0 #6c7086;
    @define-color surface2 #585b70;
    @define-color surface1 #45475a;
    @define-color surface0 #313244;
    @define-color base #1e1e2e;
    @define-color mantle #181825;
    @define-color crust #11111b;

    * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: JetBrainsMono Nerd Font;
        font-size: 16px;
    }

    window#waybar {
        background-color: shade(@crust, 0.9);
        border-bottom: 0px;
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
    }

    window#waybar.hidden {
        opacity: 0.2;
    }

    window#waybar.empty {
    }
    /*
    window#waybar.solo {
        background-color: #FFFFFF;
    }
    */

    window#waybar.termite {
        background-color: #3F3F3F;
    }

    window#waybar.chromium {
        background-color: #000000;
        border: none;
    }

    button {
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 7px 7px 12px 12px;
        box-shadow: inset 2px -3px alpha(@crust, 0.2);
    }

    /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */

    button:hover {
        background: inherit;
        box-shadow: inset 2px -3px alpha(@crust, 0.5);
    }

    #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: @text;
    }

    #workspaces button.visible {
        background: @mauve;
        color: @crust;
    }

    #workspaces button:hover {
        background: @overlay0;
        color: @text;
    }

    #workspaces button.urgent {
        background-color: @red;
    }

    #clock,
    #battery,
    #network,
    #pulseaudio,
    #tray {
        padding: 0 10px;
        border-radius: 7px 7px 12px 12px;
        box-shadow: inset 2px -3px alpha(@crust, 0.2);
        background-color: transparent;
        color: @text;
    }
    #window,
    #workspaces {
        margin: 0 4px;
    }
    /* If workspaces is the leftmost module, omit left margin */
    .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
    }
    /* If workspaces is the rightmost module, omit right margin */
    .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
    }
    #clock {
    }
    #battery {
    }
    #battery.charging, #battery.plugged {
    }
    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }
    /* Using steps() instead of linear as a timing function to limit cpu usage */
    #battery.critical:not(.charging) {
        background-color: #ff0000;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }
    label:focus {
        background-color: #000000;
    }
    #network {
    }
    #network.disconnected {
        background-color: @red;
    }
    #tray {
        background-color: #456286;
    }
    #tray > .passive {
        -gtk-icon-effect: dim;
    }
    #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: @red;
    }
    '';
  };

  programs.git = {
    enable = true;
    userName = "kriepiekrollie";
    userEmail = "benjamin.kleyn@gmail.com";
  };

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
          flavor = "mocha";
          accent = "mauve";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "lightly-dark";
      package = pkgs.lightly-qt;
    };
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    size = 16;
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
  };

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "application/pdf" = [ "sioyek.desktop" ];
  #   };
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/benjamin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
