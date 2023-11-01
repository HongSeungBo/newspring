// 트리거 버튼 처리
document.getElementById('trigger').addEventListener('click',function(){
    document.getElementById('files').click();
})

// 실행파일, 이미지 파일에 대한 정규표현식
const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$"); // 실행파일 막기
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|emp|jfif)$"); // 허용하는 이미지 파일
const maxSize = 1024 * 1024 * 20; // 파일 최대 사이즈

function fileValidation(fileName, fileSize){
    if(!regExpImg.test(fileName)){
        return 0;
    }else if(regExp.test(fileName)){
        return 0;
    }else if(fileSize>maxSize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',function(e){
    if(e.target.id == 'files'){
        //파일을 다시 추가할 때는 버튼 상태를 false로 변경해줘야 등록 가능
        document.getElementById('regBtn').disabled=false;

        // id가 files인 정보의 실제 파일
        const fileObj = document.getElementById('files').files;
        console.log(fileObj);
        let div = document.getElementById('fileZone');
        // 기존 값이 있으면 삭제
        div.innerHTML='';
        let isOk=1; // 여러 파일이 모두 검증을 통과해야 하기 때문에 *로 각 파일마다 통과여부 확인
        let ul = `<ul class="list-group list-group-flush">`;
        for(let file of fileObj){
            let vaildResult = fileValidation(file.name, file.size); // 0 or 1
            isOk *= vaildResult;
            ul+=`<li class="list-group-item">`;
            ul+=`<div class="mb-3">`;
            ul+=`${vaildResult? '<div class="mb-3">업로드 가능</div>' : '<div class="mb-3 text-danger">업로드 불가능</div>'}`;
            ul+=`${file.name}</div>`;
            ul+=`<span class="badge rounded-pill text-bg-${vaildResult ? 'success' : 'danger'}">${file.size} Byte</span>`;
            ul+=`</li>`;
        }
        ul += `</ul>`;
        div.innerHTML = ul;
        if(isOk==0){
            document.getElementById('regBtn').disabled=true;
        }
    }
})