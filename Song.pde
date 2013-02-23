class Song
{  
  char keys[];
  boolean keyStates[];
  int whiteKeys[];
  int blackKeys[];
  
  Song(char _keys[], boolean _keyStates[], int _whiteKeys[], int _blackKeys[])
  {
    keys = _keys;
    keyStates = _keyStates;
    whiteKeys = _whiteKeys;
    blackKeys = _blackKeys;
  }
  
  void showPlayedKeys() //Highlights which keys are being played
  {
    stroke(0);
    for(int i=0;i<keys.length;i++)
    {
      if(keyStates[i]) 
      {
        for (int j=0;j<whiteKeys.length;j++){ //White keys
          if (whiteKeys[j]==i){
            pushMatrix();
            if (j>7){
              translate(-40, 0, 0);
            }
            translate(75, height/2, 0);
            rotateX(-PI/6);
            translate(40*(j+1), 0, 0);
            fill(i*(280/26), 255, 255);
            box(40, 40, 160);
            popMatrix();
          }
        }
        for (int k=0;k<blackKeys.length;k++){ //Black keys
          if (blackKeys[k]==i){
            pushMatrix();
            translate(95, height/2 - 30, 0);
            rotateX(-PI/6);
            if (k>6){
              translate(120, 0, 0);
            }
            else if (k>4){
              translate(80, 0, 0);
            } 
            else if (k>1){
              translate(40, 0, 0);
            }
            translate(40*(k+1), 0, 0);
            fill(i*(280/26), 255, 255);
            box(20, 20, 100);
            popMatrix();
          }
        }
      }
    }
  }
  
  void showNotes() //Draws the note letters below the keys being played
  {
    int x= 115;
    int y = 65;
    textSize(16);
   
    for(int i=0;i<keys.length;i++)
    {
      if(keyStates[i])
      {
        fill(255);
        text(notes[i], y+(i*23), 340);
      }
    }  
  }
  
}
