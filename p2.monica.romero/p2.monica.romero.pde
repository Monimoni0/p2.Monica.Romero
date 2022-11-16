JSONObject newsjson, caljson, weatherjson,usagejson,personjson;

int newsx = 50, newsy = 650, newsw = 50, newsh = 70; 
int calx = 355, caly = 640, calw = 80, calh = 95;
int weatherx = 145, weathery = 640, weatherw = 70, weatherh = 95;
//int usagex = 130, usagey = 650, usagew = 50, usageh = 75;
int flashx = 255, flashy = 650, flashw = 50, flashh = 70;
int personx = 480, persony = 650, personw = 70, personh = 75;
int exitx = 40, exity = 90, exitw = 20;
int popupx = 40, popupy = 90, popupw = 500, popuph = 540;
int backx = 318, backy = 570, backw = 100, backh = 50, backStrokeWeight = 3;
int nextx = 420, nexty = 570,nextw = 100, nexth = 50, nextStrokeWeight = 1;

PImage personal;
PImage calendar;
PImage weather;
PImage usage;
PImage news;
PImage flash;
PImage person;

boolean newsPressed = false, calPressed = false, weatherPressed = false;
boolean usagePressed = false, flashPressed = false, personPressed = false;
boolean exitPressed = false, nextPressed = false, backPressed = false;
boolean nextAvail = false, backAvail = false;

color blue = color(65,105,255);
color gray = color(211,211,211);
color darkgray = color(169,169,169);
color black = color(0);
color white = color(255);
color nextColor = blue, nextStroke = black, nextText = black;
color backColor = gray, backStroke = darkgray, backText = white;

//TODO: fix news text color, make sure next next and back bttns work, add color options to flash
//combine usage into personal, weather(json and processing),calendar (json doone for now)
void setup() {
  size(580, 740); 
  person = loadImage("person.jpeg");
  
  personal = loadImage("personal.png");
  calendar = loadImage("calendar.png");
  news = loadImage("news.png");
  usage = loadImage("usage.png");
  weather = loadImage("weather.png");
  flash  = loadImage("flash.png");
  
}

