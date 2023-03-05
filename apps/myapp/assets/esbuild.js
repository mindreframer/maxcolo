const esbuild = require("esbuild");

// Decide which mode to proceed with
let mode = "build";
process.argv.slice(2).forEach((arg) => {
  if (arg === "--watch") {
    mode = "watch";
  } else if (arg === "--deploy") {
    mode = "deploy";
  }
});

// Define esbuild options + extras for watch and deploy
let opts = {
  entryPoints: ["js/app.js"],
  bundle: true,
  logLevel: "info",
  target: "es2016",
  outdir: "../priv/static/assets",
};
if (mode === "watch") {
  opts = {
    sourcemap: "inline",
    ...opts,
  };
}
if (mode === "deploy") {
  opts = {
    minify: true,
    ...opts,
  };
}

(async () => {
  // USE context API, new since esbuild 0.17.
  // https://github.com/evanw/esbuild/blob/main/CHANGELOG.md#0170
  const context = await esbuild.context(opts);

  // Start esbuild with previously defined options
  // Stop the watcher when STDIN gets closed (no zombies please!)
  if (mode === "watch") {
    await context.watch();
    process.stdin.pipe(process.stdout);
    process.stdin.on("end", () => {
      context.dispose();
    });
  }

  if (mode === "deploy" || mode === "build") {
    const result = await context.rebuild();
    context.dispose();
  }
})();

///// PREV elixir config, maybe we'll need some extra details
// config :esbuild,
//   version: "0.14.41",
//   default: [
//     args:
//       ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
//     cd: Path.expand("../assets", __DIR__),
//     env: %{"NODE_PATH" => Path.expand("../../../deps", __DIR__)}
//   ]
