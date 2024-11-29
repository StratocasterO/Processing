import java.util.ArrayList;

class MySampler{
    Zone[][] keyMap;
    ArrayList<Zone> zones;
    Summer mix;
    float[] dbtable;

    MySampler() {
        zones = new ArrayList<Zone>();
        keyMap = new Zone[128][128];
        mix = new Summer();
        
        dbtable = new float[128];
    }

    void addZone(Zone zone) {
        zones.add(zone);

        for (int i = zone.lowKey; i <= zone.highKey; i++) {
            for (int j = zone.lowVel; j <= zone.highVel; j++) {
                keyMap[i][j] = zone;
            }
        }
    }

    // noteOn amb notes escrites ("C3", "G4", "Eb5")
    void noteOn(String key, int vel) {
        int note = round(Frequency.ofPitch(key).asMidiNote());
        Zone zone = keyMap[note][vel];
        zone.noteOn(note, vel);
    }

    void noteOn(int key, int vel) {
        Zone zone = keyMap[key][vel];
        zone.noteOn(key, vel);
    }
}
