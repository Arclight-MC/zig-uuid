const std = @import("std");
const UUID = @import("uuid").UUID;

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    // generate from a crypto source
    const uuid1 = UUID.init(null);
    std.debug.print("{f}\n", .{uuid1});

    // parse
    const uuid2 = try UUID.parse("3df6f0e4-f9b1-4e34-ad70-33206069b995");
    const uuid2_str = try uuid2.toString(allocator);
    defer allocator.free(uuid2_str);
    std.debug.print("{s}\n", .{uuid2_str});
}
