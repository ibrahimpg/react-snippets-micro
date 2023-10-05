VERSION = "1.0.0"

local micro = import("micro")
local config = import("micro/config")
local strings = import("strings")

function reactComponent(fileName)
return string.format([[
import React from "react";

const %s = () => {
  return (
    <div>
      %s
    </div>
  );
};
  
export default %s;
]], fileName, fileName, fileName)
end

function reactComponentTS(fileName)
return string.format([[
import React from "react";

type Props = {};

const %s = (props: Props) => {
  return (
    <div>
      %s
    </div>
  );
};

export default %s;
]], fileName, fileName, fileName)
end

function rnComponent(fileName)
return string.format([[
import React from "react";
import { View, Text } from "react-native";

const %s = () => {
  return (
    <View>
      <Text>
        %s
      </Text>
    </View>
  );
};

export default %s;
]], fileName, fileName, fileName)
end

function rnComponentTS(fileName)
return string.format([[
import React from "react";
import { View, Text } from "react-native";

type Props = {};

const %s = (props: Props) => {
  return (
    <View>
      <Text>
        %s
      </Text>
    </View>
  );
};

export default %s;
]], fileName, fileName, fileName)
end

function createContextProvider(providerName)
return string.format([[
import React, { createContext, useState } from "react";

export const %sContext = createContext();

export const %sProvider = ({ children }) => {
  const [counter, setCounter] = useState(0);

  const value = {
    counter,
    setCounter,
  };

  return (
    <%sContext.Provider value={value}>
      {children}
    </%sContext.Provider>
  );
};
]], providerName, providerName, providerName, providerName)
end

function createContextProviderTS(providerName)
return string.format([[
import React, { createContext, useState, ReactNode } from "react";

interface %sContextProps {
  children: ReactNode;
}

export const %sContext = createContext({});

export const %sProvider = ({ children }: %sContextProps) => {
  const [counter, setCounter] = useState(0);

  const value = {
    counter,
    setCounter,
  };

  return (
    <%sContext.Provider value={value}>
      {children}
    </%sContext.Provider>
  );
};
]], providerName, providerName, providerName, providerName, providerName, providerName)
end

function rs(bp, args)
  local fileName = strings.Split(bp.Buf.Path, ".")[1]

  if args and #args == 1 then
    if args[1] == "rc" then
      bp.Buf:Insert(-bp.Cursor.Loc, reactComponent(fileName))
    elseif args[1] == "trc" then
      bp.Buf:Insert(-bp.Cursor.Loc, reactComponentTS(fileName))
    elseif args[1] == "nc" then
      bp.Buf:Insert(-bp.Cursor.Loc, rnComponent(fileName))
    elseif args[1] == "tnc" then
      bp.Buf:Insert(-bp.Cursor.Loc, rnComponentTS(fileName))
    elseif args[1] == "cx" then
      bp.Buf:Insert(-bp.Cursor.Loc, createContextProvider(fileName))
    elseif args[1] == "tcx" then
      bp.Buf:Insert(-bp.Cursor.Loc, createContextProviderTS(fileName))
    else
      micro.InfoBar():Message("Invalid args. Type > help reactsnippets")
    end
  else
    micro.InfoBar():Message("Invalid args. Type > help reactsnippets")
  end
end

function init()
  config.MakeCommand("rs", rs, config.NoComplete)
  config.AddRuntimeFile("reactsnippets", config.RTHelp, "help/reactsnippets.md")
end
