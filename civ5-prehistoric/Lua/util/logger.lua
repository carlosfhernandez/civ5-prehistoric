-- logger
-- Author: carlos
-- DateCreated: 1/16/2014 5:52:45 AM
--------------------------------------------------------------


-- module "util"

print( "" )
print( "" )
print( "__FILE__ util/logger" )






--
-- Logger 
--
-- 
--
Logger = {
  DEBUG   = "DEBUG",
  INFO    = "INFO",
  WARN    = "WARN",
  ERROR   = "ERROR",
  FATAL   = "FATAL",
  LEVEL   = {
      DEBUG = 1,
      INFO  = 2,
      WARN  = 3,
      ERROR = 4,
      FATAL = 5
  }
}

Logger.DEFAULT = Logger.LEVEL.ERROR

--
-- new
--
-- @param 
--
-- Create new logger.
--
function Logger:new (level)
  self.level = level or self.DEFAULT
  return self
end

--
-- debug 
--
function Logger:debug ( msg, pattern )
  self:log ( msg, self.DEBUG, pattern )
end

--
-- info 
--
function Logger:info ( msg, pattern )
  self:log ( msg, self.INFO, pattern )
end

--
-- warn 
--
function Logger:warn ( msg, pattern )
  self:log ( msg, self.WARN, pattern )
end

--
-- error 
--
function Logger:error ( msg, pattern )
  self:log ( msg, self.ERROR, pattern )
end

--
-- fatal 
--
function Logger:fatal ( msg, pattern )
  self:log ( msg, self.FATAL, pattern )
end

--
-- log
--
-- @param {String} msg
-- @param {String} level 
--
function Logger:log ( msg, level, pattern )

  if level then
    assert(self.LEVEL[level], string.format("undefined level `%s'", tostring(level)))
  else
    level = self.level
  end 

  if self.LEVEL[level] >= self.level then

    if type(msg) ~= "string" then
      msg = self:convert(msg)
    end

    print( self:messagize(pattern, os.date("!%y-%m-%d %H:%m:%S "), level, msg) )

    return true

  else
    return false

  end

end

--
-- messagize
--
function Logger:messagize (p_pattern, dt, level, message)

    local logline = p_pattern or "%date %level %message\n"

    message = string.gsub(message, "%%", "%%%%")
    logline = string.gsub(logline, "%%date", dt)
    logline = string.gsub(logline, "%%level", level)
    logline = string.gsub(logline, "%%message", message)

    return logline

end

--
-- convert
--
function Logger:convert (value)
  return "[SYSTEM] String conversion function not supported, yet..."
end

