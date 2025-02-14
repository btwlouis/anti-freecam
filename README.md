# Freecam Detection

This resource is designed to detect and flag players who might be using cheats by comparing their in-game coordinates with their camera focus position. In artifact 12882, it is possible to use `GET_PLAYER_FOCUS_POS` and `IS_PLAYER_IN_FREE_CAM_MODE` to detect such cheats. 

However, this is not a 100% safe method and may still result in false positives. If a discrepancy is detected, the player is flagged and a screenshot is requested from their client. If the screenshot is not received within a specified timeout, the player is automatically kicked from the server.

## Potential Issues

- **Script Cams**: This detection method might have issues with script cams, as they can alter the camera focus position without indicating cheating behavior. Adjust the `Config.FlagDistance` accordingly to minimize false positives.

## Features

- Monitors player coordinates and camera focus position.
- Requests a screenshot from the client if suspicious activity is detected.
- Kicks players who do not upload the requested screenshot within the timeout period.

## Configuration

- `Config.Webhook`: The webhook URL where screenshots will be uploaded.
- `Config.TimeoutScreenshot`: The timeout period (in seconds) to wait for the screenshot upload. Default is 30 seconds.
- `Config.FlagDistance`: The distance threshold to flag a player for suspicious activity.

## Usage

1. Place the resource in the `resources` directory.
2. Configure the `Config` parameters as needed.
3. Start the resource on your server.

## License

This project is licensed under the MIT License.