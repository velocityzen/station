/*global Phoenix, Key, Event, Window */
'use strict';
Phoenix.set({
  openAtLogin: true,
});

const mCmdAlt = ['cmd', 'alt'];
const mCmdCtrl = ['cmd', 'ctrl'];
const mCmdCtrlShift = ['cmd', 'ctrl', 'shift'];

const padding = 2;
// x, y, width, height
const layout = {
  fullscreen: [0, 0, 1, 1],
  center: [0.15, 0.15, 0.7, 0.7],
  top: [0, 0, 1, 0.5],
  bottom: [0, 0.5, 1, 0.5],
  left: [0, 0, 0.5, 1],
  right: [0.5, 0, 0.5, 1],
  ne: [0, 0, 0.5, 0.5],
  nw: [0.5, 0, 0.5, 0.5],
  se: [0, 0.5, 0.5, 0.5],
  sw: [0.5, 0.5, 0.5, 0.5],
};

function setLayout(layout, window = Window.focused()) {
  const screen = Screen.main().flippedVisibleFrame();

  window.setFrame({
    x: Math.round(layout[0] * screen.width) + padding + screen.x,
    y: Math.round(layout[1] * screen.height) + screen.y,
    width: Math.round(layout[2] * screen.width) - 2 * padding,
    height: Math.round(layout[3] * screen.height) - 2 * padding,
  });
}

function cycleLayouts(...layouts) {
  let i = 0;

  return () => {
    if (!layouts[i]) {
      i = 0;
    }

    setLayout(layouts[i]);
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
bind('space', mCmdAlt, cycleLayouts(layout.fullscreen, layout.center));

bind('up', mCmdAlt, () => setLayout(layout.top));
bind('down', mCmdAlt, () => setLayout(layout.bottom));
bind('left', mCmdAlt, () => setLayout(layout.left));
bind('right', mCmdAlt, () => setLayout(layout.right));

bind('left', mCmdCtrlShift, () => setLayout(layout.ne));
bind('left', mCmdCtrl, () => setLayout(layout.se));
bind('right', mCmdCtrlShift, () => setLayout(layout.nw));
bind('right', mCmdCtrl, () => setLayout(layout.sw));
