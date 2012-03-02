Map {
  background-color: #333;
}

#taxnet {
  line-color: #777;
  line-join: round;
  line-cap: round;
  /*polygon-fill: #333;*/
  
  [zoom=17] { line-width: 2.5; }
  [zoom=16] { line-width: 2; }
  [zoom=15] { line-width: 1.5; }
  [zoom=14] { line-width: 1; }
  [zoom=13] { line-width: 0.5; }
  [zoom=12] { line-width: 0; }

  /*[assessed_value > 0] [assessed_value < 100000] { polygon-fill: #FFFFCC; } // red
  [assessed_value >= 100000] [assessed_value < 200000] { polygon-fill: #C7E9B4; } // blue
  [assessed_value >= 200000] [assessed_value < 300000] { polygon-fill: #7FCDBB; } // green
  [assessed_value >= 300000] [assessed_value < 400000] { polygon-fill: #41B6C4; } // purple
  [assessed_value >= 400000] [assessed_value < 500000] { polygon-fill: #2C7FB8; } // orange
  [assessed_value >= 500000] { polygon-fill: #253494; } // yellow*/
  
  [assessed_value > 0] [assessed_value < 100000] { polygon-fill: #BD0026; }
  [assessed_value >= 100000] [assessed_value < 200000] { polygon-fill: #F03B20; }
  [assessed_value >= 200000] [assessed_value < 300000] { polygon-fill: #FD8D3C; }
  [assessed_value >= 300000] [assessed_value < 400000] { polygon-fill: #FEB24C; }
  [assessed_value >= 400000] [assessed_value < 500000] { polygon-fill: #FED976; }
  [assessed_value >= 500000] { polygon-fill: #FFFFB2; }
  
  /*[owner_city != 'TYLER'] { polygon-fill: red; }*/
}

#tiger_lines {
  // secondary roads
  [mtfcc='S1200'] {
    line-color: #ccc;
    line-join: round;
    line-cap: round;
    
    [zoom=17] { line-width: 3; }
    [zoom=16] { line-width: 2.5; }
    [zoom=15] { line-width: 2; }
    [zoom=14] { line-width: 1.5; }
    [zoom=13] { line-width: 1; }
    [zoom=12] { line-width: 0.5; }
  }
}