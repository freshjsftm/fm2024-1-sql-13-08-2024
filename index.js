const { Client } = require('pg');
const client = new Client({
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'testfm24',
});
start();

async function start() {
  try {
    await client.connect();
    const res = await client.query('CREATE TABLE "from_js"("id" serial PRIMARY KEY);');
    console.log(res);
    await client.end();
  } catch (error) {
    console.log(error);
  }
}
