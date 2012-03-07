Map {
  background-color: #333;
}

#taxnet {
  line-color: #777;
  line-join: round;
  line-cap: round;
  line-width: 0;

  /*[assessed_value > 0] [assessed_value < 100000] { polygon-fill: #FFFFCC; } // red
  [assessed_value >= 100000] [assessed_value < 200000] { polygon-fill: #C7E9B4; } // blue
  [assessed_value >= 200000] [assessed_value < 300000] { polygon-fill: #7FCDBB; } // green
  [assessed_value >= 300000] [assessed_value < 400000] { polygon-fill: #41B6C4; } // purple
  [assessed_value >= 400000] [assessed_value < 500000] { polygon-fill: #2C7FB8; } // orange
  [assessed_value >= 500000] { polygon-fill: #253494; } // yellow*/
  
  [assessed_value > 0] [assessed_value < 33999] { polygon-fill: #D01C8B; }
  [assessed_value >= 33999] [assessed_value < 67215] { polygon-fill: #F1B6DA; }
  [assessed_value >= 67215] [assessed_value < 105630] { polygon-fill: #F7F7F7; }
  [assessed_value >= 105630] [assessed_value < 163964] { polygon-fill: #B8E186; }
  [assessed_value >= 163964] { polygon-fill: #4DAC26; }
}

#tiger_lines {
  // secondary roads
  [mtfcc='S1200'] {
    line-color: #888;
    line-join: round;
    line-cap: round;
    
    [zoom=15] { line-width: 2; }
    [zoom=14] { line-width: 1.5; }
    [zoom=13] { line-width: 1; }
    [zoom=12] { line-width: 0.5; }
  }
  // local roads
  [mtfcc='S1400'] {
    line-color: #555;
    line-join: round;
    line-cap: round;
    
    [zoom=15] { line-width: 1.5; }
    [zoom=14] { line-width: 1.0; }
    [zoom=13] { line-width: 0.5; }
    [zoom=12] { line-width: 0; }
  }
}