Map {
  background-color: #111;
}

#water {
  polygon-fill: #117;
}

#tyler {
  line-color: #2B8CBE;
  line-width: 2.5;
  line-opacity: 0;
}

#smith {
  line-color: #FFCFAB;
  line-width: 2.5;
  line-opacity: 0.3;
}
  

#tiger_lines {
  // secondary roads
  [mtfcc='S1200'] {
    line-color: #a7a7a7;
    line-opacity: 0.7;
    line-join: round;
    line-cap: round;
    
    [zoom=17] { line-width: 3.5; }
    [zoom=16] { line-width: 3; }
    [zoom=15] { line-width: 2.5; }
    [zoom=14] { line-width: 2; }
    [zoom=13] { line-width: 1.5; }
    [zoom=12] { line-width: 1; }
  }
  // local roads
  [mtfcc='S1400'] {
    line-opacity: 0.3;
    line-color: #d1d1d1;
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

#age_dots {
  marker-fill:#f00;
  marker-line-width:0;
  marker-allow-overlap: true;
  marker-opacity:1;
  
  [group='under18'] { marker-fill: #EE496C; } // pink
  [group='under25'] { marker-fill: #33AAFF; } // blue
  [group='under40'] { marker-fill: #836643; } // gold
  [group='under65'] { marker-fill: #FFCF48; } // brown
  [group='gte65'] { marker-fill: white; }
  
  [zoom=9] {marker-height:.2;}
  [zoom=10] {marker-height:.3;}
  [zoom=11] {marker-height:.5; marker-opacity:.7;}
  [zoom=12] {marker-height:.8; marker-opacity:.7;}
  [zoom=13] {marker-height:1; marker-opacity:.8;}
  [zoom=14] {marker-height:1.5; marker-opacity:.8;}
  [zoom=15] {marker-height:2; marker-opacity:.8;}
}