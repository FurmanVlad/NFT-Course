const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();

  await page.goto('https://moodle.sce.ac.il/user/index.php?id=32326', { waitUntil: 'networkidle2' });

  const html = await page.content(); 
  fs.writeFileSync('temp.html', html); 

  await browser.close();
})();