void draw() {
  background(person);
  fill(255);
  stroke(255);
  color(255);
  rect(20,640,540,90,50);
  image(news,newsx,newsy,50,70 );
  image(personal, personx,persony,70,75);
  //image(usage, usagex, usagey, 50, 75);
  image(weather, weatherx, weathery, 70,95);
  image(flash, flashx, flashy, 50, 70);
  image(calendar, calx,caly,80,95);
  
  //clock
  fill(255);
  rect(200,10,150,70,50);
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  String time;
  if(m<10)
  {
    if(h<10)
    {
      time = "0"+h + ":0" + m;
    }
    else
    {
      time = h + ":0" + m;
    }
  }
  else
  {
    if(h <10)
    {
     time = "0" + h + ":" +  m; 
    }
    else
    {
      time = h + ":" + m; 
    }
  }
  
  textSize(60);
  fill(0);
  text(time, 210,65);
  if(exitPressed)
  {
    newsPressed = false;  //<>//
    usagePressed = false; 
    weatherPressed = false;
    flashPressed = false; 
    calPressed = false; 
    personPressed = false;
    exitPressed = false;
  }
  
  //news button
  if(newsPressed)
  {
    
    fill(255);
    rect(popupx,popupy,popupw,popuph,25);
    fill(103,90,70);
    rect(exitx,exity,exitw,exitw,5);
    textSize(20);
    fill(0);
    text("X", 44,107);
    fill(gray);
    
    //back button
    stroke(backStroke);
    strokeWeight(backStrokeWeight);
    fill(backColor);
    rect(backx, backy, backw, backh, 5);
    fill(backText);
    text("Back", 348, 600);
    
    fill(0); 
    
    //nextButton
    fill(nextColor);
    stroke(nextStroke);
    strokeWeight(nextStrokeWeight);
    rect(nextx, nexty, nextw, nexth, 5);
    fill(nextText);
    text("Next", 450, 600);
    
    JSONArray json1; 
    newsjson = loadJSONObject("news.json");
    json1 = newsjson.getJSONArray("news");
    
   if(nextAvail)
   {
    JSONObject json2 = json1.getJSONObject(0);
  
    textSize(40);
    fill(0);
    text(json2.getString("title"), 200,140);
    String line = json2.getString("line1");
    textSize(20);
    text(line, 80,180);
    line = json2.getString("line2");
    text(line, 80,200);
    line = json2.getString("line3");
    text(line, 80,220);
    line = json2.getString("line4");
    text(line, 80,240);
    line = json2.getString("line5");
    text(line, 80,260);
    line = json2.getString("line6");
    text(line, 80,280);
    line = json2.getString("line7");
    text(line, 80,300);
    line = json2.getString("line8");
    text(line, 80,320);
    line = json2.getString("line9");
    text(line, 80,340);
    line = json2.getString("line10");
    text(line, 80,360);
    line = json2.getString("line11");
    text(line, 80,380);
    line = json2.getString("line12");
    text(line, 80,400);
    line = json2.getString("line13");
    text(line, 80,420);
    line = json2.getString("line14");
    text(line, 80,440);
    line = json2.getString("line15");
    text(line, 80,460); 
   }
   if(nextPressed)
   {
     backAvail = true;
     nextAvail = false;
     backPressed = false;
     
     backColor = blue; 
     nextColor = gray;
     backStroke = black; 
     nextStroke = darkgray;
     backStrokeWeight = 1; 
     nextStrokeWeight = 3;
     backText = black;
     nextText = white;
     
     JSONObject json2 = json1.getJSONObject(1);
     
    textSize(40);
    fill(0);
    text(json2.getString("title"), 200,140);
    String line = json2.getString("line1");
    textSize(20);
    text(line, 80,180);
    line = json2.getString("line2");
    text(line, 80,200);
    line = json2.getString("line3");
    text(line, 80,220);
    line = json2.getString("line4");
    text(line, 80,240);
    line = json2.getString("line5");
    
    if(backPressed)
    {
      nextAvail = true; 
      backAvail = false;
      nextPressed = false;
      backAvail = true;
     nextAvail = false;
     
     backColor = gray; 
     nextColor = blue;
     backStroke = darkgray; 
     nextStroke = black;
     backStrokeWeight = 3; 
     nextStrokeWeight = 1;
     backText = white; 
     nextText = black;
    }
    
   }
   
  }
  //usage button
  /*if(usagePressed)
  { //<>//
    fill(255);
    rect(popupx,popupy,popupw,popuph,25);
    fill(103,90,70);
    rect(exitx,exity,exitw,exitw,5);
    textSize(20);
    fill(0);
    text("X", 44,107); //<>//
    
    textSize(40);
    text("This Week", 200, 350);
    stroke(0);
    strokeWeight(5);
    line(100,300, 500, 300);
    
    textSize(40);
    text("Last Week", 200, 620);
    stroke(0);
    strokeWeight(5);
    line(100,585, 500, 585);
    
  }*/
  //flashlight button
  if(flashPressed)
  {
    fill(255);
    rect(popupx,popupy,popupw,popuph,25);
    fill(103,90,70);
    rect(exitx,exity,exitw,exitw,5);
    textSize(20);
    fill(0);
    text("X", 44,107);
  }
  
}
String findButton(float x, float y){
  
  if(x >=newsx && (x - newsx <= newsw)) //<>//
  {
    if(y >= newsy && ( y- newsy <= newsh)) //<>//
    {
      return "news"; //<>//
    }
  }
  /*else if(x >= usagex && (x - usagex <= usagew)){ //<>//
    if(y>= usagey && (y - usagey <=usageh)) //<>//
    {
      return "usage"; //<>//
    }
  }*/
  else if(x >= flashx && (x - flashx <= flashw))
  {
    if(y >= flashy && (y - flashy <= flashh))
    {
      return "flash";
    }
  }
  else if(x >= nextx && (x - nextx <= nextw))
  {
    if(y >= nexty && (y - nexty <= nexth))
    {
      return "next";
    }
  }
  else if(x >= backx && (x - backx <= backw))
  {
    if(y >= backy && (y - backy <= backh))
    {
      return "back";
    }
  }
  else if(x >= exitx && (x - exitx <= exitw)) //<>//
  {
    if(y >= exity && (y - exity <= exitw)) //<>//
    {
      return "exit"; //<>//
    }
  }
  
  
  return "nothing";
}
void mouseClicked(){
  String button = findButton(mouseX, mouseY);
  
  switch(button) //<>//
  {
    case "news": newsPressed = true;
                  break;
    case "usage": usagePressed = true;
                  break;
    case "flash": flashPressed = true;
                 break;
    case "next": if(nextAvail)
                  {
                    nextPressed = true;
                  }
                  break;
    case "back": if(backAvail)
                  {
                    backPressed = true;
                  }
                  break;
    case "exit": exitPressed = true; //<>//
                 break; //<>//
    default: break;
  }
}
