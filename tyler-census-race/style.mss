Map {
  //background-color: #b8dee6;
}

#race {
  polygon-opacity: 0.7;
  polygon-fill: #CCC;
  [nhasianpct > 0.65] {polygon-fill:#CE1256;}
  [nhasianpct > 0.65] {polygon-fill:#FF496C;}
  [hisppct > 0.50] {polygon-fill:#FDAE6B;}
  [hisppct > 0.65] {polygon-fill:#F16913;}
  [nhblackpct > 0.50] {polygon-fill:#238B45;}
  [nhblackpct > 0.65] {polygon-fill:#005A32;}
  [nhwhitepct > 0.50] {polygon-fill:#6A51A3;}
  [nhwhitepct > 0.65] {polygon-fill:#4A1486;}
}
