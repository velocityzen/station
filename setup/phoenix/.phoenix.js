/*global Phoenix, Key, Event, Window */
'use strict';
Phoenix.set({
  openAtLogin: true,
});

const keyLeft = 'left';
const keyRight = 'right';
const keyUp = 'up';
const keyDown = 'down';
const keySpace = 'space';
const keyMCmdAlt = ['cmd', 'alt'];
const keyMCmdCtrl = ['cmd', 'ctrl'];
const keyMCmdCtrlShift = ['cmd', 'ctrl', 'shift'];

const padding = 1;
// x, y, width, height
const layout = {
  fullscreen: [0, 0, 1, 1],
  center: [0.15, 0.15, 0.7, 0.7],
  top: [0, 0, 1, 0.5],
  bottom: [0, 0.5, 1, 0.5],
  leftOneThird: [0, 0, 0.333, 1],
  leftHalf: [0, 0, 0.5, 1],
  leftTwoThirds: [0, 0, 0.666, 1],
  rightOneThird: [0.666, 0, 0.333, 1],
  rightHalf: [0.5, 0, 0.5, 1],
  rightTwoThirds: [0.333, 0, 0.666, 1],
  right: [0.5, 0, 0.5, 1],
  ne: [0, 0, 0.5, 0.5],
  nw: [0.5, 0, 0.5, 0.5],
  se: [0, 0.5, 0.5, 0.5],
  sw: [0.5, 0.5, 0.5, 0.5],
};

let currentCycleLayoutsId = null;
let resetCycleLayouts = false;

function setLayout(layout, resetCycle = true, window = Window.focused()) {
  resetCycleLayouts = resetCycle;
  const screen = Screen.main().flippedVisibleFrame();

  window.setFrame({
    x: Math.round(layout[0] * screen.width) + padding + screen.x,
    y: Math.round(layout[1] * screen.height) + padding + screen.y,
    width: Math.round(layout[2] * screen.width) - 2 * padding,
    height: Math.round(layout[3] * screen.height) - 2 * padding,
  });
}

function cycleLayouts(id, ...layouts) {
  let i = 0;

  return () => {
    if (resetCycleLayouts || currentCycleLayoutsId != id || !layouts[i]) {
      i = 0;
    }

    currentCycleLayoutsId = id;
    setLayout(layouts[i], false);
    i++;
  };
}

const handlers = [];

function disableKeys() {
  handlers.forEach((key) => key.disable());
}

function enableKeys() {
  handlers.forEach((key) => key.enable());
}

function bind(key, mods, callback, always) {
  const binding = Key.on(key, mods, callback);
  if (!always) {
    handlers.push(binding);
  }
}

//bind sizes
bind(
  keySpace,
  keyMCmdAlt,
  cycleLayouts('center', layout.fullscreen, layout.center)
);

bind(keyUp, keyMCmdAlt, () => setLayout(layout.top));
bind(keyDown, keyMCmdAlt, () => setLayout(layout.bottom));

bind(
  keyLeft,
  keyMCmdAlt,
  cycleLayouts(
    'left',
    layout.leftHalf,
    layout.leftOneThird,
    layout.leftTwoThirds
  )
);

bind(
  keyRight,
  keyMCmdAlt,
  cycleLayouts(
    'right',
    layout.rightHalf,
    layout.rightOneThird,
    layout.rightTwoThirds
  )
);

bind(keyLeft, keyMCmdCtrlShift, () => setLayout(layout.ne));
bind(keyLeft, keyMCmdCtrl, () => setLayout(layout.se));
bind(keyRight, keyMCmdCtrlShift, () => setLayout(layout.nw));
bind(keyRight, keyMCmdCtrl, () => setLayout(layout.sw));
