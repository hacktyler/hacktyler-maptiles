Map {
  background-color: #F3EFE9;
}

#park_centroids,
#school_centroids {
  ::labels {
    text-name: "[name]";
    text-face-name: "Arial Bold";
    text-size: 12;
    text-placement: point;
    text-fill: #000;
    text-opacity: 0;
    text-halo-fill: #e9e9e9;
    text-halo-radius: 3;
    //text-avoid-edges: true;
    text-wrap-width: 20;
    
    [zoom>=15] {
      text-opacity: 1.0;
    }
  }
}

#centerline_merged {
  ::labels {
    text-name: "[fullname]";
    text-face-name: "Arial Bold";
    text-size: 10;
    text-placement: line;
    text-fill: #666;
    text-opacity: 0;
    text-halo-fill: #e9e9e9;
    text-halo-radius: 2;

    [zoom=13],
    [zoom=14],
    [zoom=15],
    [zoom=16] {
      text-size: 14;
      text-halo-radius: 3;
      [fullname='E FRONT ST'] { text-opacity: 1.0; }
      [fullname='W FRONT ST'] { text-opacity: 1.0; }
      [fullname='N BROADWAY AVE'] { text-opacity: 1.0; }
      [fullname='S BROADWAY AVE'] { text-opacity: 1.0; }
      [fullname='N BECKHAM AVE'] { text-opacity: 1.0; }
      [fullname='S BECKHAM AVE'] { text-opacity: 1.0; }
      [fullname='N GLENWOOD BLVD'] { text-opacity: 1.0; }
      [fullname='S GLENWOOD BLVD'] { text-opacity: 1.0; }
      [fullname='W GENTRY PKWY'] { text-opacity: 1.0; }
      [fullname='W 5TH ST'] { text-opacity: 1.0; }
      [fullname='E 5TH ST'] { text-opacity: 1.0; }
      [fullname='TROUP HWY'] { text-opacity: 1.0; }
      [fullname='FRANKSTON HWY'] { text-opacity: 1.0; }
      [fullname='OLD JACKSONVILLE WHY'] { text-opacity: 1.0; }
    }
    [zoom=17] {
      text-opacity: 1.0;
    }
  }
}

#tyler {
  line-color: #000000;
  line-opacity: 1;
    
  [zoom=17] { line-width: 2; }
  [zoom=16] { line-width: 2; }
  [zoom=15] { line-width: 2; }
  [zoom=14] { line-width: 2; }
  [zoom=13] { line-width: 2; }
  [zoom=12] { line-width: 2; }
}

#bike_routes {
  line-width: 5;
  line-join: round;
  line-cap: square;
  line-opacity: 0.8;
  
  [zoom=17] { line-width: 5; line-dasharray: 5,10; }
  [zoom=16] { line-width: 4; line-dasharray: 4,8; }
  [zoom=15] { line-width: 3.5; line-dasharray: 4,8; }
  [zoom=14] { line-width: 3; line-dasharray: 3,6; }
  [zoom=13] { line-width: 2.5; line-dasharray: 3,6; }
  [zoom=12] { line-width: 2; line-dasharray: 3,6; }
  
  [route_lane='ROUTE'] { line-color: #4f4fc9; }
  [route_lane='LANE'] { line-color: #dd00ff; }
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

#centerline {
  // I20, Loop 323, Highways and major arterials
  [rd_type=8],
  [rd_type=5],
  [rd_type=4],
  [rd_type=3] {
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
  // County and city roads
  [rd_type=11],
  [rd_type=10],
  [rd_type=9],
  [rd_type=7],
  [rd_type=6],
  [rd_type=2],
  [rd_type=1], {
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

#schools {
    polygon-fill: #ac7564;
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