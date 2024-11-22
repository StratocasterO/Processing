import java.util.List;

class MySampler {
    Zone[][] keyMap;
    List<Zone> zones;
    Summer mix;
    float[] dbtable;

    MySampler() {
        zones = new ArrayList<Zone>();
        mix = new Summer();
        
        
    }

    void addZone(Zone zone) {
        zones.add(zone);
    }

    void noteOn(String key, int vel) {
        
    }

    void noteOn(int key, int vel) {

    }
}
