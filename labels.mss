// =====================================================================
// LABELS

@name: '[name_en]';

// ---------------------------------------------------------------------
// Fonts

@fallback: 'Arial Unicode MS Regular';

@serif: "Crimson Roman";
@serif_semibd: "Crimson Semibold";
@serif_bd: "Crimson Bold";
@serif_it: "Crimson Italic";
@serif_semibd_it: "Crimson Semibold Italic";
@serif_bd_it: "Crimson Bold Italic";

// ---------------------------------------------------------------------
// Marine

#marine_label {
  text-name: @name;
  text-face-name: @serif_semibd_it;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-fill: #000;
  text-size: 10;
  text-character-spacing: 1;
  // Some marine labels should be drawn along a line 
  // rather than on a point (the default)
  [placement='line'] {
    text-placement: line;
    text-avoid-edges: true;
  }
  // Oceans
  [labelrank=1] { 
    text-size: 18;
    text-wrap-width: 120;
    text-character-spacing:	4;
    text-line-spacing:	8;
  }
  [labelrank=2] { text-size: 14; }
  [labelrank=3] { text-size: 11; }
  [zoom>=5] {
    text-size: 12;
    [labelrank=1] { text-size: 22; }
    [labelrank=2] { text-size: 16; }
    [labelrank=3] {
      text-size: 14;
      text-character-spacing: 2;
     }
   }
}

// ---------------------------------------------------------------------
// Cities, towns, villages, etc
// City labels with dots for low zoom levels.
// The separate attachment keeps the size of the XML down.
#place_label::citydots[type='city'][zoom>=4][zoom<=7][localrank<=3] {
  // explicitly defining all the `ldir` values wer'e going
  // to use shaves a bit off the final project.xml size
  [ldir='N'],[ldir='S'],[ldir='E'],[ldir='W'],
  [ldir='NE'],[ldir='SE'],[ldir='SW'],[ldir='NW'] {
    shield-file: url('img/dot-8.svg');
    shield-unlock-image: true;
    shield-name: @name;
    shield-size: 12;
    shield-face-name: @serif_bd;
    shield-placement: point;
    shield-fill: #333;
    shield-halo-fill:  @antique;
    shield-halo-radius: 1;
    shield-halo-rasterizer: fast;
    shield-text-transform: uppercase;
    [ldir='E'] { shield-text-dx: 5; }
    [ldir='W'] { shield-text-dx: -5; }
    [ldir='N'] { shield-text-dy: -5; }
    [ldir='S'] { shield-text-dy: 5; }
    [ldir='NE'] { shield-text-dx: 4; shield-text-dy: -4; }
    [ldir='SE'] { shield-text-dx: 4; shield-text-dy: 4; }
    [ldir='SW'] { shield-text-dx: -4; shield-text-dy: 4; }
    [ldir='NW'] { shield-text-dx: -4; shield-text-dy: -4; }
    [zoom=5]{
      shield-size: 14;
      }
    [zoom=6]{
      shield-size: 15;
      }
    [zoom=7]{
      shield-size: 16;
      }
  }
}

