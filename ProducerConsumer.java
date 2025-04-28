import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.Semaphore;

public class ProducerConsumer {
    private static final int BUFFER_SIZE = 5;
    private static Queue<Integer> buffer = new LinkedList<>();
    private static Semaphore mutex = new Semaphore(1);
    private static Semaphore empty = new Semaphore(BUFFER_SIZE);
    private static Semaphore full = new Semaphore(0);
    
    public static void main(String[] args) {
        Thread producer = new Thread(() -> {
            try {
                for (int i = 0; i < 10; i++) {
                    empty.acquire();
                    mutex.acquire();
                    
                    buffer.add(i);
                    System.out.println("Produced: " + i);
                    
                    mutex.release();
                    full.release();
                    
                    Thread.sleep(200);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        Thread consumer = new Thread(() -> {
            try {
                for (int i = 0; i < 10; i++) {
                    full.acquire();
                    mutex.acquire();
                    
                    int value = buffer.poll();
                    System.out.println("Consumed: " + value);
                    
                    mutex.release();
                    empty.release();
                    
                    Thread.sleep(300);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        producer.start();
        consumer.start();
        
        try {
            producer.join();
            consumer.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}