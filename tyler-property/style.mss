Map {
  background-color: #333;
}

#taxnet {
  line-color: #777;
  line-join: round;
  line-cap: round;
  polygon-fill: #333;
  
  [zoom=17] { line-width: 2.5; }
  [zoom=16] { line-width: 2; }
  [zoom=15] { line-width: 1.5; }
  [zoom=14] { line-width: 1; }
  [zoom=13] { line-width: 0.5; }
  [zoom=12] { line-width: 0; }
  
  /*[year_built >= 1800] [year_built < 1900] { polygon-fill: #1F78B4; } // lightblue
  [year_built >= 1900] [year_built < 1920] { polygon-fill: #A6CEE3; } // darkblue
  [year_built >= 1920] [year_built < 1940] { polygon-fill: #B2DF8A; } // lightgreen
  [year_built >= 1940] [year_built < 1960] { polygon-fill: #33A02C; } // darkgreen
  [year_built >= 1960] [year_built < 1980] { polygon-fill: #FB9A99; } // pink
  [year_built >= 1980] [year_built < 2000] { polygon-fill: #E31A1C; } // red
  [year_built >= 2000] [year_built < 2100] { polygon-fill: #FDBF6F; } // salmon
*/
  [year_built >= 1800] [year_built < 1920] { polygon-fill: #E41A1C; } // red
  [year_built >= 1920] [year_built < 1940] { polygon-fill: #377EB8; } // blue
  [year_built >= 1940] [year_built < 1960] { polygon-fill: #4DAF4A; } // green
  [year_built >= 1960] [year_built < 1980] { polygon-fill: #984EA3; } // purple
  [year_built >= 1980] [year_built < 2000] { polygon-fill: #FF7F00; } // orange
  [year_built >= 2000] [year_built < 2100] { polygon-fill: #FFFF33; } // yellow

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