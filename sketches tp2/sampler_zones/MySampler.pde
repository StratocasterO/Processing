import java.util.ArrayList;

class MySampler{
    Zone[][] keyMap;
    ArrayList<Zone> zones;
    Summer mix;
    float[] dbtable;

    MySampler() {
        zones = new ArrayList<Zone>();
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

    void noteOn(String key, int vel) {
        int freq = round(Frequency.ofPitch("G#3").asMidiNote());

    }

    void noteOn(int key, int vel) {

    }
}