# Private NixOS Configuration

## structure

```
.
├── images       # custom image generations
├── machines     # machine definitions
├── modules      # own nix-options, to modularize services/hardware/...
├── overlays     # overlays
├── pkgs         # own packages, which are not available in nixpkgs
└── profiles     # summarize module collections into single options
```

## usage
