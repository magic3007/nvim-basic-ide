local status_ok, hologram = pcall(require, "hologram")
if not status_ok then
  return
end

local ok, _ = pcall(hologram.setup, {
  auto_display = true -- WIP automatic markdown image display, may be prone to breaking
})
if not ok then
  return
end
