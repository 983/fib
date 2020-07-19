'use strict';
const fs = require('fs');
const bytes = fs.readFileSync('./fib.wasm');

(async () => {
    const module = await WebAssembly.compile(bytes);
    const instance = await WebAssembly.instantiate(module);

    console.log(instance.exports.fib(46));
})();
