// Basic color palette, from which variations will be derived.
@black:             #111;
@motorway:          #222;
@motorway_fill:     #fff;
@main:               #777;
@main_fill:          #fff;
@street:            #888;
@street_case:        @land;
@service:		    #ccc;
@service_case:	     #ccc;
@path:			    #fff;
@path_case:		    #ededed;
@rail: 			    #444;
@aeroway: 		    #eee;
@white:              #fff;

// ---------------------------------------------------------------------
// Roads are split across 3 layers: #road, #bridge, and #tunnel. Each
// road segment will only exist in one of the three layers. The
// #bridge layer makes use of Mapnik's group-by rendering mode;
// attachments in this layer will be grouped by layer for appropriate
// rendering of multi-level overpasses.

// The main road style is for all 3 road layers and divided into 2 main
// attachments. The 'case' attachment is 

#road, #bridge, #tunnel {
  // casing/outlines & single lines
  ::case[zoom>=6]['mapnik::geometry_type'=2] {
    [class='motorway'] {
      line-join:round;
      line-color: @black;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom<=10] { line-width:1; }
      [zoom>=11] { line-width:1; }
      [zoom>=12] { line-width:1.5; }
      [zoom>=13] { line-width:3.5; }
      [zoom>=14] { line-width:5; }
      [zoom>=15] { line-width:7; }
      [zoom>=16] { line-width:9; }
    }
    [class='motorway_link'][zoom>=10] {
      line-join:round;
      line-color: @black;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=10] { line-width:0.5; }
      [zoom>=11] { line-width:0.5; }
      [zoom>=12] { line-width:1; }
      [zoom>=13] { line-width:1; }
      [zoom>=14] { line-width:3; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:6.5; }
    }
    [class='main'] {
      line-join:round;
      line-color: @black;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom<=10] { line-width:0.5; }
      [zoom=11] { line-width:0.5; }
      [zoom=12] { line-width:0.5; }
      [zoom=13] { line-width:2.5; }
      [zoom=14] { line-width:4; }
      [zoom=15] { line-width:5; }
      [zoom>=16] { line-width:8; }
    }
    [class='street'][zoom>=12],[class='street_limited'][zoom>=13] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: @black;
      [zoom=12] { line-width: 0.5; line-color: lighten(@black,30); }
      [zoom=13] { line-width: 1.5; }
      [zoom=14] { line-width: 2.5; }
      [zoom=15] { line-width: 5; }
      [zoom=16] { line-width: 10; }
      [zoom=17] { line-width: 14; }
      [zoom>=18] { line-width: 20; }
    }
    [class='service'][zoom>=16], {
      line-color: @black;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom=16] { line-width: 6; }
      [zoom=17] { line-width: 10; }
      [zoom>=18] { line-width: 16; }
    } 
  }

  // fill/inlines
  ::fill[zoom>=4]['mapnik::geometry_type'=2] {
    [class='motorway'][zoom>=9] {
      line-join:round;
      #road, #bridge { line-cap:round; }
      line-color: @antique;
      #tunnel { line-color:lighten(@antique,4); }
      [zoom>=10] { line-width:0; }
      [zoom>=11] { line-width:0; }
      [zoom>=12] { line-width:0; }
      [zoom>=13] { line-width:1.5; }
      [zoom>=14] { line-width:3; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:7; }
    }
    [class='motorway_link'][zoom>=14] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color: @antique;
      #tunnel {  line-color:lighten(@antique,4); }
      [zoom>=14] { line-width:1.5; }
      [zoom>=15] { line-width:3; }
      [zoom>=16] { line-width:4.5; }
    }
    [class='main'][zoom>=11] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color: @antique;
      #tunnel { line-color:lighten(@antique,25); }
      [zoom=11] { line-width: 0; }
      [zoom=12] { line-width: 0; }
      [zoom=13] { line-width: 1.5; }
      [zoom=14] { line-width: 2.5; }
      [zoom=15] { line-width: 3; }
      [zoom>=16] { line-width: 6; }
    }
    [class='street'][zoom>=13], {
      line-color: @antique;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom=13] { line-width: 1; }
      [zoom=14] { line-width: 1.5; }
      [zoom=15] { line-width: 3; }
      [zoom=16] { line-width: 8; }
      [zoom=17] { line-width: 12; }
      [zoom>=18] { line-width: 18; }
    }
    [class='street_limited'][zoom>=13], {
      line-color: @antique;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=13] { line-width: 1; }
      [zoom>=14] { line-width: 1.5; }
      [zoom>=15] { line-width: 3.5; }
      [zoom>=16] { line-width: 9; }
    }
    [class='service'][zoom>=16], {
      line-color: @antique;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom=16] { line-width: 4; }
      [zoom=17] { line-width: 8; }
      [zoom>=18] { line-width: 14; }
    }
    [class='major_rail'] {
      line-width: 0.4;
      line-color: @rail;
      [zoom>=16] {
        line-width: 0.75;
      	// Hatching
      	h/line-width: 3;
      	h/line-color: @rail;
      	h/line-dasharray: 1,31;
      }
    }
  }
}
