# Simple Tape Measure [tape_measure]

 
 [![luacheck](https://github.com/OgelGames/tape_measure/workflows/luacheck/badge.svg)](https://github.com/OgelGames/tape_measure/actions)
[![License](https://img.shields.io/badge/License-MIT%20and%20CC%20BY--SA%204.0-green.svg)](LICENSE.md)
[![Minetest](https://img.shields.io/badge/Minetest-5.0+-blue.svg)](https://www.minetest.net)
[![ContentDB](https://content.minetest.net/packages/OgelGames/tape_measure/shields/downloads/)](https://content.minetest.net/packages/OgelGames/tape_measure/)

## Overview

A simple tape measure for Minetest.

![Overview Screenshot](screenshot.png?raw=true "Overview Screenshot")

## Usage

Punch a node to set the start position, punch another node to set the end position. The distance and size will be displayed in chat.

The distance is the real vector distance between the two positions. The size is the dimensions in nodes of a imaginary box that contains both points.

You can also right-click a node to set a temporary waypoint, which can be useful for larger measurements.

If you hold sneak while setting a position or waypoint, the position of the adjacent node will be used instead. This can be used to measure air.


## Dependencies

There are no required dependencies, but if you are using [Minetest Game](https://github.com/minetest/minetest_game) or [Mineclone 2](https://content.minetest.net/packages/Wuzzy/mineclone2/) a recipe will be automatically added to craft the tape measure.

## Installation

Download the [master branch](https://github.com/OgelGames/tape_measure/archive/master.zip) or the [latest release](https://github.com/OgelGames/tape_measure/releases), and follow [the usual installation steps](https://wiki.minetest.net/Installing_Mods).

Alternatively, you can download and install the mod from [ContentDB](https://content.minetest.net/packages/OgelGames/tape_measure) or the online content tab in Minetest.

## License

Except for any exceptions stated in [LICENSE.md](LICENSE.md#exceptions), all code is licensed under the [MIT License](LICENSE.md#mit-license), with all textures, models, sounds, and other media licensed under the [CC BY-SA 4.0 License](LICENSE.md#cc-by-sa-40-license). 


