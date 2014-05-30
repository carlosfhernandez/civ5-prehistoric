--[[

Logger [pseudo-class]

@desc:    Standard logging utilies using typical log levels. 
@author:  apshai(steam), carloscodex(civfanatics), carlosfhernandez(github)
@date:    2014-01-05


USAGE
--------------------------------------------------------------------------------

Create a new logger.

Use your favorite  :o)  log level: DEBUG, INFO, WARN, ERROR, FATAL:
> local logger = Logger:new(Logger.LEVEL.DEBUG)

Or, use the default log level (in Logger.DEFAULT)
> local logger = Logger:new() 


Change your mind? Update log level.

> logger.level = Logger.LEVEL.WARN


Log a message.

> logger:log( "like codex?" ) -- will use current log level, Logger.level
> logger:log( "override level", Logger.LEVEL.FATAL)
> logger:log( "custom format", nil, "%date %level %message\n")
  -- nil will use current log level

> logger:debug( "just output at debug level" )
> logger:info( "same for all others" )


SAMPLE LOG
--------------------------------------------------------------------------------

Main_Pre: 14-01-17 12:01:14  INFO PlayerDoTurn.Add( CanBuild_Causeway )


FUTURE
--------------------------------------------------------------------------------

Better inline comments. (Don't we always say that?)

Logger:convert (obj)
If supplied message is not a string then Logger will attemp to serialize or 
convert to string format. Tables, Arrays, etc, will be converted for 
wonderful debugging opportunities! :P

Logger:hook (x) --- eh, maybe

Logger.add_output (io, file, net?)
I don't even know if it's possible within the Civ sandbox, but it would be nice
to send log info to a designated URL. Of course, this would probably pose a 
security issue, so we'll see how this goes. 


ANOTHER LOGGER?
--------------------------------------------------------------------------------

Yes. This was my first day learning Lua so I decided to try something somewhat
familiar to get my hands dirty. Now I need to go read some reference books and 
manuals and get a decent foundation. 


CONTACT
--------------------------------------------------------------------------------

Please contact me for questions and suggestions. 

apshai(steam), carloscodex(civfanatics), carlosfhernandez(github),
carloscipher(twitter)


--]]




-- module "util"

print( "logger    | --------------------------------------------------" );
print( "logger    | __FILE__ util/logger" )
print( "logger    | --------------------------------------------------" );




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

Logger.DEFAULT        = Logger.LEVEL.ERROR
Logger.DATE_PATTERN   = "!%y-%m-%d %H:%m:%S "
Logger.PATTERN        = "%date %level %message\n"
Logger.PREFIX         = ""


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
-- log
--
-- @param {String} msg
-- @param {String} level 
-- @param {String} pattern
-- @param {String} prefix - prefix to be added to message
-- @param {Boolean} bPersisPrefix - whether to keep this prefix for future msg
-- 
function Logger:log ( msg, level, pattern, prefix, bPersisPrefix )

  if (false or bPersisPrefix) then
    self.PREFIX = prefix or ""
  end

  if level then
    assert(self.LEVEL[level], string.format("undefined level `%s'", tostring(level)))
  else
    level = self.level
  end 

  if self.LEVEL[level] >= self.level then

    if type(msg) ~= "string" then
      msg = self:convert(msg)
    end

    print( self:messagize(pattern, os.date(self.DATE_PATTERN), level, msg) )

    return true

  else
    return false

  end

end

--
-- debug 
--
function Logger:debug ( msg, pattern )
  self:log ( msg, self.DEBUG, pattern, nil, false )
end

--
-- info 
--
function Logger:info ( msg, pattern )
  self:log ( msg, self.INFO, pattern, nil, false )
end

--
-- warn 
--
function Logger:warn ( msg, pattern )
  self:log ( msg, self.WARN, pattern, nil, false )
end

--
-- error 
--
function Logger:error ( msg, pattern )
  self:log ( msg, self.ERROR, pattern, nil, false )
end

--
-- fatal 
--
function Logger:fatal ( msg, pattern )
  self:log ( msg, self.FATAL, pattern, nil, false )
end

--
-- messagize
--
function Logger:messagize (p_pattern, dt, level, message)

    local logline = p_pattern or "%date %level %message\n"

    message = string.gsub(message, "%%", "%%%%")

    --logline = string.gsub(logline, "%%date", dt)
    --logline = string.gsub(logline, "%%level", level)
    --logline = string.gsub(logline, "%%message", message)


    logline = string.format("%-10s| %s%s %s", self.PREFIX, dt, level, message)
    --logline = string.format("", ) .. logline

    return logline

end

--
-- convert
--
function Logger:convert (obj)
  return "[SYSTEM] String conversion function not supported, yet..."
end
