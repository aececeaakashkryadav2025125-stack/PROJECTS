

//Intialize
let songIndex=0;
let audioElement = new Audio('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
let masterPlay=document.getElementById('masterPlay');
let myProgressBar=document.getElementById('myProgressBar');
let masterSongName=document.getElementById('masterSongName');
let songItems=Array.from(document.getElementsByClassName('songItem'));



let songs=[
  {songName:"1", filePath:"https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3 ", coverPath:"1"},

  {songName:"2", filePath:"https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3 ", coverPath:"2"},

  {songName:"3", filePath:"https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3", coverPath:"3"},

  {songName:"4", filePath:" https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3", coverPath:"4"},

  {songName:"5", filePath:" https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3", coverPath:"5"},
]

songItems.forEach((element,i)=>{
  //console.log(element,i);
  element.getElementsByTagName("img")[0].src=songs[i].coverPath;


});


//audio.Element.play();

//Handle play/pause click
masterPlay.addEventListener('click',()=>{
  if(audioElement.paused || audioElement.currentTime<=0)
    {
    audioElement.play();
    masterPlay.classList.remove('fa-play');
    masterPlay.classList.add('fa-pause');
  }
  else{
      audioElement.pause();
      masterPlay.classList.remove('fa-pause');
      masterPlay.classList.add('fa-play');
    }
})

//Listen to Events
audioElement.addEventListener('timeupdate',()=>{
  //Update Seekbar
  progress=parseInt((audioElement.currentTime/audioElement.duration)*100);
  myProgressBar.value=progress ;
})

myProgressBar.addEventListener('change',()=>
{
  audioElement.currentTime=myProgressBar.value*audioElement.duration/100;
})

const makeAllPlays=()=>{
  Array.from(document.getElementsByClassName('songItemPlay')).forEach((element)=>{
  element.classList.remove('fa-pause');
  element.classList.add('fa-play');
  
})
}

Array.from(document.getElementsByClassName('songItemPlay')).forEach((element)=>{
  element.addEventListener('click',(e)=>{
    //console.log(e.target);

    makeAllPlays();
    songIndex=parseInt(e.target.id);
    e.target.classList.remove('fa-play');
    e.target.classList.add('fa-pause');
    audioElement.src = `${songs[songIndex].filePath}`;
    masterSongName.innerText=songs[songIndex].songName;
    audioElement.currentTime=0;
    audioElement.play();
    masterPlay.classList.remove('fa-play');
    masterPlay.classList.add('fa-pause');
  })
})

document.getElementById('next').addEventListener('click',()=>{
  if(songIndex>4){
    songIndex=0;
  }
  else{
    songIndex+=1;
  }
  audioElement.src = `${songs[songIndex].filePath}`;
  masterSongName.innerText=songs[songIndex].songName;
  audioElement.currentTime=0;
  audioElement.play();
  masterPlay.classList.remove('fa-play');
  masterPlay.classList.add('fa-pause');
})

document.getElementById('previous').addEventListener('click',()=>{
  if(songIndex<=0){
    songIndex=0;
  }
  else{
    songIndex-=1;
  }
  audioElement.src = `${songs[songIndex].filePath}`;
  masterSongName.innerText=songs[songIndex].songName;
  audioElement.currentTime=0;
  audioElement.play();
  masterPlay.classList.remove('fa-play');
  masterPlay.classList.add('fa-pause');
})






