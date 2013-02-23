class Wave
{
  SineWave sine;
   
  Wave(SineWave _sine)
  {
    sine = _sine;
  }
  
  void drawWaves() //Draws the wave which is manipulated as keys are played
  {
    strokeWeight(3);
    stroke(#58FF00);
    for(int i = 0; i < out.bufferSize() - 1; i++)
    {
      float x1 = map(i, 0, out.bufferSize(), 75, 725);
      float x2 = map(i+1, 0, out.bufferSize(), 75, 725);
      line(x1, 100 + out.left.get(i)*50, x2, 100 + out.left.get(i+1)*50);
    }
  }
  
  void addWaves() //Outputs the tones of keys that are played
  {
    for(int i=0;i<keys.length;i++)
    {
      if(keyStates[i])
      {
        sine = new SineWave(tones[i], amp, out.sampleRate());
        sine.portamento(40);
        out.addSignal(sine);
      }
    } 
  }
  
}
