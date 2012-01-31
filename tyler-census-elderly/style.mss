Map {
  background-color: #111;
}

#water {
  polygon-fill: #117;
}

#tyler {
  line-color: #8fec1e;
  line-width: 2;
  line-opacity: 0.7;
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
   
  [group='under18'] { marker-fill: #EE496C; marker-opacity:0;} // pink
  [group='under25'] { marker-fill: #33AAFF; marker-opacity:0;} // blue
  [group='under40'] { marker-fill: #836643; marker-opacity:0;} // gold
  [group='under65'] { marker-fill: #FFCF48; marker-opacity:0;} // brown
  [group='gte65'] { marker-fill: white; }
  
  [zoom=9] {marker-height:.2;}
  [zoom=10] {marker-height:.3;}
  [zoom=11] {marker-height:.5; }
  [zoom=12] {marker-height:.8; }
  [zoom=13] {marker-height:1; }
  [zoom=14] {marker-height:1.5; }
  [zoom=15] {marker-height:2; }
}