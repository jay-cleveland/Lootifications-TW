local ADDON_NAME, Addon = ...

-- ============================================================================
-- Constants
-- ============================================================================

Addon.ICON = ("Interface\\AddOns\\%s\\assets\\icon"):format(ADDON_NAME)
Addon.PLAYER_NAME = UnitName("Player")
Addon.TEXTURE_MESSAGE_FORMAT = "|T%s:0:0:0:0:16:16:2:14:2:14|t %s"

-- ============================================================================
-- Functions
-- ============================================================================

do -- Addon:GetModule()
  local modules = {}

  --- Returns a module using the given key.
  --- @param key string
  --- @return table
  function Addon:GetModule(key)
    key = key:upper()
    if type(modules[key]) ~= "table" then modules[key] = {} end
    return modules[key]
  end
end

--- Sets a default value for the given table and key, if the current value is nil.
--- @param t table
--- @param key string
--- @param default any
function Addon:IfKeyNil(t, key, default)
  if t[key] == nil then t[key] = default end
end

--- Prints values prefixed with addon's name.
--- @param ... any
function Addon:Print(...)
  print(self:GetModule("Colors").Yellow("[" .. ADDON_NAME .. "]"), ...)
end
