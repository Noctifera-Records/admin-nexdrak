const fs = require('fs');
const path = require('path');

const openNextDir = path.join(process.cwd(), '.open-next');

// OpenNext genera los estáticos en diferentes ubicaciones dependiendo de la versión
// Verificar y copiar desde las posibles ubicaciones

const possibleStaticDirs = [
  path.join(openNextDir, 'assets', '_next', 'static'),
  path.join(openNextDir, 'assets', '.next', 'static'),
  path.join(openNextDir, 'assets', 'static'),
  path.join(openNextDir, '.next', 'static'),
  path.join(openNextDir, 'static'),
];

const targetDir = path.join(openNextDir, '_next', 'static');

// Encontrar la carpeta de estáticos que existe
let sourceDir = null;
for (const dir of possibleStaticDirs) {
  if (fs.existsSync(dir)) {
    sourceDir = dir;
    console.log(`Found static assets at: ${dir}`);
    break;
  }
}

if (sourceDir) {
  // Crear carpeta destino si no existe
  if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
  }

  // Copiar contenido
  const items = fs.readdirSync(sourceDir);
  items.forEach(item => {
    if (item === '.' || item === '..') return;
    
    const srcPath = path.join(sourceDir, item);
    const destPath = path.join(targetDir, item);
    
    if (fs.existsSync(destPath)) {
      fs.rmSync(destPath, { recursive: true, force: true });
    }
    
    fs.cpSync(srcPath, destPath, { recursive: true });
    console.log(`Copied ${item} to _next/static`);
  });
} else {
  console.log('No static assets found in expected locations');
  console.log('OpenNext directory contents:');
  if (fs.existsSync(openNextDir)) {
    fs.readdirSync(openNextDir).forEach(item => {
      console.log(`  - ${item}`);
    });
  }
}

// Crear _routes.json para Cloudflare Pages
const routesJsonPath = path.join(openNextDir, '_routes.json');
if (!fs.existsSync(routesJsonPath)) {
  const routesConfig = {
    version: 1,
    include: ['/*'],
    exclude: ['/_next/static/*']
  };
  fs.writeFileSync(routesJsonPath, JSON.stringify(routesConfig, null, 2));
  console.log('Created _routes.json');
}

// Rename worker.js to _worker.js if it exists
const workerJsPath = path.join(openNextDir, 'worker.js');
const underscoreWorkerJsPath = path.join(openNextDir, '_worker.js');
if (fs.existsSync(workerJsPath)) {
  if (fs.existsSync(underscoreWorkerJsPath)) {
    fs.rmSync(underscoreWorkerJsPath);
  }
  fs.renameSync(workerJsPath, underscoreWorkerJsPath);
  console.log('Renamed worker.js to _worker.js');
}

// Copy public folder to root of .open-next if it exists
const publicDir = path.join(process.cwd(), 'public');
if (fs.existsSync(publicDir) && fs.readdirSync(publicDir).length > 0) {
  const items = fs.readdirSync(publicDir);
  items.forEach(item => {
    const srcPath = path.join(publicDir, item);
    const destPath = path.join(openNextDir, item);
    if (fs.existsSync(destPath)) {
      fs.rmSync(destPath, { recursive: true, force: true });
    }
    fs.cpSync(srcPath, destPath, { recursive: true });
    console.log(`Copied ${item} from public to root`);
  });
}

console.log('Static assets fix completed');
