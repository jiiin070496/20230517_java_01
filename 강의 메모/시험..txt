import './App.css';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import { useState } from 'react';

function App() {

  // 추가기능(input입력된 값)에서 사용할 저장공간
  const [newFruit, setNewFruit]  = useState(
    {
      name : ""
    }
  );

  // 목록조회를 위한 저장공간
  const [fruitList, setFruitList] = useState(
    [
      {
        name : "수박"
      },
      {
        name : "참외"
      }
    ]
  );


  const Home = ()=>{
    return (
      <>
        <h1>홈</h1>
        <nav>
          <ul>
            <li><Link to="/list">과일목록</Link></li>
            <li><Link to="/insert">과일추가</Link></li>
          </ul>
        </nav>
      </>
    );
  }

  const List = ()=>{
    return (
      <>
        <h1>과일목록</h1>
        <nav>
          <ul>
            <li><Link to="/insert">과일추가</Link></li>
            <li><Link to="/">홈</Link></li>
          </ul>
        </nav>
        <div>
          <table>
            <thead>
              <tr>
                <th>이름</th>
              </tr>
            </thead>
            <tbody>
              {
                fruitList.map(
                  (fruit) => {
                    return (
                      <tr>
                        <td>{fruit.name}</td>
                        <td><button onClick={ () => { onClickDeleteHandler(fruit.name);}}>삭제</button></td>
                      </tr>
                    );
                  }
                )
              }
            </tbody>
          </table>
        </div>
      </>
    );
  }

  const Insert = ()=>{
    return (
      <>
        <h1>과일추가</h1>
        <nav>
          <ul>
            <li><Link to="/list">과일목록</Link></li>
            <li><Link to="/">홈</Link></li>
          </ul>
        </nav>
        <div>
          <div><span>이름</span><input onChange={onChangeHandler} name="name" value={newFruit.name}></input></div>
          <div><button onClick={onClickHandler} >등록</button></div>
        </div>
        <List></List>
      </>
    );
  }

  const onClickDeleteHandler = (name) => {
    const filteredFruitList =  fruitList.filter( (fruit) => fruit.name !== name); //fruit 내가 짓는 이름
    setFruitList(filteredFruitList) // 목록용 저장공간
  }

  const onClickHandler = (event)=>{
    // 유효성검사 -빈 칸
    if( !newFruit.name ){
      alert("모든 값을 입력해주세요.")
      return;
    }
    // 유효성검사 - 같은 이름 없도록
    const idExist = fruitList.some( (fruit)=>fruit.name === newFruit.name );
    if(idExist){
      alert("이미 등록된 과일이름입니다. 이름을 다시 입력해주세요.")
      setNewFruit({...newFruit, 'name':''});
      return;
    }
    // 추가기능용 저장공간 newFruit 을 목록용 저장공간 fruitList 에 추가하기
    setFruitList([...fruitList, newFruit]);

    // 이름, 가격, 수량 입력란을 공란으로 만들기
    setNewFruit({ name : ""});
  }

  const onChangeHandler = (event)=>{
    const {name, value} = event.target;
    // 추가기능용 저장공간 newFruit 에 값변경
    setNewFruit({...newFruit, [name]:value});
  }

  return (
    <BrowserRouter>
      <div className="App">
        <Routes>
          <Route path='/' element={<Home></Home>} />
          <Route path='/list' element={<List></List>} />
          <Route path='/insert' element={<Insert></Insert>} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
