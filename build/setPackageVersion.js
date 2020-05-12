#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const pckPath = path.resolve(process.cwd(), './package.json');
const pck = require(pckPath);
const VERSION = process.argv[2];
if (VERSION) {
	pck.version = VERSION;
	fs.writeFileSync(pckPath, JSON.stringify(pck, null, 2));
}
console.log();
console.log(`Updated "version" of package.json file to ${VERSION}`);
console.log();
