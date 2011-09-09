Map {
  background-color: #F3EFE9;
}

#tyler {
  line-color: #791f1f;
  line-width: 4;
  line-opacity: 0.5;
    
  [zoom=17] { line-width: 7; }
  [zoom=16] { line-width: 6; }
  [zoom=15] { line-width: 5; }
  [zoom=14] { line-width: 4; }
  [zoom=13] { line-width: 3; }
  [zoom=12] { line-width: 2; }
}

#parks {
  polygon-fill: #47b347;
  line-color: #117d11;
  
  [zoom=17] { line-width: 1.25; }
  [zoom=16] { line-width: 1; }
  [zoom=15] { line-width: 0.5; }
  [zoom=14] { line-width: 0.25; }
  [zoom=13] { line-width: 0.25; }
  [zoom=12] { line-width: 0.25; }
}

#sidewalks {
  line-color: #9f8e4b;
  line-join: round;
  line-cap: round;
  
  [zoom=17] { line-width: 3.5; }
  [zoom=16] { line-width: 3; }
  [zoom=15] { line-width: 2; }
  [zoom=14] { line-width: 1.5; }
  [zoom=13] { line-width: 1; }
  [zoom=12] { line-width: 0.5; }
}

#bike_routes {
  line-width: 5;
  line-join: round;
  line-cap: square;
  line-opacity: 0.7;
  
  [zoom=17] { line-width: 5; line-dasharray: 5,10; }
  [zoom=16] { line-width: 4; line-dasharray: 4,8; }
  [zoom=15] { line-width: 3.5; line-dasharray: 4,8; }
  [zoom=14] { line-width: 3; line-dasharray: 3,6; }
  [zoom=13] { line-width: 2.5; line-dasharray: 3,6; }
  [zoom=12] { line-width: 2; line-dasharray: 3,6; }
  
  [route_lane='ROUTE'] { line-color: #4f4fc9; }
  [route_lane='LANE'] { line-color: #dd00ff; }
}

#structures {
  building-fill: #eceade;
  building-height: 2;
  
  [zoom=17] { building-height: 3; }
  [zoom=16] { building-height: 2.5; }
  [zoom=15] { building-height: 2; }
  [zoom=14] { building-height: 1.5; }
  [zoom=13] { building-height: 0.5; }
  [zoom=12] { building-height: 0; }
}

#tiger_lines {
  // secondary roads
  [mtfcc='S1200'] {
    line-color: #a7a7a7;
    line-join: round;
    line-cap: round;
    
    [zoom=17] { line-width: 3; }
    [zoom=16] { line-width: 2.5; }
    [zoom=15] { line-width: 2; }
    [zoom=14] { line-width: 1.5; }
    [zoom=13] { line-width: 1; }
    [zoom=12] { line-width: 0.5; }
  }
  // local roads
  [mtfcc='S1400'] {
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

#bus_stops {
  marker-width: 5;
  marker-fill: red;
  marker-line-color: white;
  marker-line-width: 1;
  marker-allow-overlap: true;
  
  [color='Red'] { marker-fill: red; }
  [color='Green'] { marker-fill: green; }
  [color='Blue'] { marker-fill: blue; }
  [color='Yellow'] { marker-fill: yellow; }
  
  [zoom=17] { marker-width: 5; }
  [zoom=16] { marker-width: 4; }
  [zoom=15] { marker-width: 3; }
  [zoom=14] { marker-width: 2.5; }
  [zoom=13] { marker-width: 0; }
  [zoom=12] { marker-width: 0; }
}