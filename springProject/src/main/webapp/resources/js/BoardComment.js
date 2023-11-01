console.log(bnoVal);
console.log(email);
document.getElementById('cmtPostBtn').addEventListener('click',function(){
    const writerVal = document.getElementById('cmtWriter').value;
    const contentVal = document.getElementById('cmtText').value;
    if(contentVal == null || contentVal==""){
        alert("댓글을 입력하세요.");
        document.getElementById('cmtText').focus();
        return false;
    }
    let cmtData={
        bno:bnoVal,
        writer:writerVal,
        content:contentVal
    }
    console.log(cmtData);
    document.getElementById('cmtWriter').value='';
    document.getElementById('cmtText').value='';
    PostComment(cmtData).then(result=>{
        if(result>0){
            alert("성공");
            getListFunc(bnoVal);
        }
        else{
            alert("실패");
            getListFunc(bnoVal);
        }
    })
})

async function PostComment(cmtData) {
    try {
        const url = "/comment/post"
        const config={
            method:"post",
            headers:{
                'content-type' : 'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        }
        const resp = await fetch(url, config);
        const result = resp.text();
        return result;
    } catch (error) {
        console(error)
    }
    return result;
}

async function CommentList(bno, page){
    try {
        const resp = await fetch("/comment/list/"+bno+'/'+page);
        const result = resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//무조건 처음 뿌릴 때는 첫페이지 값을 뿌리기
function getListFunc(bno, page=1){
    CommentList(bno, page).then(result=>{
        console.log(page)
        const cmtListArea = document.getElementById('cmtListArea');
        if(result.cmtList.length > 0){
            if(page==1){
                cmtListArea.innerHTML='';
            }
            for(let cvo of result.cmtList){
                let li = `<li class="list-group-item" data-cno="${cvo.cno }">`;
                li += `<div class="mb-3">`;
                li += `<div class="fw-bold" data-writer="${cvo.writer}">${cvo.writer}</div>`;
                li += `${cvo.content}`;
                li += `</div>`;
                li += `<span class="badge rounded-pill text-bg-dark">${cvo.modAt}</span>`;
                if(cvo.writer == email){
                    li += `<button type="button" class="btn btn-outline-primary cmtModiBtn" data-bs-toggle="modal" data-bs-target="#myModal">수정</button>`;
                    li += `<button type="button" class="btn btn-outline-danger cmtDelBtn">삭제</button>`;
                }
                li += `</li>`;
                cmtListArea.innerHTML += li;
            }
            //댓글 페이징 코드
            let moreBtn = document.getElementById('moreBtn');
            //db에서 pgvo + list 같이 가져와야 해당 값을 줄 수 있음
            console.log(moreBtn)
            if(result.pgvo.pageNo < result.endPage || result.next){
                moreBtn.style.visibility="visible";
                moreBtn.dataset.page = page+1;
            }else{
                moreBtn.style.visibility="hidden";
            }
        }else{
            let li = `<li> 댓 글 없 음 </li>`;
            cmtListArea.innerHTML = li;
        }
    })
}

document.addEventListener('click',function(e){
    if(e.target.classList.contains('cmtModiBtn')){
        let li = e.target.closest('li');
        //nextSibling() : 같은 부모의 다른 형제 객체를 반환
        let cmtText = li.querySelector('.fw-bold').nextSibling;
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;
        document.getElementById('cmtModBtn').setAttribute('data-cno', li.dataset.cno);
    }else if(e.target.id == 'cmtModBtn'){
        let cmtDataMod={
            cno:e.target.dataset.cno,
            content:document.getElementById('cmtTextMod').value
        };
        console.log(cmtDataMod);
        editCommentToServcer(cmtDataMod).then(result=>{
            if(parseInt(result)){
                document.querySelector('.btn-close').click();
                if(result>0){
                    getListFunc(bnoVal);
                }
            }
        })
    }else if(e.target.id=='moreBtn'){
        getListFunc(bnoVal, parseInt(e.target.dataset.page));
    }else if(e.target.classList.contains('cmtDelBtn')){
        let li = e.target.closest('li');
        let cnoVal = li.dataset.cno;
        let cmtWriter = li.dataset.writer;
        DelData={
            cno:cnoVal,
            writer:cmtWriter,
            bno:bnoVal
        }
        cmtDelete(DelData).then(result=>{
            console.log(result);
            if(result>0){
                alert("삭제성공");
                getListFunc(bnoVal);
            }else{
                alert("삭제실패");
                getListFunc(bnoVal);
            }
        })
    }
})

async function cmtDelete(DelData){
    try {
        const url = "/comment/del";
        const config={
            method:"delete",
            headers:{
                'content-type' : 'application/json; charset=utf-8'
            },
            body:JSON.stringify(DelData)
        }
        const resp = await fetch(url, config);
        const result = resp.text();
        return result;
    } catch (error) {
        console(error)
    }
}

async function editCommentToServcer(cmtDataMod){
    try {
        const url = "/comment/"+cmtDataMod.cno;
        const config={
            method:'put',
            headers:{
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtDataMod)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}