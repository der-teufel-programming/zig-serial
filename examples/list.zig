const std = @import("std");
const zig_serial = @import("serial");

pub fn main(init: std.process.Init) !u8 {
    const io = init.io;
    var iterator = try zig_serial.list(io);
    defer iterator.deinit(io);

    while (try iterator.next(io)) |port| {
        std.debug.print("path={s},\tname={s},\tdriver={s}\n", .{ port.file_name, port.display_name, port.driver orelse "<no driver recognized>" });
    }

    return 0;
}
