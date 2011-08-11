Map {
  //background-color: #111;
}

#dots {
  marker-fill:#f00;
  marker-line-width:0;
  marker-allow-overlap: true;
  marker-opacity:1;
  [group="nhasian"] {marker-fill:#FF496C;}
  [group="nhblack"] {marker-fill:#76FF7A;}
  [group="hisp"] {marker-fill:#FFCF48;}
  [group="nhwhite"] {marker-fill:#7366BD;}
  
  [zoom=9] {marker-height:.2;}
  [zoom=10] {marker-height:.3;}
  [zoom=11] {marker-height:.5; marker-opacity:.7;}
  [zoom=12] {marker-height:.8; marker-opacity:.7;}
  [zoom=13] {marker-height:1; marker-opacity:.8;}
  [zoom=14] {marker-height:1.5; marker-opacity:.8;}
  [zoom=15] {marker-height:2; marker-opacity:.8;}
}

#tyler {
  line-color: #2B8CBE;
  line-width: 2.5;
  line-opacity: 0.8;
}

#smith {
  line-color: #FFCFAB;
  line-width: 2.5;
  line-opacity: 0.3;
}
  