import java.util.ArrayList;
import java.util.List;

public class KMeans {

    public static void main(String[] args) {
        Point[] dataPoints = {
                new Point(2, 10), new Point(2, 5), new Point(8, 4),
                new Point(5, 8), new Point(7, 5), new Point(6, 4),
                new Point(1, 2), new Point(4, 9)
        };
        int k = 3;

        List<Point>[] clusters = kMeans(dataPoints, k);

        for (int i = 0; i < clusters.length; i++) {
            System.out.println("Cluster " + (i + 1) + ": " + clusters[i]);
        }
    }

    private static List<Point>[] kMeans(Point[] dataPoints, int k) {
        List<Point>[] clusters = new ArrayList[k];
        for (int i = 0; i < k; i++)
         clusters[i] = new ArrayList<>();
        Point[] centroids = new Point[k];

        for (int i = 0; i < k; i++)
         centroids[i] = dataPoints[i];

        while (true) {
            for (Point point : dataPoints)
             clusters[getNearestCentroidIndex(point, centroids)].add(point);
            Point[] newCentroids = new Point[k];

            for (int i = 0; i < k; i++) 
            newCentroids[i] = calculateCentroid(clusters[i]);

            if (areCentroidsEqual(centroids, newCentroids)) break;

            for (List<Point> cluster : clusters) 
            cluster.clear();
            System.arraycopy(newCentroids, 0, centroids, 0, k);
        }

        return clusters;
    }

    private static Point calculateCentroid(List<Point> cluster) {
        double sumX = 0, sumY = 0;
        for (Point point : cluster) {
            sumX += point.getX();
            sumY += point.getY();
        }
        int size = cluster.size();
        return new Point(sumX / size, sumY / size);
    }

    private static boolean areCentroidsEqual(Point[] centroids1, Point[] centroids2) {
        for (int i = 0; i < centroids1.length; i++) {
            if (!centroids1[i].equals(centroids2[i])) return false;
        }
        return true;
    }

    private static int getNearestCentroidIndex(Point point, Point[] centroids) {
        int nearestIndex = 0;
        double nearestDistance = Double.MAX_VALUE;

        for (int i = 0; i < centroids.length; i++) {
            double distance = point.distanceTo(centroids[i]);
            if (distance < nearestDistance) {
                nearestIndex = i;
                nearestDistance = distance;
            }
        }

        return nearestIndex;
    }

    private static class Point {
        private double x, y;

        public Point(double x, double y) {
            this.x = x;
            this.y = y;
        }

        public double getX() {
            return x;
        }

        public double getY() {
            return y;
        }

        public double distanceTo(Point other) {
            double dx = this.x - other.x;
            double dy = this.y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj) return true;
            if (obj == null || getClass() != obj.getClass()) return false;
            Point point = (Point) obj;
            return Double.compare(point.x, x) == 0 && Double.compare(point.y, y) == 0;
        }

        @Override
        public int hashCode() {
            return Double.hashCode(x) + Double.hashCode(y);
        }

        @Override
        public String toString() {
            return "(" + x + ", " + y + ")";
        }
    }
}
