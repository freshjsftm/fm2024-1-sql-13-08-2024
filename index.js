console.log('async/await');
// async функція завжди повертає проміс
async function test1() {
  const pr = Promise.reject('error');
  return pr;
}
const t1 = test1();
t1.then((res) => console.log(res)).catch((err) => console.log(err));

// fetch('https://randomuser.me/api/')
//   .then((res) => res.json())
//   .then((data) => console.log(data));

// помилка! await не можна використовувати за межами async
// const res = await fetch('https://randomuser.me/api/');
// const data = await res.json();

async function load2() {
  try {
    const res = await fetch('https://randomuser.me/api78');
    const data = await res.json();
    return data;
  } catch (error) {
    console.log('error 1');
  }
}
async function showData() {
  try {
    const data = await load2();
    console.log(data.results.at(0).email);
  } catch (error) {
    console.log('error 2');
  }
}
showData();

/*
async function name(params) {
  try {
    
  } catch (error) {
    
  }
}

const testArrow = async (params) => {
  try {
    
  } catch (error) {
    
  }
}

*/