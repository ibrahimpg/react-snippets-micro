# React Snippets for Micro Editor

Convenient JS/TS React and React Native component snippets for the [micro editor](https://github.com/zyedidia/micro).

## Installation

You can install the plugin by cloning this repo into your micro plugin directory:

```
git clone https://github.com/ibrahimpg/react-snippets-micro ~/.config/micro/plug/react-snippets-micro
```

## Usage

Snippets are generated when the commands listed below are entered into micro's command line (Ctrl-e).

You can also see these commands within micro by entering `> help reactsnippets`

React Component:
`> rs rc`

```
import React from "react";

const FileName = () => {
  return (
    <div>
      FileName
    </div>
  );
};

export default FileName;
```

React Component (TS):
`> rs trc`

```
import React from "react";

type Props = {};

const FileName = (props: Props) => {
  return (
    <div>
      FileName
    </div>
  );
};

export default FileName;
```

React Native Component:
`> rs nc`

```
import React from "react";
import { View, Text } from "react-native";

const FileName = () => {
  return (
    <View>
      <Text>
        FileName
      </Text>
    </View>
  );
};

export default FileName;
```

React Native Component (TS):
`> rs tnc`

```
import React from "react";
import { View, Text } from "react-native";

type Props = {};

const FileName = (props: Props) => {
  return (
    <View>
      <Text>
        FileName
      </Text>
    </View>
  );
};

export default FileName;
```

Context Provider:
`> rs cx`

```
import React, { createContext, useState } from "react";

export const FileNameContext = createContext();

export const FileNameContextProvider = ({ children }) => {
  const [counter, setCounter] = useState(0);

  const value = {
    counter,
    setCounter,
  }

  return (
    <FileNameContext.Provider value={value}>
      {children}
    </FileNameContext.Provider>
  );
};
```

Context Provider (TS):
`> rs tcx`

```
import React, { createContext, useState, ReactNode } from "react";

interface FileNameContextProps {
  children: ReactNode;
}

export const FileNameContext = createContext({});

export const FileNameContextProvider = ({ children }: FileNameContextProps) => {
  const [counter, setCounter] = useState(0);

  const value = {
    counter,
    setCounter,
  }

  return (
    <FileNameContext.Provider value={value}>
      {children}
    </FileNameContext.Provider>
  );
};
```
