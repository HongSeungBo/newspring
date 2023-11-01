document.addEventListener('click',function(e){
    console.log(e.target);
    let uuidVal = e.target.dataset.uuid;
    console.log(uuidVal);
    let Data = {
        bno:bnoVal,
        uuid:uuidVal
    }
    console.log(Data)
    if(e.target.classList.contains('fileDelBtn')){
        console.log("삭제 ㅎㅇ");
        FileDel(Data).then(result=>{
            console.log(result);
            if(result>0){
                alert("삭제성공");
                let tr = e.target.closest('tr').remove();
            }
        })
    }
})

async function FileDel(Data){
    try {
        const uri = '/board/delete';
        const config ={
            method:'delete',
            headers:{
                'content-type' : 'application/json; charset=utf-8'
            },
            body:JSON.stringify(Data)
        }
        const resp = await fetch(uri, config);
        const result = resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}