#place_label[zoom>=8][localrank<=3] {
  text-name: @name;
  text-face-name: @serif_bd;
  text-wrap-width: 170;
  text-wrap-before: true;
  text-transform: uppercase;
  text-fill: #333;
  text-allow-overlap: false;
  text-halo-fill: @antique;
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-size: 10;
  [type='city'][zoom>=8][zoom<=22] {
  	text-face-name: @serif_semibd;
    text-size: 16;
    text-fill: #555;
   [zoom=8] { 
      text-fill: #000;
      text-face-name: @serif_semibd;
      text-size: 18;
      text-wrap-width: 140;
      text-line-spacing: -8;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom=9] { 
      text-fill: #000;
      text-face-name: @serif_semibd;
      text-size: 18;
      text-wrap-width: 160;
      text-line-spacing: -8;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom=10] { 
      text-fill: #000;
      text-face-name: @serif_semibd;
      text-size: 16;
      text-wrap-width: 140;
      text-line-spacing: -8;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom=11] { 
      text-fill: #000;
      text-face-name: @serif_semibd;
      text-size: 18;
      text-wrap-width: 140;
      text-line-spacing: -8;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom>=12] { 
      text-fill: #000;
      text-face-name: @serif_semibd;
      text-size: 22;
      text-wrap-width: 350;
      text-line-spacing: -8;
      text-halo-radius: 2.5;
    }
   [zoom>=14] { 
      text-face-name: @serif_semibd;
      text-size: 30;
      text-wrap-width: 500;
      text-line-spacing: -18;
      text-halo-radius: 3;
    }
    // Hide at largest scales:
    [zoom>=16] { text-name: "''"; }
  }
  [type='town'] {
    text-face-name: @serif_semibd;
    text-size: 14;
    [zoom>=12] { text-size: 16; }
    [zoom>=14] { text-size: 20; }
    [zoom>=16] { text-size: 24; }
    // Hide at largest scales:
    [zoom>=18] { text-name: "''"; }
  }
  [type='village'] {
    text-size: 12;
    [zoom>=14] { text-size: 14; text-line-spacing: -18; }
    [zoom>=16] { text-size: 18; text-line-spacing: -18; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-fill: #000;
    text-face-name:	@serif_bd;
    text-transform: uppercase;
    text-character-spacing: 0;
    text-halo-radius: 1;
    text-halo-fill: fadeout(@antique,50);
    text-line-spacing: -12;
    text-avoid-edges: true;
    text-wrap-width: 130;
    text-size: 10;
    text-allow-overlap: false;
    [zoom=13] {
      text-size: 11;
      text-halo-radius: 1.5;
      text-fill: #000;
      text-face-name:	@serif_bd;
      text-line-spacing: -16;
      text-wrap-width: 180;
    }
    [zoom=14] { 
      text-size: 14; 
      text-halo-radius: 2; 
      text-fill: #000;
      text-line-spacing: -18;
      text-face-name: @serif_bd;
      text-wrap-width: 180;
    }
    [zoom>=15] { 
      text-size: 18; 
      text-wrap-width: 180; 
      text-character-spacing: 1; 
      text-halo-radius: 2.5;
      text-fill: #000;
      text-line-spacing: -10;
      text-halo-fill: fadeout(@antique,30);
      text-face-name: @serif_bd;
    }
    [zoom>=16] { 
      text-size: 18; 
      text-character-spacing: 2; 
      text-halo-radius: 2; 
      text-fill: #000;
    }
  }
}

// ---------------------------------------------------------------------
// Roads

#road_label {
  [class='main'][zoom>=14] {
    text-name: @name;
    text-face-name: @serif_it;
    text-placement: line;  // text follows line path
    text-size: 10;
    text-character-spacing: -1;
    text-avoid-edges: true;  // prevents clipped labels at tile edges
    text-halo-radius: 0;
    text-halo-rasterizer: fast;
    text-min-distance: 100;
    //text-allow-overlap: false;
    text-fill: #333;
    text-min-padding: 5;
    [zoom=14] { 
      text-size: 10;
      text-halo-radius: 1.5;
      text-fill: #333;
      text-halo-fill: @antique;
      }
    [zoom=15] { 
      text-size: 12;
      text-halo-radius: 1;
      text-fill: #333;
      text-halo-fill: @antique;
      }
    [zoom=16] { 
      text-size: 13;      
      text-halo-radius: 1;
      text-halo-fill: @antique;
      text-fill: #333;
      }
     [zoom>=17] { 
      text-size: 13;      
      text-halo-radius: 1;
      text-halo-fill: @antique;
      text-fill: #333;
      }
    }
  [class='street'][zoom>=15], [class='street_limited'][zoom>=15] {
  text-name: @name;
  text-placement: line;
  text-face-name: @serif_it;
  text-fill: #111;
  text-halo-fill: @antique;
  text-halo-radius: 0.75;
  text-halo-rasterizer: fast;
  text-size: 8;
  text-character-spacing: 0;
  text-avoid-edges: true;
  text-min-distance: 70;
  text-allow-overlap: false;
  [zoom>=15] { 
      text-size: 11; 
      text-halo-radius: 1;
      text-halo-fill: @antique;
      }
    }
  }


// ---------------------------------------------------------------------
// Water
#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @serif_bd_it;
    text-transform: uppercase;
    text-fill: darken(@water, 15);
    text-size: 14;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-character-spacing: 1;
  }
}
