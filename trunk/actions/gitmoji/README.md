# Trunk plugin - Gitmoji

This plugin adds support for [gitmoji](https://gitmoji.carloscuesta.me/) to
[Trunk](trunk.io) in order to enforce a consistent commit message style.

## Installation

1. Install the plugin:

   ```bash
   trunk plugin add gitmoji
   ```

2. Enable the plugin in your `.trunk.yml` file:

   ```yaml
   actions:
     enabled:
       - gitmoji
   ```
