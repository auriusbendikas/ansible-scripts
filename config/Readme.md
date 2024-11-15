### Overclocking with nvidia

1.  Enable coolbits with [/etc/X11/xorg.conf.d/05-nvidia.conf](./etc/X11/xorg.conf.d/05-nvidia.conf) 
1.  Modify gaming mode in `~/config/i3/config` to add overclock

        mode "gaming" {
            bindsym $mod+Shift+g mode "default";exec --no-startup-id nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[3]=0' -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=0'
        }
        bindsym $mod+Shift+g mode "gaming";exec --no-startup-id nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=740' -a '[gpu:0]/GPUGraphicsClockOffset[3]=155'
