# graystatus

Prompt theme for [fish shell](http://fishshell.com).

* modest prompt
* deference to contents

## Screen Shot

![screenshot](screenshot.png)

## Install

If you use [fisher](https://github.com/jorgebucaran/fisher) :

```
fisher usami-k/graystatus
```

If you use [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) :

```
omf install graystatus
```

## Configuration

To configure, you can use environment variables.

* `GRAYSTATUS_COLOR_PROMPT` : prompt color (default: brblack)
* `GRAYSTATUS_COLOR_STATUS` : exit status color (default: red)

The color value is passed to [set_color](https://fishshell.com/docs/current/commands.html#set_color) command.

## License

Copyright 2017 USAMI Kosuke

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
