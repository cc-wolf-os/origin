defaultentry = "Wolf OS"
timeout = 10
backgroundcolor = colors.black
selectcolor = colors.orange
titlecolor = colors.lightGray

menuentry "Wolf OS" {
    description "Boot into Wolf OS.";
    chainloader "post/wolfos/init.lua";
}

menuentry "CraftOS" {
    description "Boot into CraftOS.";
    craftos;
}
menuentry "jailbrake" {
    kernel ".jailbrake.lua";
}
